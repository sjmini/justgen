
(* The type of tokens. *)

type token = 
  | STAR
  | SHARP
  | RSPAREN
  | RMPAREN
  | OR
  | OP_SUBTYPE
  | NAME of (string)
  | LSPAREN
  | LMPAREN
  | KW_UNSPEC
  | KW_TYPE
  | KW_SPEC
  | KW_RULE
  | KW_REFINE
  | KW_IN
  | KW_DEFTYPE
  | EOF
  | DOT
  | COMMA
  | BANG
  | AT
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (SlangAST.Node.t)
