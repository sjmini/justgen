open Core
open Ast
open Generate

 let c_loop filename () =
   let inx =  open_in filename in
   let lexbuf = Lexing.from_channel inx in
   let result = Cparser.program Clexer.token lexbuf in
   Format.printf "%a\n@." pp_prog result

 let c_parse (f:string) =
   c_loop f ()

(*let _ =
  let lexbuf = Lexing.from_channel In_channel.stdin in
  Format.printf "hi\n@.";
  let result = Cparser.program Clexer.token lexbuf in
  Format.printf "finish\n@.";
  Format.printf "%a\n@." pp_prog result;
  result |> string_of_prog |> print_string;
     Out_channel.newline stdout
*)
(*
  ignore (gen_temp_lib Out_channel.stdout);
  gen_prog result Out_channel.stdout *)
