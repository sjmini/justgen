open SlangAST.Node

let add_refinements program =
  let add_refinement_type spec_type unspec_type =
    match (spec_type, unspec_type) with
    | (Type (spec_ut, spec_r', _), Type (unspec_ut, unspec_r', sp)) ->
      let spec_ut_str =
        Format.asprintf "%a@." SlangAST.Node.pp spec_ut
        |> Str.global_replace (Str.regexp_string "#") "" in
      let unspec_ut_str = Format.asprintf "%a@." SlangAST.Node.pp unspec_ut in
      if unspec_ut_str = spec_ut_str && unspec_r' = None then
        Type (spec_ut, spec_r', sp)
      else
        Type (unspec_ut, unspec_r', sp)
    | _ -> failwith "wrong AST" in

  let add_refinements_fun_unspec fun_spec fun_unspec =
    match (fun_spec, fun_unspec) with
    | (FunSpec (_, _, ParamTypeList (spec_param_types, _), _),
        FunUnSpec (rt, fn, ParamTypeList (unspec_param_types, sp1), sp2) ) ->
      let new_param_types = List.map2 add_refinement_type spec_param_types unspec_param_types in
      FunUnSpec (rt, fn, ParamTypeList (new_param_types, sp1), sp2)
    | _ -> failwith "wrong AST" in

  let add_refinements_decl decl =
    match decl with
    | Rule (FunSpecList (fun_unspecs_specs, sp1), ft, sp2) ->
      let fun_unspecs = List.filter (function FunUnSpec _ -> true | _ -> false) fun_unspecs_specs in
      let fun_specs = List.filter (function FunSpec _ -> true | _ -> false) fun_unspecs_specs in
      let fun_spec = List.hd fun_specs in
      let new_fun_unspecs = List.map (add_refinements_fun_unspec fun_spec) fun_unspecs in
      Rule (FunSpecList (new_fun_unspecs @ fun_specs, sp1), ft, sp2)
    | d -> d in

  match program with
  | Program (decls, sp) -> Program (List.map add_refinements_decl decls, sp)
  | _ -> failwith "wrong AST"
