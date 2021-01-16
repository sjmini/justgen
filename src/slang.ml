let () =
  (*let t = Unix.gettimeofday () in*)
  match Array.length Sys.argv with 
  | 2 -> let mode = Array.get Sys.argv 1 in
      if ((String.compare mode "find_unspec") == 0) then
        begin
          let program_file_path = "test/rule" in
          let mapping_file_path = "test/bitvector" in
          let preconds_file_path = "test/pre_con" in
          let program = ParseMain.parse_and_return program_file_path in
          (* Format.printf "%a@." SlangAST.Node.pp program; *)

          let mapping = Mapping.create mapping_file_path in
          (* Mapping.print mapping; *)

          let preconds = Preconds.create preconds_file_path in
          (* Preconds.print preconds; *)

          let rules = Rule.get_rules program in

          let rules_unspecs = Driver.run mapping preconds rules in
          let new_program = Driver.get_new_program program rules_unspecs in
          let new_program = Postprocessing.add_refinements new_program in

          (*let oc = open_out unspec_file in*)
          Format.printf "%a@." SlangAST.Node.pp new_program;
      (*    Printf.printf "Execution time: %f\n" (Unix.gettimeofday () -. t);*)
        end
      else if ((String.compare mode "gen_program") == 0) then
        begin
        let info_file_path = "test/fun_info" in
        ParseMain.parse "unspec_dsl" info_file_path;
        (*Printf.printf "Execution time: %f\n" (Unix.gettimeofday () -. t); *)
        end
      else (
        failwith "Wring args 2"
      );
  | _ -> failwith "wrong args _"

