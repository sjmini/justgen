open Z3
open SlangAST.Node

type t = (string * int64) list

let create model =
  let const_decls = Model.get_const_decls model in
  List.map
    (fun const_decl ->
      match Model.get_const_interp model const_decl with
      | Some bv_numeral ->
        let const_name = Symbol.get_string (FuncDecl.get_name const_decl) in
        let bits = Int64.of_string ("0u" ^ BitVector.numeral_to_string bv_numeral) in
        (const_name, bits)
      | None -> failwith "wrong model" )
    const_decls

let print cx =
  List.iter
    (fun (const_name, bits) -> Printf.printf "%s = 0x%Lx\n" const_name bits)
    cx

let encode ctx cx =
  let e = Helpers.get_expr_helpers ctx in

  let exprs =
    List.map
      (fun (const_name, bits) ->
        (e.beq (e.bv_mk_const const_name) (e.bv_mk_numeral bits)) )
      cx in
  (e.bnot (e.band exprs))

let to_fun_unspec mapping original_rule cx =
  let sp = SourcePosition.mk (-1) (-1) in

  let is_set bits i =
    let mask = Int64.shift_left 1L i in
    Int64.logand bits mask = mask in

  let type_of_bitss (_, ut_bits) (_, r_bits) =
    let ut_name = Mapping.unrefined_type_name_of_bits mapping ut_bits in
    let unrefined_type =
      if String.contains ut_name '*' then
        let base_ut_name = String.sub ut_name 0 (String.length ut_name - 1) in
        PtrType (BaseType (base_ut_name, sp), sp)
      else
        BaseType (ut_name, sp) in
    
    let possible_refinement_bits = Mapping.get_possible_refinements_bits mapping ut_name in
    let rec loop i is_first acc =
      if i >= Constants.bv_size then
        acc
      else if is_set possible_refinement_bits i then
        let bits = Int64.shift_left 1L i in
        let r_name =
          Mapping.refinement_name_of_bits_and_unrefined_type_name mapping bits ut_name in
        let refinement =
          if is_set r_bits i then RefinePredicate (r_name, sp)
          else RefinedByNot (RefinePredicate (r_name, sp), sp) in
        if is_first then
          loop (i + 1) false refinement
        else
          loop (i + 1) false (RefinedByAnd (acc, refinement, sp))
      else (* not (is_set possible_refinement_bits i) *)
        loop (i + 1) is_first acc in
    let refinement = loop 0 true (RefinePredicate ("", sp)) in

    if refinement = RefinePredicate ("", sp) then
      Type (unrefined_type, None, sp)
    else
      Type (unrefined_type, Some refinement, sp) in

  match Rule.get_fun_type original_rule with
  | FunType (return_type, fun_name, ParamTypeList (param_types, _), _) ->
    let (r_cx, ut_cx) =
      List.partition (fun (const_name, _) -> String.contains const_name 'r') cx in
    let fun_unspec_param_types =
      List.map2 type_of_bitss (List.sort compare ut_cx) (List.sort compare r_cx) in
    let dot_type_opt =
      match List.nth param_types (List.length param_types - 1) with
      | Type (DotType _, None, _) as t -> [t]
      | _ -> [] in
    FunUnSpec (return_type, fun_name, ParamTypeList (fun_unspec_param_types @ dot_type_opt, sp), sp)
  | _ -> failwith "wrong AST"
