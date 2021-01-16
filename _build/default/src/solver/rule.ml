open SlangAST.Node

type t = SlangAST.Node.t

let is_rule node =
  match node with
  | Rule _ -> true
  | _ -> false

let get_rules program =
  match program with
  | Program (decls, _) -> List.filter is_rule decls
  | _ -> failwith "wrong AST"

let get_fun_name rule =
  match rule with
  | Rule (_, FunType (_, FunName (fun_name, _), _, _), _) -> fun_name
  | _ -> failwith "wrong AST"

let get_fun_type rule =
  match rule with
  | Rule (_, fun_type, _) -> fun_type
  | _ -> failwith "wrong AST"

let print rule =
  Format.printf "%a@." SlangAST.Node.pp rule

let encode_fun_type mapping preconds ctx fun_type =
  let e = Helpers.get_expr_helpers ctx in
  let bv = Helpers.get_bv_helpers mapping ctx in

  let is_zero_or_one_bit_set bv =
    (e.beq (e.bvand bv (e.bvsub bv (e.bv_mk_numeral 1L))) (e.bv_mk_numeral 0L)) in
  
  let is_one_bit_set bv =
    (e.band [(is_zero_or_one_bit_set bv); (e.bnot (e.beq bv (e.bv_mk_numeral 0L)))]) in

  let encode_subtype i subtype =
    let eq_expr = (e.beq (e.x i "t") (bv.of_unrefined_type subtype)) in

    let possible_refinements_bits = Mapping.get_possible_refinements_bits mapping subtype in
    let possible_refinements_bv = (e.bv_mk_numeral possible_refinements_bits) in
    let possible_refinements_expr = (e.is possible_refinements_bv (e.x i "r")) in

    let preconds_of_st = Preconds.preconds_of_unrefined_type_name mapping preconds subtype in
    let precond_exprs =
      List.map
        (fun (r_names_bits, is_xor) ->
          let precond_bv = (e.bv_mk_numeral r_names_bits) in
          if is_xor then
            (is_one_bit_set (e.bvand (e.x i "r") precond_bv))
          else (* "or" *)
            (is_zero_or_one_bit_set (e.bvand (e.x i "r") precond_bv)) )
        preconds_of_st in

    (e.band (eq_expr :: possible_refinements_expr :: precond_exprs)) in

  let encode_unrefined_type i unrefined_type =
    (* Assume no double+ ptr *)
    match unrefined_type with
    | PtrType (BaseType (ut_name, _), _) ->
      let subtype_names = Mapping.get_subtype_names mapping (ut_name ^ "*") in
      (e.bor (List.map (encode_subtype i) subtype_names))
    | BaseType (ut_name, _) ->
      let subtype_names = Mapping.get_subtype_names mapping ut_name in
      (e.bor (List.map (encode_subtype i) subtype_names))
    | DotType (_) -> (e.btrue)
    | _ -> failwith "wrong AST" in

  let encode_type i ty =
    match ty with
    | Type (unrefined_type, None, _) -> encode_unrefined_type i unrefined_type
    | _ -> failwith "wrong AST" in

  match fun_type with
  | FunType (_, _, ParamTypeList (param_types, _), _) ->
    List.mapi encode_type param_types
  | _ -> failwith "wrong AST"

let encode_fun_spec mapping ctx fun_spec =
  let e = Helpers.get_expr_helpers ctx in
  let bv = Helpers.get_bv_helpers mapping ctx in

  let bv_of_bpt bpt =
    (* Assume no double+ ptr *)
    match bpt with
    | PtrType (BaseType (ut_name, _), _) -> (bv.of_unrefined_type (ut_name ^ "*"))
    | BaseType (ut_name, _) -> (bv.of_unrefined_type ut_name)
    | _ -> failwith "wrong AST" in

  let rec encode_refinement i refinement =
    match refinement with
    | RefinedByAnd (r1, r2, _) -> (e.band [encode_refinement i r1; encode_refinement i r2])
    | RefinedByOr (r1, r2, _) -> (e.bor [encode_refinement i r1; encode_refinement i r2])
    | RefinedByNot (r, _) -> (e.bnot (encode_refinement i r))
    | RefinePredicate (r_name, _) -> (e.is (e.x i "r") (bv.of_refinement r_name))
    | _ -> failwith "wrong AST" in

  let encode_type i ty =
    match ty with
    | Type (unrefined_type, refinement', _) ->
      let refinement_expr =
        match refinement' with
        | Some (Refinement (refinement, _)) -> encode_refinement i refinement
        | None -> (e.btrue)
        | _ -> failwith "wrong AST" in
      begin match unrefined_type with
      | SharpType (bpt, _) ->
        (e.band [(e.beq (e.x i "t") (bv_of_bpt bpt)); refinement_expr])
      | PtrType _ | BaseType _ as bpt ->
        (e.bor [
          (e.band [(e.beq (e.x i "t") (bv_of_bpt bpt)); refinement_expr]);
          (e.band [(e.bnot (e.beq (e.x i "t") (bv_of_bpt bpt))); (e.is (e.x i "t") (bv_of_bpt bpt))]) ])
      | DotType _ -> (e.btrue)
      | _ -> failwith "wrong AST"
      end
    | _ -> failwith "wrong AST" in

  match fun_spec with
  | FunSpec (_, _, ParamTypeList (param_types, _), _) ->
    (e.bnot (e.band (List.mapi encode_type param_types)))
  | _ -> failwith "wrong AST"

let encode mapping preconds ctx rule =
  match rule with
  | Rule (FunSpecList (fun_specs, _), fun_type, _) ->
    let fun_type_exprs = encode_fun_type mapping preconds ctx fun_type in
    let fun_spec_exprs = List.map (encode_fun_spec mapping ctx) fun_specs in
    fun_type_exprs @ fun_spec_exprs
  | _ -> failwith "wrong AST"

let get_indep_param_types fun_specs =
  let is_same acc fun_spec =
    match fun_spec with
    | FunSpec (_, _, ParamTypeList (param_types, _), _) ->
      List.map2
        (fun prev' cur ->
          match prev' with
          | Some prev ->
            let prev_str = Format.asprintf "%a@." SlangAST.Node.pp prev in
            let cur_str = Format.asprintf "%a@." SlangAST.Node.pp cur in
            if prev_str = cur_str then Some cur else None
          | None -> None )
        acc
        param_types
    | _ -> failwith "wrong AST" in

  let first_param_types =
    match fun_specs with
    | FunSpec (_, _, ParamTypeList (param_types, _), _) :: _ -> param_types
    | _ -> failwith "wrong AST" in

  List.fold_left is_same (List.map (fun t -> Some t) first_param_types) fun_specs

let get_indep_param_rules indep_param_types fun_type =
  let sp = SourcePosition.mk (-1) (-1) in

  let get_indep_param_rule rt fn i (spec', ty) =
    match spec' with
    | Some spec ->
      let new_fun_name = FunName (fn ^ "_IndepParam_" ^ (string_of_int i), sp) in
      Some ( Rule (
        FunSpecList ([FunSpec (rt, new_fun_name, ParamTypeList ([spec], sp), sp)], sp),
        FunType (rt, new_fun_name, ParamTypeList ([ty], sp), sp),
        sp ))
    | None -> None in

  match fun_type with
  | FunType (return_type, FunName (fun_name, _), ParamTypeList (param_types, _), _) ->
    List.combine indep_param_types param_types
    |> List.mapi (get_indep_param_rule return_type fun_name)
    |> List.filter_map (fun r' -> r')
  | _ -> failwith "wrong AST"

let get_dep_param_rule indep_param_types fun_specs fun_type =
  let sp = SourcePosition.mk (-1) (-1) in

  let dep_param_indexes =
    List.mapi (fun i t' -> if t' = None then Some i else None) indep_param_types
    |> List.filter_map (fun i' -> i') in
  
  let dep_param_indexes_str = String.concat "_" (List.map string_of_int dep_param_indexes) in

  let get_dep_param_types param_types =
    let (_, dep_param_types) =
      List.combine indep_param_types param_types
      |> List.filter (fun (spec', _) -> spec' = None)
      |> List.split in
    dep_param_types in

  let new_fun_type =
    match fun_type with
    | FunType (return_type, FunName (fun_name, _), ParamTypeList (param_types, _), _) ->
      let new_fun_name = FunName (fun_name ^ "_DepParams_" ^ dep_param_indexes_str, sp) in
      let new_param_type_list = ParamTypeList (get_dep_param_types param_types, sp) in
      FunType (return_type, new_fun_name, new_param_type_list, sp)
    | _ -> failwith "wrong AST" in
  
  let get_new_fun_spec fun_spec =
    match fun_spec with
    | FunSpec (return_type, FunName (fun_name, _), ParamTypeList (param_types, _), _) ->
      let new_fun_name = FunName (fun_name ^ "_DepParams_" ^ dep_param_indexes_str, sp) in
      let new_param_type_list = ParamTypeList (get_dep_param_types param_types, sp) in
      FunSpec (return_type, new_fun_name, new_param_type_list, sp)
    | _ -> failwith "wrong AST" in
  let new_fun_specs = List.map get_new_fun_spec fun_specs in

  Rule (FunSpecList (new_fun_specs, sp), new_fun_type, sp)

let split rule =
  match rule with
  | Rule (FunSpecList (fun_specs, _), fun_type, _) ->
    let indep_param_types = get_indep_param_types fun_specs in
    let indep_param_rules = get_indep_param_rules indep_param_types fun_type in
    let dep_param_rule = get_dep_param_rule indep_param_types fun_specs fun_type in
    indep_param_rules @ [dep_param_rule]
  | _ -> failwith "wrong AST"
