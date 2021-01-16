
module MenhirBasics = struct
  
  exception Error
  
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
    | INT of (
# 6 "src/parser/cparser.mly"
       (int)
# 44 "src/parser/cparser.ml"
  )
    | IF_KW
    | ID of (
# 8 "src/parser/cparser.mly"
       (string)
# 50 "src/parser/cparser.ml"
  )
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
    | CHAR of (
# 7 "src/parser/cparser.mly"
       (char)
# 75 "src/parser/cparser.ml"
  )
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
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState172
  | MenhirState169
  | MenhirState163
  | MenhirState160
  | MenhirState158
  | MenhirState156
  | MenhirState145
  | MenhirState138
  | MenhirState137
  | MenhirState135
  | MenhirState133
  | MenhirState129
  | MenhirState126
  | MenhirState119
  | MenhirState117
  | MenhirState113
  | MenhirState111
  | MenhirState98
  | MenhirState93
  | MenhirState91
  | MenhirState89
  | MenhirState87
  | MenhirState85
  | MenhirState83
  | MenhirState81
  | MenhirState79
  | MenhirState77
  | MenhirState75
  | MenhirState73
  | MenhirState71
  | MenhirState69
  | MenhirState67
  | MenhirState65
  | MenhirState63
  | MenhirState61
  | MenhirState59
  | MenhirState57
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState37
  | MenhirState35
  | MenhirState33
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState28
  | MenhirState25
  | MenhirState24
  | MenhirState23
  | MenhirState22
  | MenhirState20
  | MenhirState18
  | MenhirState17
  | MenhirState14
  | MenhirState10
  | MenhirState6
  | MenhirState0

# 1 "src/parser/cparser.mly"
  
  open Core
  open Ast

# 176 "src/parser/cparser.ml"

let rec _menhir_goto_statements : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.block) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BRACE_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (sts : (Ast.block))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.block) = 
# 100 "src/parser/cparser.mly"
    ( sts )
# 197 "src/parser/cparser.ml"
             in
            (match _menhir_s with
            | MenhirState18 | MenhirState169 | MenhirState111 | MenhirState119 | MenhirState163 | MenhirState160 | MenhirState137 | MenhirState138 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (b : (Ast.block)) = _v in
                let _v : (Ast.statement) = 
# 143 "src/parser/cparser.mly"
    ( Compound b )
# 207 "src/parser/cparser.ml"
                 in
                _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
            | MenhirState17 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (body : (Ast.block)) = _v in
                let (((_menhir_stack, _menhir_s, (ftype : (Ast.type_def))), (id : (
# 8 "src/parser/cparser.mly"
       (string)
# 217 "src/parser/cparser.ml"
                ))), _, (params : ((string option * Ast.type_def) list))) = _menhir_stack in
                let _5 = () in
                let _3 = () in
                let _v : (
# 39 "src/parser/cparser.mly"
      (fun_decl)
# 224 "src/parser/cparser.ml"
                ) = 
# 79 "src/parser/cparser.mly"
  ( { name = id;
      fun_type = ftype;
      params;
      body; } )
# 231 "src/parser/cparser.ml"
                 in
                let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | CHAR_KW ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState172
                | DOUBLE_KW ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState172
                | FLOAT_KW ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState172
                | INT_KW ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState172
                | VOID_KW ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState172
                | EOF ->
                    _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) MenhirState172
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172)
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (s : (Ast.statement))), _, (ss : (Ast.block))) = _menhir_stack in
        let _v : (Ast.block) = 
# 105 "src/parser/cparser.mly"
    ( s :: ss )
# 269 "src/parser/cparser.ml"
         in
        _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_if_fstat : _menhir_env -> 'ttv_tail -> (Ast.statement option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (fstat : (Ast.statement option)) = _v in
    let (((_menhir_stack, _menhir_s), _, (cond : (
# 40 "src/parser/cparser.mly"
      (exp)
# 283 "src/parser/cparser.ml"
    ))), _, (tstat : (Ast.statement))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _v : (Ast.statement) = 
# 117 "src/parser/cparser.mly"
    ( If { cond; tstat; fstat; } )
# 291 "src/parser/cparser.ml"
     in
    _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.block) = 
# 103 "src/parser/cparser.mly"
    ( [] )
# 300 "src/parser/cparser.ml"
     in
    _menhir_goto_statements _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce47 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 8 "src/parser/cparser.mly"
       (string)
# 307 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (id : (
# 8 "src/parser/cparser.mly"
       (string)
# 313 "src/parser/cparser.ml"
    ))) = _menhir_stack in
    let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 318 "src/parser/cparser.ml"
    ) = 
# 178 "src/parser/cparser.mly"
    ( Var id )
# 322 "src/parser/cparser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 8 "src/parser/cparser.mly"
       (string)
# 329 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | PAREN_CLOSE ->
        _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_goto_statement : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.statement) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | WHILE_KW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PAREN_OPEN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BANG ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | BIT_AND ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | COMPLEMENT ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | ID _v ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
                | INT _v ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
                | MINUS ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | MULT ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | PAREN_OPEN ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | SIZEOF_KW ->
                    _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState145
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState137 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((_menhir_stack, _menhir_s), _, (init : (
# 40 "src/parser/cparser.mly"
      (exp)
# 419 "src/parser/cparser.ml"
        ))), _, (cond : (
# 40 "src/parser/cparser.mly"
      (exp)
# 423 "src/parser/cparser.ml"
        ))), _, (post : (
# 40 "src/parser/cparser.mly"
      (exp)
# 427 "src/parser/cparser.ml"
        ))), _, (body : (Ast.statement))) = _menhir_stack in
        let _8 = () in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.statement) = 
# 121 "src/parser/cparser.mly"
    ( For { init; cond; post; body; } )
# 437 "src/parser/cparser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((_menhir_stack, _menhir_s), _, (init : (Ast.decl_exp))), _, (cond : (
# 40 "src/parser/cparser.mly"
      (exp)
# 446 "src/parser/cparser.ml"
        ))), _, (post : (
# 40 "src/parser/cparser.mly"
      (exp)
# 450 "src/parser/cparser.ml"
        ))), _, (body : (Ast.statement))) = _menhir_stack in
        let _8 = () in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.statement) = 
# 125 "src/parser/cparser.mly"
    ( ForDecl { init; cond; post; body; } )
# 460 "src/parser/cparser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
    | MenhirState119 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE_KW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | BRACE_OPEN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | BREAK_KW ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | CHAR_KW ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | CONTINUE_KW ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | DOUBLE_KW ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | DO_KW ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | FLOAT_KW ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | FOR_KW ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | GOTO_KW ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | ID _v ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState163 _v
            | IF_KW ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState163 _v
            | INT_KW ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | RETURN_KW ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | SEMICOLON ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | VOID_KW ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | WHILE_KW ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState163)
        | BANG | BIT_AND | BRACE_CLOSE | BRACE_OPEN | BREAK_KW | CHAR_KW | COMPLEMENT | CONTINUE_KW | DOUBLE_KW | DO_KW | FLOAT_KW | FOR_KW | GOTO_KW | ID _ | IF_KW | INT _ | INT_KW | MINUS | MULT | PAREN_OPEN | RETURN_KW | SEMICOLON | SIZEOF_KW | VOID_KW | WHILE_KW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _v : (Ast.statement option) = 
# 155 "src/parser/cparser.mly"
    ( None )
# 530 "src/parser/cparser.ml"
             in
            _menhir_goto_if_fstat _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState163 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, (fstat : (Ast.statement))) = _menhir_stack in
        let _1 = () in
        let _v : (Ast.statement option) = 
# 156 "src/parser/cparser.mly"
                              ( Some fstat )
# 547 "src/parser/cparser.ml"
         in
        _menhir_goto_if_fstat _menhir_env _menhir_stack _v
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _, (cond : (
# 40 "src/parser/cparser.mly"
      (exp)
# 556 "src/parser/cparser.ml"
        ))), _, (body : (Ast.statement))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.statement) = 
# 128 "src/parser/cparser.mly"
    ( While (cond, body) )
# 564 "src/parser/cparser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
    | MenhirState169 | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | BIT_AND ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | BRACE_OPEN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | BREAK_KW ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | CHAR_KW ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | COMPLEMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | CONTINUE_KW ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | DOUBLE_KW ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | DO_KW ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | FLOAT_KW ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | FOR_KW ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | GOTO_KW ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | ID _v ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
        | IF_KW ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
        | INT_KW ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | MINUS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | MULT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | PAREN_OPEN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | RETURN_KW ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | SEMICOLON ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | SIZEOF_KW ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | VOID_KW ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | WHILE_KW ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | BRACE_CLOSE ->
            _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169)
    | _ ->
        _menhir_fail ()

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAREN_OPEN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | BIT_AND ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | COMPLEMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | ID _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | MINUS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | MULT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | PAREN_OPEN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | SIZEOF_KW ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.statement) = 
# 141 "src/parser/cparser.mly"
    ( Nop )
# 677 "src/parser/cparser.ml"
     in
    _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAREN_OPEN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | BIT_AND ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | COMPLEMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | ID _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v
        | MINUS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | MULT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | PAREN_OPEN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | SIZEOF_KW ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "src/parser/cparser.mly"
       (string)
# 753 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (l : (
# 8 "src/parser/cparser.mly"
       (string)
# 767 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.statement) = 
# 137 "src/parser/cparser.mly"
    ( Label l )
# 773 "src/parser/cparser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
    | PAREN_OPEN ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
    | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | DIV | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS | MINUS_EQ | MOD | MOD_EQ | MULT | MULT_EQ | NEQ | OR | PLUS | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT | SHIFT_LEFT_EQ | SHIFT_RIGHT | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (l : (
# 8 "src/parser/cparser.mly"
       (string)
# 806 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.statement) = 
# 139 "src/parser/cparser.mly"
    ( Goto l )
# 813 "src/parser/cparser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAREN_OPEN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | BIT_AND ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | CHAR_KW ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | COMPLEMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | DOUBLE_KW ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | FLOAT_KW ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | ID _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | INT_KW ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | MINUS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | MULT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | PAREN_OPEN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | SIZEOF_KW ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | VOID_KW ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | BRACE_OPEN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | BREAK_KW ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | CHAR_KW ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | CONTINUE_KW ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | DOUBLE_KW ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | DO_KW ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | FLOAT_KW ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | FOR_KW ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | GOTO_KW ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | ID _v ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
    | IF_KW ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
    | INT_KW ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | RETURN_KW ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | SEMICOLON ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | VOID_KW ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | WHILE_KW ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.statement) = 
# 135 "src/parser/cparser.mly"
    ( Continue )
# 954 "src/parser/cparser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run141 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.statement) = 
# 133 "src/parser/cparser.mly"
    ( Break )
# 980 "src/parser/cparser.ml"
         in
        _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | BRACE_OPEN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | BREAK_KW ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CHAR_KW ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | CONTINUE_KW ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DOUBLE_KW ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DO_KW ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | FLOAT_KW ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | FOR_KW ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | GOTO_KW ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | ID _v ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | IF_KW ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | INT_KW ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | RETURN_KW ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SEMICOLON ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | VOID_KW ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | WHILE_KW ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | BRACE_CLOSE ->
        _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 1061 "src/parser/cparser.ml"
        ))), _, (es : (Ast.exp list))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.exp list) = 
# 96 "src/parser/cparser.mly"
    ( e :: es )
# 1067 "src/parser/cparser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (id : (
# 8 "src/parser/cparser.mly"
       (string)
# 1082 "src/parser/cparser.ml"
            ))), _, (args : (Ast.exp list))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 1089 "src/parser/cparser.ml"
            ) = 
# 182 "src/parser/cparser.mly"
    ( Call (id, args) )
# 1093 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.exp list) = 
# 93 "src/parser/cparser.mly"
    ( [] )
# 1110 "src/parser/cparser.ml"
     in
    _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v

and _menhir_run33 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1117 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run35 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1149 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_run65 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1181 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_run37 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1213 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

and _menhir_run67 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1245 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1277 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run69 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1309 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_run71 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1341 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1373 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run73 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1405 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1437 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run79 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1469 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79

and _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1501 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run81 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1533 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState81
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1565 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run83 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1597 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1629 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1661 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1693 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1725 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run59 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1757 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run85 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1789 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run61 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1821 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_run87 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1853 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1885 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run89 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1917 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89

and _menhir_run75 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1949 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75

and _menhir_run91 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 1981 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 2013 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run77 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 40 "src/parser/cparser.mly"
      (exp)
# 2045 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77

and _menhir_goto_decl_exp_init : _menhir_env -> 'ttv_tail -> (Ast.exp option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (e : (Ast.exp option)) = _v in
    let ((_menhir_stack, _menhir_s, (var_type : (Ast.type_def))), (id : (
# 8 "src/parser/cparser.mly"
       (string)
# 2082 "src/parser/cparser.ml"
    ))) = _menhir_stack in
    let _v : (Ast.decl_exp) = 
# 148 "src/parser/cparser.mly"
  ( { var_type; name = id; init = e } )
# 2087 "src/parser/cparser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 | MenhirState169 | MenhirState111 | MenhirState119 | MenhirState163 | MenhirState160 | MenhirState137 | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (de : (Ast.decl_exp))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.statement) = 
# 110 "src/parser/cparser.mly"
    ( Decl de )
# 2105 "src/parser/cparser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 | MenhirState6 | MenhirState172 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (de : (Ast.decl_exp))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.statement) = 
# 67 "src/parser/cparser.mly"
    ( Decl de )
# 2166 "src/parser/cparser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CHAR_KW ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | DOUBLE_KW ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | FLOAT_KW ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | INT_KW ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | VOID_KW ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | EOF ->
                _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_params : _menhir_env -> 'ttv_tail -> _menhir_state -> ((string option * Ast.type_def) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (t : (Ast.type_def))), (id : (string option))), _, (ps : ((string option * Ast.type_def) list))) = _menhir_stack in
        let _3 = () in
        let _v : ((string option * Ast.type_def) list) = 
# 90 "src/parser/cparser.mly"
    ( (id, t) :: ps )
# 2210 "src/parser/cparser.ml"
         in
        _menhir_goto_params _menhir_env _menhir_stack _menhir_s _v
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BRACE_OPEN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAREN_OPEN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | BIT_AND ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | CHAR_KW ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | COMPLEMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | DOUBLE_KW ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | FLOAT_KW ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | ID _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | INT_KW ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | MINUS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | MULT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | PAREN_OPEN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | SIZEOF_KW ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | VOID_KW ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "src/parser/cparser.mly"
       (int)
# 2378 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 6 "src/parser/cparser.mly"
       (int)
# 2386 "src/parser/cparser.ml"
    )) = _v in
    let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2391 "src/parser/cparser.ml"
    ) = 
# 160 "src/parser/cparser.mly"
    ( Const (Int i) )
# 2395 "src/parser/cparser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "src/parser/cparser.mly"
       (string)
# 2402 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PAREN_OPEN ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
    | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS | MINUS_EQ | MOD | MOD_EQ | MULT | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT | SHIFT_LEFT_EQ | SHIFT_RIGHT | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
        _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 40 "src/parser/cparser.mly"
      (exp)
# 2515 "src/parser/cparser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2590 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2596 "src/parser/cparser.ml"
            ) = 
# 168 "src/parser/cparser.mly"
    ( UnOp (Not, e) )
# 2600 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2679 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2683 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2689 "src/parser/cparser.ml"
            ) = let aop = 
# 219 "src/parser/cparser.mly"
           ( XorEq )
# 2693 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 2698 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2745 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2749 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2755 "src/parser/cparser.ml"
            ) = let op = 
# 205 "src/parser/cparser.mly"
        ( Xor )
# 2759 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2764 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT | SHIFT_LEFT_EQ | SHIFT_RIGHT | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2793 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2797 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2803 "src/parser/cparser.ml"
            ) = let op = 
# 207 "src/parser/cparser.mly"
                ( ShiftR )
# 2807 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2812 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT | SHIFT_LEFT_EQ | SHIFT_RIGHT | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2837 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2841 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2847 "src/parser/cparser.ml"
            ) = let op = 
# 190 "src/parser/cparser.mly"
         ( Add )
# 2851 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2856 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2871 "src/parser/cparser.ml"
        ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2875 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2881 "src/parser/cparser.ml"
        ) = let op = 
# 192 "src/parser/cparser.mly"
         ( Mult )
# 2885 "src/parser/cparser.ml"
         in
        
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2890 "src/parser/cparser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2899 "src/parser/cparser.ml"
        ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2903 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2909 "src/parser/cparser.ml"
        ) = let op = 
# 194 "src/parser/cparser.mly"
        ( Mod )
# 2913 "src/parser/cparser.ml"
         in
        
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2918 "src/parser/cparser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2927 "src/parser/cparser.ml"
        ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2931 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2937 "src/parser/cparser.ml"
        ) = let op = 
# 193 "src/parser/cparser.mly"
        ( Div )
# 2941 "src/parser/cparser.ml"
         in
        
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2946 "src/parser/cparser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT | SHIFT_LEFT_EQ | SHIFT_RIGHT | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2965 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2969 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 2975 "src/parser/cparser.ml"
            ) = let op = 
# 191 "src/parser/cparser.mly"
          ( Sub )
# 2979 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 2984 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT | SHIFT_LEFT_EQ | SHIFT_RIGHT | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3013 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3017 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3023 "src/parser/cparser.ml"
            ) = let op = 
# 206 "src/parser/cparser.mly"
               ( ShiftL )
# 3027 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3032 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3073 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3077 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3083 "src/parser/cparser.ml"
            ) = let op = 
# 200 "src/parser/cparser.mly"
        ( Neq )
# 3087 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3092 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3125 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3129 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3135 "src/parser/cparser.ml"
            ) = let op = 
# 195 "src/parser/cparser.mly"
       ( Lt )
# 3139 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3144 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3177 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3181 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3187 "src/parser/cparser.ml"
            ) = let op = 
# 196 "src/parser/cparser.mly"
       ( Le )
# 3191 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3196 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3229 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3233 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3239 "src/parser/cparser.ml"
            ) = let op = 
# 197 "src/parser/cparser.mly"
       ( Gt )
# 3243 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3248 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | GE | GT | LE | LT | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3281 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3285 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3291 "src/parser/cparser.ml"
            ) = let op = 
# 198 "src/parser/cparser.mly"
       ( Ge )
# 3295 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3300 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | DOUBLE_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | NEQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3341 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3345 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3351 "src/parser/cparser.ml"
            ) = let op = 
# 199 "src/parser/cparser.mly"
              ( Eq )
# 3355 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3360 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3405 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3409 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3415 "src/parser/cparser.ml"
            ) = let op = 
# 203 "src/parser/cparser.mly"
            ( BitAnd )
# 3419 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3424 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3503 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3507 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3513 "src/parser/cparser.ml"
            ) = let aop = 
# 221 "src/parser/cparser.mly"
                   ( ShiftREq )
# 3517 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 3522 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3601 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3605 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3611 "src/parser/cparser.ml"
            ) = let aop = 
# 220 "src/parser/cparser.mly"
                  ( ShiftLEq )
# 3615 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 3620 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | COLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3797 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3801 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3807 "src/parser/cparser.ml"
            ) = let aop = 
# 212 "src/parser/cparser.mly"
            ( AddEq )
# 3811 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 3816 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ | BIT_OR_EQ | COLON | COMMA | DIV_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3869 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3873 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3879 "src/parser/cparser.ml"
            ) = let op = 
# 202 "src/parser/cparser.mly"
       ( Or )
# 3883 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3888 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND_EQ | BIT_OR | BIT_OR_EQ | COLON | COMMA | DIV_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3937 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3941 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 3947 "src/parser/cparser.ml"
            ) = let op = 
# 204 "src/parser/cparser.mly"
           ( BitOr )
# 3951 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 3956 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | AND | BIT_AND_EQ | BIT_OR_EQ | COLON | COMMA | DIV_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | OR | PAREN_CLOSE | PLUS_EQ | QUESTION | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4007 "src/parser/cparser.ml"
            ))), _, (e2 : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4011 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4017 "src/parser/cparser.ml"
            ) = let op = 
# 201 "src/parser/cparser.mly"
        ( And )
# 4021 "src/parser/cparser.ml"
             in
            
# 164 "src/parser/cparser.mly"
    ( BinOp (op, e1, e2) )
# 4026 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState79 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4105 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4109 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4115 "src/parser/cparser.ml"
            ) = let aop = 
# 214 "src/parser/cparser.mly"
            ( MultEq )
# 4119 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4124 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4203 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4207 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4213 "src/parser/cparser.ml"
            ) = let aop = 
# 216 "src/parser/cparser.mly"
           ( ModEq )
# 4217 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4222 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4301 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4305 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4311 "src/parser/cparser.ml"
            ) = let aop = 
# 213 "src/parser/cparser.mly"
             ( SubEq )
# 4315 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4320 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4399 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4403 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4409 "src/parser/cparser.ml"
            ) = let aop = 
# 211 "src/parser/cparser.mly"
       ( AssignEq )
# 4413 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4418 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4497 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4501 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4507 "src/parser/cparser.ml"
            ) = let aop = 
# 215 "src/parser/cparser.mly"
           ( DivEq )
# 4511 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4516 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4595 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4599 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4605 "src/parser/cparser.ml"
            ) = let aop = 
# 218 "src/parser/cparser.mly"
              ( BitOrEq )
# 4609 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4614 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (lexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4693 "src/parser/cparser.ml"
            ))), _, (rexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4697 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4703 "src/parser/cparser.ml"
            ) = let aop = 
# 217 "src/parser/cparser.mly"
               ( BitAndEq )
# 4707 "src/parser/cparser.ml"
             in
            
# 176 "src/parser/cparser.mly"
    ( Assign (aop, lexp, rexp) )
# 4712 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ | BIT_OR_EQ | COLON | COMMA | DIV_EQ | EQ | MINUS_EQ | MOD_EQ | MULT_EQ | PAREN_CLOSE | PLUS_EQ | SEMICOLON | SHIFT_LEFT_EQ | SHIFT_RIGHT_EQ | XOR_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (cond : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4769 "src/parser/cparser.ml"
            ))), _, (texp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4773 "src/parser/cparser.ml"
            ))), _, (fexp : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4777 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4784 "src/parser/cparser.ml"
            ) = 
# 180 "src/parser/cparser.mly"
    ( Condition (cond, texp, fexp) )
# 4788 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4803 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4809 "src/parser/cparser.ml"
        ) = 
# 174 "src/parser/cparser.mly"
    ( AddressOf e )
# 4813 "src/parser/cparser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | COLON | COMMA | PAREN_CLOSE | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4886 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 4892 "src/parser/cparser.ml"
            ) = 
# 166 "src/parser/cparser.mly"
    ( UnOp (Complement, e) )
# 4896 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState98 | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | PAREN_CLOSE ->
                _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5004 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _v : (Ast.exp list) = 
# 94 "src/parser/cparser.mly"
            ( [e] )
# 5009 "src/parser/cparser.ml"
             in
            _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5024 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5030 "src/parser/cparser.ml"
        ) = 
# 170 "src/parser/cparser.mly"
    ( UnOp (Negate, e) )
# 5034 "src/parser/cparser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5043 "src/parser/cparser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5049 "src/parser/cparser.ml"
        ) = 
# 172 "src/parser/cparser.mly"
    ( Dereference e )
# 5053 "src/parser/cparser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5110 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5117 "src/parser/cparser.ml"
            ) = 
# 162 "src/parser/cparser.mly"
    ( e )
# 5121 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5202 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5210 "src/parser/cparser.ml"
            ) = 
# 186 "src/parser/cparser.mly"
    ( SizeofExp e )
# 5214 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | BRACE_OPEN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | BREAK_KW ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | CHAR_KW ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | CONTINUE_KW ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | DOUBLE_KW ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | DO_KW ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | FLOAT_KW ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | FOR_KW ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | GOTO_KW ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | ID _v ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
            | IF_KW ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
            | INT_KW ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | RETURN_KW ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | SEMICOLON ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | VOID_KW ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | WHILE_KW ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5429 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.statement) = 
# 112 "src/parser/cparser.mly"
    ( ReturnVal e )
# 5436 "src/parser/cparser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState117 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | BRACE_OPEN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | BREAK_KW ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | CHAR_KW ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | CONTINUE_KW ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | DOUBLE_KW ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | DO_KW ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | FLOAT_KW ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | FOR_KW ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | GOTO_KW ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | ID _v ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
            | IF_KW ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
            | INT_KW ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | RETURN_KW ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | SEMICOLON ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | VOID_KW ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | WHILE_KW ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState119
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState129 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 5655 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.exp option) = 
# 152 "src/parser/cparser.mly"
               ( Some e )
# 5661 "src/parser/cparser.ml"
             in
            _menhir_goto_decl_exp_init _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | BRACE_OPEN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | BREAK_KW ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | CHAR_KW ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | CONTINUE_KW ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | DOUBLE_KW ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | DO_KW ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | FLOAT_KW ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | FOR_KW ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | GOTO_KW ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | ID _v ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
            | IF_KW ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
            | INT_KW ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | RETURN_KW ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | SEMICOLON ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | VOID_KW ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | WHILE_KW ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | SEMICOLON ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s), _, (body : (Ast.statement))), _, (cond : (
# 40 "src/parser/cparser.mly"
      (exp)
# 6053 "src/parser/cparser.ml"
                ))) = _menhir_stack in
                let _7 = () in
                let _6 = () in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : (Ast.statement) = 
# 131 "src/parser/cparser.mly"
    ( Do (cond, body) )
# 6063 "src/parser/cparser.ml"
                 in
                _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState18 | MenhirState169 | MenhirState111 | MenhirState119 | MenhirState163 | MenhirState160 | MenhirState137 | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (
# 40 "src/parser/cparser.mly"
      (exp)
# 6156 "src/parser/cparser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.statement) = 
# 114 "src/parser/cparser.mly"
    ( Exp e )
# 6162 "src/parser/cparser.ml"
             in
            _menhir_goto_statement _menhir_env _menhir_stack _menhir_s _v
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState158 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | BIT_AND_EQ ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | BIT_OR_EQ ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | DIV ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack)
        | DIV_EQ ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | DOUBLE_EQ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | GE ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | LE ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack)
        | MINUS_EQ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack)
        | MOD_EQ ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | MULT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | MULT_EQ ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | BIT_AND ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | BRACE_OPEN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | BREAK_KW ->
                _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | CHAR_KW ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | COMPLEMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | CONTINUE_KW ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | DOUBLE_KW ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | DO_KW ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | FLOAT_KW ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | FOR_KW ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | GOTO_KW ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | ID _v ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | IF_KW ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | INT_KW ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | MINUS ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | MULT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | PAREN_OPEN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | RETURN_KW ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | SEMICOLON ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | SIZEOF_KW ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | VOID_KW ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | WHILE_KW ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160)
        | PLUS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack)
        | PLUS_EQ ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack)
        | QUESTION ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_LEFT_EQ ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack)
        | SHIFT_RIGHT_EQ ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack)
        | XOR ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack)
        | XOR_EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_ID_ : _menhir_env -> 'ttv_tail -> (string option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CHAR_KW ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | DOUBLE_KW ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | FLOAT_KW ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INT_KW ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | VOID_KW ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | PAREN_CLOSE ->
            _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14)
    | PAREN_CLOSE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (t : (Ast.type_def))), (id : (string option))) = _menhir_stack in
        let _v : ((string option * Ast.type_def) list) = 
# 88 "src/parser/cparser.mly"
    ( [(id, t)] )
# 6446 "src/parser/cparser.ml"
         in
        _menhir_goto_params _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.type_def) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_menhir_stack, _menhir_s, (t : (Ast.type_def))) = _menhir_stack in
    let _2 = () in
    let _v : (Ast.type_def) = 
# 53 "src/parser/cparser.mly"
    ( PointerType t )
# 6465 "src/parser/cparser.ml"
     in
    _menhir_goto_type_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce6 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _v : (Ast.exp option) = 
# 151 "src/parser/cparser.mly"
    ( None )
# 6474 "src/parser/cparser.ml"
     in
    _menhir_goto_decl_exp_init _menhir_env _menhir_stack _v

and _menhir_reduce57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : ((string option * Ast.type_def) list) = 
# 86 "src/parser/cparser.mly"
    ( [] )
# 6483 "src/parser/cparser.ml"
     in
    _menhir_goto_params _menhir_env _menhir_stack _menhir_s _v

and _menhir_run129 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | BIT_AND ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | COMPLEMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | MINUS ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | MULT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | PAREN_OPEN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | SIZEOF_KW ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_goto_decls : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.statement list * Ast.fun_decl list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState172 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (fd : (
# 39 "src/parser/cparser.mly"
      (fun_decl)
# 6525 "src/parser/cparser.ml"
        ))), _, (ds : (Ast.statement list * Ast.fun_decl list))) = _menhir_stack in
        let _v : (Ast.statement list * Ast.fun_decl list) = 
# 61 "src/parser/cparser.mly"
                             ( let (vds,fds) = ds in (vds,fd :: fds) )
# 6530 "src/parser/cparser.ml"
         in
        _menhir_goto_decls _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (vd : (Ast.statement))), _, (ds : (Ast.statement list * Ast.fun_decl list))) = _menhir_stack in
        let _v : (Ast.statement list * Ast.fun_decl list) = 
# 62 "src/parser/cparser.mly"
                             ( let (vds,fds) = ds in (vd::vds, fds))
# 6540 "src/parser/cparser.ml"
         in
        _menhir_goto_decls _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (ds : (Ast.statement list * Ast.fun_decl list))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 38 "src/parser/cparser.mly"
      (Ast.prog)
# 6556 "src/parser/cparser.ml"
            ) = 
# 56 "src/parser/cparser.mly"
                   ( let (vds, fds) = ds in Prog (vds, fds) )
# 6560 "src/parser/cparser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 38 "src/parser/cparser.mly"
      (Ast.prog)
# 6567 "src/parser/cparser.ml"
            )) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_type_def : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.type_def) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState172 | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack)
            | PAREN_OPEN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | CHAR_KW ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                | DOUBLE_KW ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                | FLOAT_KW ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                | INT_KW ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                | VOID_KW ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                | PAREN_CLOSE ->
                    _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
            | SEMICOLON ->
                _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MULT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState14 | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (x : (
# 8 "src/parser/cparser.mly"
       (string)
# 6645 "src/parser/cparser.ml"
            )) = _v in
            let _v : (string option) = 
# 116 "<standard.mly>"
    ( Some x )
# 6650 "src/parser/cparser.ml"
             in
            _menhir_goto_option_ID_ _menhir_env _menhir_stack _v
        | MULT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _v : (string option) = 
# 114 "<standard.mly>"
    ( None )
# 6660 "src/parser/cparser.ml"
             in
            _menhir_goto_option_ID_ _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | MULT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack)
        | PAREN_CLOSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t : (Ast.type_def))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 40 "src/parser/cparser.mly"
      (exp)
# 6687 "src/parser/cparser.ml"
            ) = 
# 184 "src/parser/cparser.mly"
    ( SizeofType t )
# 6691 "src/parser/cparser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState169 | MenhirState18 | MenhirState111 | MenhirState163 | MenhirState119 | MenhirState160 | MenhirState137 | MenhirState138 | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack)
            | SEMICOLON ->
                _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MULT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState172 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState163 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState158 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState137 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState129 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState119 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState117 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState113 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState89 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState79 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.statement list * Ast.fun_decl list) = 
# 60 "src/parser/cparser.mly"
    ( ([], []) )
# 6994 "src/parser/cparser.ml"
     in
    _menhir_goto_decls _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.type_def) = 
# 47 "src/parser/cparser.mly"
            ( VoidType )
# 7006 "src/parser/cparser.ml"
     in
    _menhir_goto_type_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.type_def) = 
# 48 "src/parser/cparser.mly"
           ( IntType )
# 7018 "src/parser/cparser.ml"
     in
    _menhir_goto_type_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.type_def) = 
# 50 "src/parser/cparser.mly"
             ( FloatType )
# 7030 "src/parser/cparser.ml"
     in
    _menhir_goto_type_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.type_def) = 
# 51 "src/parser/cparser.mly"
              ( DoubleType )
# 7042 "src/parser/cparser.ml"
     in
    _menhir_goto_type_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.type_def) = 
# 49 "src/parser/cparser.mly"
            ( CharType )
# 7054 "src/parser/cparser.ml"
     in
    _menhir_goto_type_def _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 38 "src/parser/cparser.mly"
      (Ast.prog)
# 7073 "src/parser/cparser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CHAR_KW ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DOUBLE_KW ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FLOAT_KW ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT_KW ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VOID_KW ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF ->
        _menhir_reduce8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 222 "src/parser/cparser.mly"
  

# 7107 "src/parser/cparser.ml"

# 269 "<standard.mly>"
  

# 7112 "src/parser/cparser.ml"
