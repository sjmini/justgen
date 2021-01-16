open Z3
open SlangAST.Node

let check solver =
  match Solver.check solver [] with
  | UNSATISFIABLE -> None
  | UNKNOWN -> failwith "solver status unknown"
  | SATISFIABLE ->
    begin match Solver.get_model solver with
    | Some model -> Some (Counterexample.create model)
    | None -> failwith "cannot get model"
    end

let encode_and_check mapping preconds rule =
  let solver = Solver.mk_solver Constants.ctx None in

  let encoded_rule = Rule.encode mapping preconds Constants.ctx rule in
  Solver.add solver encoded_rule;
  (* Rule.print rule;
  print_endline (Solver.to_string solver); *)

  let rec loop acc =
    match check solver with
    | Some cx ->
      let fun_unspec = Counterexample.to_fun_unspec mapping rule cx in
      Solver.add solver [Counterexample.encode Constants.ctx cx];
      loop (fun_unspec :: acc)
    | None -> acc in

  let fun_unspecs = loop [] in
  fun_unspecs

let split_encode_and_check mapping preconds rule =
  let split_rule = Rule.split rule in

  let split_fun_unspecs = List.map (encode_and_check mapping preconds) split_rule in

  let fun_unspecs = List.concat split_fun_unspecs in

  let (fun_type_fun_name, fun_type_param_types) =
    match Rule.get_fun_type rule with 
    | FunType (_, FunName (fun_name, _), ParamTypeList (param_types, _), _) -> (fun_name, param_types)
    | _ -> failwith "wrong AST" in
  let num_params = List.length fun_type_param_types in
  let embed fun_unspec =
    match fun_unspec with
    | FunUnSpec (return_type, FunName (fun_name, _), ParamTypeList (param_types, _), sp) ->
      let param_indexes_to_replace =
        match String.split_on_char '_' fun_name with
        | _ :: _ :: index_strs -> List.map int_of_string index_strs
        | _ -> failwith "wrong split rule fun name" in
      let rec get_new_param_types i pts new_pts =
        if i >= num_params then
          List.rev new_pts
        else if List.mem i param_indexes_to_replace then
          match pts with
          | pt :: tl -> get_new_param_types (i + 1) tl (pt :: new_pts)
          | _ -> failwith "wrong split rule fun unspec"
        else
          get_new_param_types (i + 1) pts ((List.nth fun_type_param_types i) :: new_pts) in
      let new_param_types = get_new_param_types 0 param_types [] in
      FunUnSpec (return_type, FunName (fun_type_fun_name, sp), ParamTypeList (new_param_types, sp), sp)
    | _ -> failwith "wrong AST" in
  
  List.map embed fun_unspecs

let run mapping preconds rules =
  let num_rules = List.length rules in
  
  Printf.eprintf "[Running on %d processes...]" Constants.ncores;
  prerr_newline ();

  let run_rule i rule =
    let fun_name = Rule.get_fun_name rule in

    Printf.eprintf "[Process %d: Running %s (%d/%d)...]" (Parmap.get_rank ()) fun_name (i + 1) num_rules;
    prerr_newline ();

    (* let fun_unspecs =
      if List.mem fun_name Constants.rules_to_split then
        split_encode_and_check mapping preconds rule
      else
        encode_and_check mapping preconds rule in *)
    let fun_unspecs = split_encode_and_check mapping preconds rule in
    
    Printf.eprintf "[Process %d: %s (%d/%d) done! Found %d counterexamples]"
      (Parmap.get_rank ())
      fun_name
      (i + 1)
      num_rules
      (List.length fun_unspecs);
    prerr_newline ();
    
    (i + 1, fun_unspecs) in
  
  let rules_unspecs =
    Parmap.parmapi ~ncores:Constants.ncores ~chunksize:Constants.chunksize run_rule (Parmap.L rules)
    |> List.sort (fun (i1, _) (i2, _) -> compare i1 i2)
    |> List.map (fun (_, cxs) -> cxs) in

  prerr_endline "[All done!]";

  rules_unspecs

let get_new_program program rules_unspecs =
  match program with
  | Program (decls, sp) ->
    let (rules, not_rules) = List.partition Rule.is_rule decls in
    let new_rules =
      List.map2
        (fun rule fun_unspecs ->
          match rule with
          | Rule (FunSpecList (fun_specs, sp1), fun_type, sp2) ->
            Rule (FunSpecList (fun_unspecs @ fun_specs, sp1), fun_type, sp2)
          | _ -> failwith "wrong AST" )
        rules
        rules_unspecs in
    Program (not_rules @ new_rules, sp)
  | _ -> failwith "wrong AST"
