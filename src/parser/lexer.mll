
{
  open Lexing
  open Parser

  exception LexError of string

  let inc_lnum lexbuf = lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_lnum =
  lexbuf.lex_curr_p.pos_lnum + 1 }

  let update_bol lexbuf = lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_bol =
  lexbuf.lex_curr_p.pos_cnum }

  let update_pos lexbuf = inc_lnum lexbuf; update_bol lexbuf

  let set_cur_pos lexbuf = SourcePosition.curpos := (lexbuf.lex_curr_p.pos_lnum, lexbuf.lex_curr_p.pos_cnum - lexbuf.lex_curr_p.pos_bol)
}

(*
typedef JNIEnv
typedef JMethodID
typedef JVoidMethodID <: JMethodID
typedef jobject
typedef jbyte
typedef jsize

rule{
  spec. CallVoidMethod(JNIEnv*, JVoidMethodID, ...)
  spec. CallVoidMethod(JNIEnv*, NULL, ...)
  type. CallVoidMethod(JNIEnv*, JMethodID, ...)
}

rule{
  spec. DefineClass(JNIEnv*, char*, !jobject, jbyte*, jsize)
  type. DefineClass(JNIEnv*, char*, jobject, jbyte*, jsize)
}
*)

rule token = parse
| "spec." { let _ = set_cur_pos lexbuf in KW_SPEC }
| "unspec." { let _ = set_cur_pos lexbuf in KW_UNSPEC }
| "type." { let _ = set_cur_pos lexbuf in KW_TYPE }
| "rule" { let _ = set_cur_pos lexbuf in KW_RULE }
| "typedef" { let _ = set_cur_pos lexbuf in KW_DEFTYPE }
| "refine" { let _ = set_cur_pos lexbuf in KW_REFINE } 
| "in" { let _ = set_cur_pos lexbuf in KW_IN } 
| '(' { let _ = set_cur_pos lexbuf in LSPAREN }
| ')' { let _ = set_cur_pos lexbuf in RSPAREN }
| '{' { let _ = set_cur_pos lexbuf in LMPAREN }
| '}' { let _ = set_cur_pos lexbuf in RMPAREN }
| '*' { let _ = set_cur_pos lexbuf in STAR }
| ',' { let _ = set_cur_pos lexbuf in COMMA }
| "&&" { let _ = set_cur_pos lexbuf in AND }
| "||" { let _ = set_cur_pos lexbuf in OR }
| "<:" { let _ = set_cur_pos lexbuf in OP_SUBTYPE }
| "..." { let _ = set_cur_pos lexbuf in DOT }
| '!' { let _ = set_cur_pos lexbuf in BANG }
| '#' { let _ = set_cur_pos lexbuf in SHARP }
| '@' { let _ = set_cur_pos lexbuf in AT }
| ['a'-'z''A'-'Z''_''-''0'-'9']+ as name { let _ = set_cur_pos lexbuf in NAME name }
| "//" { let _ = set_cur_pos lexbuf in comment lexbuf }
| [' ' '\t']+ { let _ = set_cur_pos lexbuf in token lexbuf }
| '\n' { update_pos lexbuf ; let _ = set_cur_pos lexbuf in token lexbuf }
| eof {let _ = set_cur_pos lexbuf in EOF}
| _ as c { raise (LexError (Format.asprintf "Invalid token: %c" c)) }

and comment = parse
| [^'\n']+ { let _ = set_cur_pos lexbuf in comment lexbuf }
| '\n' { update_pos lexbuf ; let _ = set_cur_pos lexbuf in token lexbuf }

