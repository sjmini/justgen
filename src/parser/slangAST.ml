module Node = struct
  type t = 
    | Program of t list * SourcePosition.t
    (* | TypeDeclList of t list *)
    | TypeDeclaration of t * t option * SourcePosition.t
    (* | RefineDeclList of t list  *)
    | RefineDeclaration of t * t  * SourcePosition.t
    (* | RuleList of t list *)
    | Rule of t * t * SourcePosition.t
    | FunSpecList of t list * SourcePosition.t
    | FunUnSpec of t * t * t * SourcePosition.t
    | FunSpec of t * t * t * SourcePosition.t
    | FunType of t * t * t * SourcePosition.t
    | ParamTypeList of t list * SourcePosition.t
    | Type of t * t option * SourcePosition.t
    | SharpType of t * SourcePosition.t
    | PtrType of t * SourcePosition.t
    | BaseType of string * SourcePosition.t
    | DotType of SourcePosition.t
    | FunName of string * SourcePosition.t
    | Refinement of t * SourcePosition.t
    | RefinedByAnd of t * t * SourcePosition.t
    | RefinedByOr of t * t * SourcePosition.t
    | RefinedByNot of t * SourcePosition.t
    | RefinePredicate of string * SourcePosition.t

  let mk_program decllist sp = Program (decllist, sp)

  let mk_type_declaration ?parent_type t sp = 
    match parent_type with
    | None ->
        TypeDeclaration (BaseType (t, sp), None, sp)
    | Some p -> 
        TypeDeclaration (BaseType (t, sp), Some (BaseType (p, sp)), sp)

  let mk_refine_declaration refine fortype sp = RefineDeclaration (RefinePredicate (refine, sp), fortype, sp)

  let mk_rule slist t sp = Rule (slist, t, sp)

  let mk_fun_spec_list fslist sp = FunSpecList (fslist, sp)

  let mk_fun_spec rt fn fplist sp = FunSpec (rt, fn, fplist, sp)

  let mk_fun_unspec rt fn fplist sp = FunUnSpec (rt, fn, fplist, sp)

  let mk_fun_type rt fn fplist sp = FunType (rt, fn, fplist, sp)

  let mk_param_type_list ptlist sp = ParamTypeList (ptlist, sp)

  let mk_type ?refinement t sp = Type (t, refinement, sp)

  let mk_ptr_type t sp = PtrType (t, sp)

  let mk_base_type tn sp = BaseType (tn, sp)

  let mk_sharp_type t sp = SharpType (t, sp)

  let mk_fun_name fn sp = FunName (fn, sp)

  let dot_type sp = DotType sp

  let mk_refinement r sp = Refinement (r, sp)

  let mk_refined_by_and r1 r2 sp = RefinedByAnd (r1, r2, sp)

  let mk_refined_by_or r1 r2 sp = RefinedByOr (r1, r2, sp)

  let mk_refined_by_not r sp = RefinedByNot (r, sp)

  let mk_predicate pn sp = RefinePredicate (pn, sp)

  let rec pp fmt node = 
    match node with
    | Program (decllist, _) ->
        let fst = ref true in
        List.iter (fun t -> 
          if !fst then (
            fst := false; Format.fprintf fmt "%a" pp t
          )else
            Format.fprintf fmt "\n %a" pp t
        ) decllist 
    | TypeDeclaration (bt, pt_op, _) -> (
        match pt_op with
        | Some pt ->
            Format.fprintf fmt "typedef %a <: %a" pp bt pp pt
        | None ->
            Format.fprintf fmt "typedef %a" pp bt
    )
    | RefineDeclaration (refine, t, _) ->
        Format.fprintf fmt "refine %a in %a" pp refine pp t  
    | Rule (fslist, ft, _) ->
        Format.fprintf fmt "rule{\n%a\n%a\n}" pp fslist pp ft 
    | FunSpecList (fslist, _) -> 
        let fst = ref true in
        List.iter (fun t -> 
          if !fst then (
            fst := false; Format.fprintf fmt "%a" pp t
          )else
            Format.fprintf fmt "\n%a" pp t
        ) fslist
    | FunUnSpec (rt, fn, ptlist, _) -> 
        Format.fprintf fmt "unspec. %a %a(%a)" pp rt pp fn pp ptlist
    | FunSpec (rt, fn, ptlist, _) -> 
        Format.fprintf fmt "spec. %a %a(%a)" pp rt pp fn pp ptlist
    | FunType (rt, fn, ptlist, _) ->
        Format.fprintf fmt "type. %a %a(%a)" pp rt pp fn pp ptlist
    | ParamTypeList (tlist, _) ->
        let fst = ref true in
        List.iter (fun t -> 
          if !fst then (
            fst := false; Format.fprintf fmt "%a" pp t
          )else
            Format.fprintf fmt ", %a" pp t
        ) tlist
    | Type (bt, pt_op, _) -> (
        match pt_op with
        | Some pt ->
            Format.fprintf fmt "%a@%a" pp bt pp pt
        | None ->
            Format.fprintf fmt "%a" pp bt
    )
    | SharpType (t, _) ->
        Format.fprintf fmt "#%a" pp t
    | PtrType (t, _) ->
        Format.fprintf fmt "%a*" pp t
    | BaseType (tn, _) ->
        Format.fprintf fmt "%s" tn
    | DotType _ ->
        Format.fprintf fmt "..."
    | FunName (fn, _) ->
        Format.fprintf fmt "%s" fn
    | Refinement (r, _) ->
        Format.fprintf fmt "%a" pp r
    | RefinedByAnd (r1, r2, _) ->
        Format.fprintf fmt "(%a && %a)" pp r1 pp r2
    | RefinedByOr (r1, r2, _) ->
        Format.fprintf fmt "(%a || %a)" pp r1 pp r2
    | RefinedByNot (r, _) ->
        Format.fprintf fmt "!%a" pp r
    | RefinePredicate (p, _) ->
        Format.fprintf fmt "%s" p

  let get_sp = function
    | Program (_, sp) 
    | TypeDeclaration (_, _, sp)
    | RefineDeclaration (_, _, sp)
    | Rule (_, _, sp)
    | FunSpecList (_, sp)
    | FunUnSpec (_, _, _, sp)
    | FunSpec (_, _, _, sp)
    | FunType (_, _, _, sp)
    | ParamTypeList (_, sp)
    | Type (_, _, sp)
    | SharpType (_, sp)
    | PtrType (_, sp)
    | BaseType (_, sp)
    | DotType sp
    | FunName (_, sp)
    | Refinement (_, sp)
    | RefinedByAnd (_, _, sp) 
    | RefinedByOr (_, _, sp)
    | RefinedByNot (_, sp)
    | RefinePredicate (_, sp)
    -> sp
end
