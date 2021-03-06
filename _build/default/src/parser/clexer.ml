# 1 "src/parser/clexer.mll"
 
  open Core
  open Lexing
  open Cparser

  exception SyntaxError of string

  (* TODO: add skip comment *)

  let next_line lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_bol = lexbuf.lex_curr_pos;
        pos_lnum = pos.pos_lnum + 1
      }

  (* TODO: change to hashmap *)
  let keyword_tabel =
    [("void", VOID_KW);
     ("int", INT_KW);
     ("char", CHAR_KW);
     ("long", LONG_KW);
     ("unsigned", UNSIGNED_KW);
     ("float", FLOAT_KW);
     ("double", DOUBLE_KW);
     ("struct", STRUCT_KW);
     ("const", CONST_KW);
     ("static", STATIC_KW);
     ("sizeof", SIZEOF_KW);
     ("return", RETURN_KW);
     ("goto", GOTO_KW);
     ("if", IF_KW);
     ("else", ELSE_KW);
     ("switch", SWITCH_KW);
     ("for", FOR_KW);
     ("do", DO_KW);
     ("while", WHILE_KW);
     ("break", BREAK_KW);
     ("continue", CONTINUE_KW)]

  let find_token s =
    match List.Assoc.find keyword_tabel s ~equal:String.equal with
    | Some kw -> kw
    | None -> ID s

# 48 "src/parser/clexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\208\255\209\255\079\000\154\000\003\000\076\000\079\000\
    \031\000\109\000\174\000\035\000\080\000\081\000\110\000\082\000\
    \242\255\112\000\244\255\245\255\246\255\247\255\248\255\249\255\
    \250\255\251\255\252\255\253\255\254\255\001\000\003\000\227\255\
    \222\255\212\255\221\255\220\255\219\255\218\255\217\255\226\255\
    \216\255\225\255\215\255\114\000\232\255\214\255\152\000\230\255\
    \213\255\228\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\045\000\044\000\026\000\024\000\022\000\
    \021\000\020\000\019\000\018\000\017\000\016\000\015\000\014\000\
    \255\255\012\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\001\000\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\031\000\255\255\255\255\032\000\255\255\
    \255\255\255\255";
  Lexing.lex_default =
   "\002\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\255\255\000\000\
    \000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\030\000\028\000\028\000\030\000\029\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \030\000\017\000\000\000\030\000\000\000\011\000\010\000\000\000\
    \025\000\024\000\013\000\015\000\021\000\014\000\000\000\012\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\018\000\019\000\007\000\005\000\006\000\020\000\
    \049\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\023\000\042\000\022\000\008\000\003\000\
    \037\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\027\000\009\000\026\000\016\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\047\000\046\000\043\000\044\000\036\000\035\000\032\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\040\000\034\000\033\000\031\000\003\000\045\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\039\000\048\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\041\000\000\000\038\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\029\000\030\000\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\255\255\030\000\255\255\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \005\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\008\000\000\000\000\000\000\000\
    \011\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\006\000\006\000\007\000\007\000\012\000\013\000\015\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\009\000\014\000\014\000\017\000\003\000\043\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\010\000\046\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\009\000\255\255\010\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 54 "src/parser/clexer.mll"
          ( token lexbuf )
# 205 "src/parser/clexer.ml"

  | 1 ->
# 55 "src/parser/clexer.mll"
             ( next_line lexbuf; token lexbuf )
# 210 "src/parser/clexer.ml"

  | 2 ->
# 56 "src/parser/clexer.mll"
        ( BRACE_OPEN )
# 215 "src/parser/clexer.ml"

  | 3 ->
# 57 "src/parser/clexer.mll"
        ( BRACE_CLOSE )
# 220 "src/parser/clexer.ml"

  | 4 ->
# 58 "src/parser/clexer.mll"
        ( PAREN_OPEN )
# 225 "src/parser/clexer.ml"

  | 5 ->
# 59 "src/parser/clexer.mll"
        ( PAREN_CLOSE )
# 230 "src/parser/clexer.ml"

  | 6 ->
# 60 "src/parser/clexer.mll"
        ( BRACKET_OPEN )
# 235 "src/parser/clexer.ml"

  | 7 ->
# 61 "src/parser/clexer.mll"
        ( BRACKET_CLOSE )
# 240 "src/parser/clexer.ml"

  | 8 ->
# 62 "src/parser/clexer.mll"
        ( COMMA )
# 245 "src/parser/clexer.ml"

  | 9 ->
# 63 "src/parser/clexer.mll"
        ( QUESTION )
# 250 "src/parser/clexer.ml"

  | 10 ->
# 64 "src/parser/clexer.mll"
        ( SEMICOLON )
# 255 "src/parser/clexer.ml"

  | 11 ->
# 65 "src/parser/clexer.mll"
        ( COLON )
# 260 "src/parser/clexer.ml"

  | 12 ->
# 66 "src/parser/clexer.mll"
        ( BANG )
# 265 "src/parser/clexer.ml"

  | 13 ->
# 67 "src/parser/clexer.mll"
        ( COMPLEMENT )
# 270 "src/parser/clexer.ml"

  | 14 ->
# 68 "src/parser/clexer.mll"
        ( PLUS )
# 275 "src/parser/clexer.ml"

  | 15 ->
# 69 "src/parser/clexer.mll"
        ( MINUS )
# 280 "src/parser/clexer.ml"

  | 16 ->
# 70 "src/parser/clexer.mll"
        ( MULT )
# 285 "src/parser/clexer.ml"

  | 17 ->
# 71 "src/parser/clexer.mll"
        ( DIV )
# 290 "src/parser/clexer.ml"

  | 18 ->
# 72 "src/parser/clexer.mll"
        ( MOD )
# 295 "src/parser/clexer.ml"

  | 19 ->
# 73 "src/parser/clexer.mll"
        ( BIT_AND )
# 300 "src/parser/clexer.ml"

  | 20 ->
# 74 "src/parser/clexer.mll"
        ( BIT_OR )
# 305 "src/parser/clexer.ml"

  | 21 ->
# 75 "src/parser/clexer.mll"
        ( XOR )
# 310 "src/parser/clexer.ml"

  | 22 ->
# 76 "src/parser/clexer.mll"
        ( LT )
# 315 "src/parser/clexer.ml"

  | 23 ->
# 77 "src/parser/clexer.mll"
         ( LE )
# 320 "src/parser/clexer.ml"

  | 24 ->
# 78 "src/parser/clexer.mll"
        ( GT )
# 325 "src/parser/clexer.ml"

  | 25 ->
# 79 "src/parser/clexer.mll"
         ( GE )
# 330 "src/parser/clexer.ml"

  | 26 ->
# 80 "src/parser/clexer.mll"
        ( EQ )
# 335 "src/parser/clexer.ml"

  | 27 ->
# 81 "src/parser/clexer.mll"
         ( DOUBLE_EQ )
# 340 "src/parser/clexer.ml"

  | 28 ->
# 82 "src/parser/clexer.mll"
         ( NEQ )
# 345 "src/parser/clexer.ml"

  | 29 ->
# 83 "src/parser/clexer.mll"
         ( AND )
# 350 "src/parser/clexer.ml"

  | 30 ->
# 84 "src/parser/clexer.mll"
         ( OR )
# 355 "src/parser/clexer.ml"

  | 31 ->
# 85 "src/parser/clexer.mll"
         ( SHIFT_LEFT )
# 360 "src/parser/clexer.ml"

  | 32 ->
# 86 "src/parser/clexer.mll"
         ( SHIFT_RIGHT )
# 365 "src/parser/clexer.ml"

  | 33 ->
# 87 "src/parser/clexer.mll"
         ( PLUS_EQ )
# 370 "src/parser/clexer.ml"

  | 34 ->
# 88 "src/parser/clexer.mll"
         ( MINUS_EQ )
# 375 "src/parser/clexer.ml"

  | 35 ->
# 89 "src/parser/clexer.mll"
         ( MULT_EQ )
# 380 "src/parser/clexer.ml"

  | 36 ->
# 90 "src/parser/clexer.mll"
         ( DIV_EQ )
# 385 "src/parser/clexer.ml"

  | 37 ->
# 91 "src/parser/clexer.mll"
         ( MOD_EQ )
# 390 "src/parser/clexer.ml"

  | 38 ->
# 92 "src/parser/clexer.mll"
         ( BIT_AND_EQ )
# 395 "src/parser/clexer.ml"

  | 39 ->
# 93 "src/parser/clexer.mll"
         ( BIT_OR_EQ )
# 400 "src/parser/clexer.ml"

  | 40 ->
# 94 "src/parser/clexer.mll"
         ( XOR_EQ )
# 405 "src/parser/clexer.ml"

  | 41 ->
# 95 "src/parser/clexer.mll"
          ( SHIFT_LEFT_EQ )
# 410 "src/parser/clexer.ml"

  | 42 ->
# 96 "src/parser/clexer.mll"
          ( SHIFT_RIGHT_EQ )
# 415 "src/parser/clexer.ml"

  | 43 ->
# 97 "src/parser/clexer.mll"
         ( ARROW )
# 420 "src/parser/clexer.ml"

  | 44 ->
let
# 98 "src/parser/clexer.mll"
              lxm
# 426 "src/parser/clexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 98 "src/parser/clexer.mll"
                  ( INT (int_of_string lxm) )
# 430 "src/parser/clexer.ml"

  | 45 ->
let
# 99 "src/parser/clexer.mll"
          id
# 436 "src/parser/clexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 99 "src/parser/clexer.mll"
             ( find_token id )
# 440 "src/parser/clexer.ml"

  | 46 ->
let
# 100 "src/parser/clexer.mll"
         c
# 446 "src/parser/clexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 102 "src/parser/clexer.mll"
    ( raise (SyntaxError ("Unknown char: " ^ (Char.escaped c))) )
# 450 "src/parser/clexer.ml"

  | 47 ->
# 103 "src/parser/clexer.mll"
        ( EOF )
# 455 "src/parser/clexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

