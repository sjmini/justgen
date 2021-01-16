
(* The type of tokens. *)

type token = 
  | XOR_EQ
  | XOR
  | WHILE_KW
  | VOID_KW
  | UNSIGNED_KW
  | SWITCH_KW
  | STRUCT_KW
  | STATIC_KW
  | SIZEOF_KW
  | SHIFT_RIGHT_EQ
  | SHIFT_RIGHT
  | SHIFT_LEFT_EQ
  | SHIFT_LEFT
  | SEMICOLON
  | RETURN_KW
  | QUESTION
  | PLUS_EQ
  | PLUS
  | PAREN_OPEN
  | PAREN_CLOSE
  | OR
  | NEQ
  | NEG_MINUS
  | MULT_EQ
  | MULT
  | MOD_EQ
  | MOD
  | MINUS_EQ
  | MINUS
  | LT
  | LONG_KW
  | LE
  | INT_KW
  | INT of (int)
  | IF_KW
  | ID of (string)
  | GT
  | GOTO_KW
  | GE
  | FOR_KW
  | FLOAT_KW
  | EQ
  | EOF
  | ELSE_KW
  | DO_KW
  | DOUBLE_KW
  | DOUBLE_EQ
  | DIV_EQ
  | DIV
  | DEREF
  | CONTINUE_KW
  | CONST_KW
  | COMPLEMENT
  | COMMA
  | COLON
  | CHAR_KW
  | CHAR of (char)
  | BREAK_KW
  | BRACKET_OPEN
  | BRACKET_CLOSE
  | BRACE_OPEN
  | BRACE_CLOSE
  | BIT_OR_EQ
  | BIT_OR
  | BIT_AND_EQ
  | BIT_AND
  | BANG
  | ARROW
  | AND
  | ADDROF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.prog)
