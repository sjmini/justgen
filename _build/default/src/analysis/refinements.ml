open SlangAST.Node

let count_refinements program =
  let refinements = Hashtbl.create 100 in

  let count_in_type ty =
    match ty with
    | Type _ as t -> Hashtbl.replace refinements (Format.asprintf "%a@." SlangAST.Node.pp t) 0
    | _ -> failwith "wrong AST" in

  let count_in_fun_spec_unspec fun_spec_unspec =
    match fun_spec_unspec with
    | FunSpec (_, _, ParamTypeList (param_types, _), _)
    | FunUnSpec (_, _, ParamTypeList (param_types, _), _) -> List.iter count_in_type param_types
    | _ -> () in

  let count_in_rule rule =
    match rule with
    | Rule (FunSpecList (fun_unspecs_specs, _), _, _) -> List.iter count_in_fun_spec_unspec fun_unspecs_specs
    | _ -> () in
  
  begin match program with
  | Program (decls, _) -> List.iter count_in_rule decls
  | _ -> failwith "wrong AST"
  end;

  print_int (Hashtbl.length refinements);
  print_newline ();
  List.of_seq (Hashtbl.to_seq_keys refinements)
  |> List.sort compare
  |> List.iter print_string
