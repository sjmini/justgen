open Lexing
open Lexer
module SC = SourceCollector

let read_file (f:string) : string =
  let ic = open_in f in
  let content = ref "" in
  try
    while true; do
      content := !content ^ (input_line ic) ^ "\n" 
    done; !content
  with End_of_file ->
    close_in ic;
    !content 

let print_position outx lexbuf =
  let pos = lexbuf.lex_curr_p in
  Printf.fprintf outx "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol)

let parse_with_error lexbuf =
  try Some (Parser.main Lexer.token lexbuf) with
  | Lexer.LexError msg ->
    Printf.fprintf stderr "%a: %s\n" print_position lexbuf msg;
    None
  | Parser.Error ->
    Printf.fprintf stderr "%a: syntax error\n" print_position lexbuf;
    exit (-1)

let parse_and_print unspec_lexbuf info_lexbuf =
  match (parse_with_error unspec_lexbuf, parse_with_error info_lexbuf) with
  | (Some unspec_program, Some info_program) -> (
    TypeChecker.check unspec_program; 
    let fun_info = Dependency.mk_fun_type_map info_program in
    Generator.gen_start unspec_program fun_info; ()
    (*Format.printf "%a@." SlangAST.Node.pp value*)
  )
  | _ -> ()

let loop unspec_file_path info_file_path () =
  let unspec_inc = open_in unspec_file_path in
  let unspec_lexbuf = Lexing.from_channel unspec_inc in
  unspec_lexbuf.lex_curr_p <- { unspec_lexbuf.lex_curr_p with pos_fname = unspec_file_path };

  let info_inc = open_in info_file_path in
  let info_lexbuf = Lexing.from_channel info_inc in
  info_lexbuf.lex_curr_p <- { info_lexbuf.lex_curr_p with pos_fname = info_file_path };

  parse_and_print unspec_lexbuf info_lexbuf;

  close_in unspec_inc;
  close_in info_inc

let parse unspec_file_path info_file_path =
  loop unspec_file_path info_file_path ()

let parse_and_return file_name =
  let ic = open_in file_name in
  let lexbuf = Lexing.from_channel ic in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = file_name };
  match parse_with_error lexbuf with
  | Some result -> result
  | None -> exit (-1)
