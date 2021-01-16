module Warn = struct
  module S = Set.Make(String)

  let warn = ref S.empty

  let add w = warn := (S.add w !warn)

  let pp fmt w = 
    let fst = ref true in
    S.iter (fun warn -> 
      if !fst 
      then (fst := false; Format.fprintf fmt "%s" warn)
      else Format.fprintf fmt "\n%s" warn) !w
end

let cadd_warn b msg sp = 
  if not b then 
    Warn.add (Format.asprintf "%s %a" msg SourcePosition.pp sp)
  else ()

let compare_string = String.compare

module Type = struct
  type t = 
    | PtrT of t
    | T of string
    | NULL
    | DOT 
    [@@ deriving compare]

  let mk_ptrt t = PtrT t

  let mk_t t = 
    if (String.compare t "NULL") == 0 
    then NULL
    else if (String.compare t "...") == 0
    then DOT
    else T t

  let null = NULL

  let dot = DOT

  let rec convert_node_to_type o = 
    match o with
    | SlangAST.Node.SharpType (t, _) ->
        convert_node_to_type t
    | SlangAST.Node.PtrType (t, _) ->
        PtrT (convert_node_to_type t)
    | SlangAST.Node.BaseType (t, _) -> (
        if (String.compare t "NULL") == 0
        then NULL
        else if (String.compare t "...") == 0
        then DOT
        else T t)
    | SlangAST.Node.DotType _ ->
        DOT
    | _ -> failwith (Format.asprintf "Not a convertable type: %a" SlangAST.Node.pp o)

  let rec pp fmt = function
    | PtrT s ->
        Format.fprintf fmt "%a*" pp s
    | T s ->
        Format.fprintf fmt "%s" s
    | NULL ->
        Format.fprintf fmt "NULL"
    | DOT ->
        Format.fprintf fmt "..."
end

module Refine = struct
  type t = R of string
  [@@ deriving compare]

  let mk_refine r = R r
    
  let convert_node_to_refine o = 
    match o with
    | SlangAST.Node.RefinePredicate (t, _) ->
        R t
    | _ -> failwith (Format.asprintf "Not a convertable refinement: %a" SlangAST.Node.pp o)

  let pp fmt = function | R s -> Format.fprintf fmt "%s" s

end

module RefineSet = Set.Make(Refine)

module TypeEnv = struct
  module RefineType = struct
    module M = Map.Make(Refine)

    type t = Type.t M.t

    let empty : t = M.empty 

    let add : Refine.t -> Type.t -> t -> t = M.add

    let is_defined : Refine.t -> t -> bool = M.mem

    let is_for r t m : bool = 
      match M.find_opt r m with
      | Some t' -> 
          (Type.compare t t') == 0
      | None ->
          false

    let pp fmt m = 
      let fst = ref true in
      M.iter (fun r t ->  
        (if !fst 
        then fst := false
        else Format.fprintf fmt "\n");
        Format.fprintf fmt "refinedef %a in %a\n" Refine.pp r Type.pp t 
        ) m
  end

  module TypeHierarchy = struct
    module M = Map.Make(Type)
    module S = Set.Make(Type)

    type t = S.t * Type.t M.t 
    
    let empty : t = S.empty, M.empty

    let add t1 ?parent (s, m) : t = 
      if S.mem t1 s then
        failwith (Format.asprintf "Duplicated definition: %a" Type.pp t1)
      else (
        S.add t1 s,
        match parent with
        | Some p ->
            M.add t1 p m
        | None ->
            m
      )
         
    
    let is_defined t (s, m) : bool = 
      match t with
      | Type.NULL | Type.DOT -> 
          true
      | _ -> 
          S.mem t s

    let rec is_subtype t1 t2 (s, m) : bool = 
      match t1 with
      | Type.NULL ->
          true
      | _ -> (
          match M.find_opt t1 m with
          | Some p -> (
              if (Type.compare t2 p) == 0 
              then true
              else is_subtype p t2 (s, m)
          )
          | None ->
              false
      )

    let pp fmt (s, m) = 
      let fst = ref true in
      S.iter (fun t ->  
        (if !fst 
        then fst := false
        else Format.fprintf fmt "\n");
        (match M.find_opt t m with
        | Some p ->
            Format.fprintf fmt "typedef %a <: %a\n" Type.pp t Type.pp p
        | None ->
            Format.fprintf fmt "typedef %a\n" Type.pp t
        )) s
  end

  type t = RefineType.t * TypeHierarchy.t

  let empty : t = RefineType.empty, TypeHierarchy.empty

  let is_defined_refine sp r (re, th) : bool = 
    let res = RefineType.is_defined r re in
      cadd_warn (res) (Format.asprintf "Undefined Refine: %a is not defined" Refine.pp r) sp;
      res

  let is_defined_type sp t1 (re, th) : bool = 
    let res = TypeHierarchy.is_defined t1 th in
      cadd_warn (res) (Format.asprintf "Undefined Type: %a is not defined" Type.pp t1) sp;
      res

  let is_subtype sp t1 t2 (re, th) : bool = 
    let res = TypeHierarchy.is_subtype t1 t2 th in
      cadd_warn (res) (Format.asprintf "Incompatible Type: %a is not a subtype of %a" Type.pp t1 Type.pp t2) sp;
      res

  let add_refine r t1 (re, th) : t = RefineType.add r t1 re, th

  let add_type t1 ?parent (re, th) : t = re, TypeHierarchy.add t1 ?parent th

  let is_refine_of sp (re, th) t1 r  : bool = 
    let res = RefineType.is_for r t1 re in
      cadd_warn (res) (Format.asprintf "Incompatible Refinement: %a is not defined in %a" Refine.pp r Type.pp t1) sp;
      res

  let pp fmt (re, th) = 
    Format.fprintf fmt "== TYPE ==\n%a\n\n== REFINE ==\n%a\n" TypeHierarchy.pp th RefineType.pp re
end


let rec init_tenv tenv : SlangAST.Node.t -> TypeEnv.t = function
  | SlangAST.Node.Program (decllist, _) -> 
      List.fold_left (fun tenv' n -> init_tenv tenv' n) tenv decllist 
  | SlangAST.Node.TypeDeclaration (b, p, _) as o -> (
    match b with
    | SlangAST.Node.BaseType (bstr, _) -> (
      match p with
      | Some (SlangAST.Node.BaseType (pstr, _)) ->
          TypeEnv.add_type (Type.mk_t bstr) ~parent:(Type.mk_t pstr) tenv
      | Some _ ->
          failwith (Format.asprintf "Wrong type declaration: %a\n" SlangAST.Node.pp o)
      | None ->
          TypeEnv.add_type (Type.mk_t bstr) tenv
      )
    | _ ->
        failwith (Format.asprintf "Wrong type declaration: %a\n" SlangAST.Node.pp o)
  )
  | SlangAST.Node.RefineDeclaration (refinement, typ, _) as o ->(
    match refinement with
    | SlangAST.Node.RefinePredicate (r, _) ->
        TypeEnv.add_refine (Refine.mk_refine r) (Type.convert_node_to_type typ) tenv
    | _ ->
        failwith (Format.asprintf "Wrong refine declaration: %a\n" SlangAST.Node.pp o)
  )
  | _ -> tenv

let extract_refines r = 
  let rec impl set = function
    | SlangAST.Node.Refinement (t, _) -> impl set t
    | SlangAST.Node.RefinedByAnd (t1, t2, _) -> impl (impl set t1) t2
    | SlangAST.Node.RefinedByOr (t1, t2, _) -> impl (impl set t1) t2
    | SlangAST.Node.RefinedByNot (t, _) -> impl set t
    | SlangAST.Node.RefinePredicate (s, _) -> RefineSet.add (Refine.mk_refine s) set
    | _ as o -> failwith "Unreachable: %a" SlangAST.Node.pp o
  in
  impl RefineSet.empty r

let rec extract_base_type = function
  | SlangAST.Node.Type (t, _, _) ->
      extract_base_type t
  | SlangAST.Node.SharpType (t, _) ->
      extract_base_type t
  | SlangAST.Node.PtrType (t, _) ->
      extract_base_type t
  | SlangAST.Node.BaseType (s, _) ->
      Type.mk_t s
  | SlangAST.Node.DotType _ ->
      Type.dot
  | _ as o ->
      failwith (Format.asprintf "Is not a valid type: %a" SlangAST.Node.pp o)

let check_type_validity sp tenv t =
  let bt = extract_base_type t in
  TypeEnv.is_defined_type sp bt tenv

let check_fun_validity tenv = function
  | SlangAST.Node.FunUnSpec (rt, _, pts, sp) | SlangAST.Node.FunSpec (rt, _, pts, sp) | SlangAST.Node.FunType (rt, _, pts, sp) -> (
    (check_type_validity sp tenv rt) && (
    match pts with
    | SlangAST.Node.ParamTypeList (l, sp) ->
        List.for_all (fun pt -> check_type_validity sp tenv pt) l
    | _ as o -> failwith "Unreachable: %a" SlangAST.Node.pp o
    )
  )

let extract_fun_typ_info = function
  | SlangAST.Node.FunUnSpec (rt, _, SlangAST.Node.ParamTypeList (pts, _), _) | SlangAST.Node.FunSpec (rt, _, SlangAST.Node.ParamTypeList (pts, _), _) | SlangAST.Node.FunType (rt, _, SlangAST.Node.ParamTypeList (pts, _), _) -> (rt, pts)
  | _ as o -> failwith "Unreachable: %a" SlangAST.Node.pp o

let check_type_compatibility sp tenv pt ct =
    (Type.compare pt ct) == 0 || TypeEnv.is_subtype sp ct pt tenv

let check_refine_validity tenv = function
  | SlangAST.Node.Type (typ, Some refine, sp) -> 
      let rset = extract_refines refine in
      let typ' = Type.convert_node_to_type typ in
      RefineSet.for_all (TypeEnv.is_refine_of sp tenv typ') rset 
  | SlangAST.Node.Type _ ->
      true
  | _ as o -> failwith "Unreachable: %a" SlangAST.Node.pp o

let check_spec_refines tenv sp = 
  let (srt, spts) = extract_fun_typ_info sp in
  (check_refine_validity tenv srt)
  && (List.for_all (check_refine_validity tenv) spts)

let check_spec_types tenv rt pts sp = 
  let (srt, spts) = extract_fun_typ_info sp in
  let brt, bsrt = extract_base_type rt, extract_base_type srt in
  (check_type_compatibility (SlangAST.Node.get_sp srt) tenv brt bsrt) 
  && (
    List.fold_left2 (fun b pt ct -> 
      b && (check_type_compatibility (SlangAST.Node.get_sp ct) tenv (extract_base_type pt) (extract_base_type ct)))
    true pts spts
    )

let check_spec tenv rt pts sp = 
  (check_fun_validity tenv sp) 
  && (check_spec_types tenv rt pts sp)
  && (check_spec_refines tenv sp)

let check_specs check_fun = function
  | SlangAST.Node.FunSpecList (spl, _) -> 
      List.for_all (fun sp -> check_fun sp) spl 

let rec check_rules tenv = function
  | SlangAST.Node.Program (l, _) -> 
      List.for_all (fun n -> check_rules tenv n) l
  | SlangAST.Node.TypeDeclaration _ -> true
  | SlangAST.Node.RefineDeclaration _ -> true
  | SlangAST.Node.Rule (n1, n2, _) ->
      (check_fun_validity tenv n2) && (
        let (rt, pts) = extract_fun_typ_info n2 in
        check_specs (check_spec tenv rt pts) n1
      )
  | _ as o -> failwith "Unreachable: %a" SlangAST.Node.pp o

let check ast = 
  let tenv = init_tenv TypeEnv.empty ast in
  let res = check_rules tenv ast in
  if res then
    Format.printf "Done.\n@."
  else 
    Format.printf "# TypeErrors:\n%a@." Warn.pp Warn.warn
