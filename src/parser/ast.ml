open Core

exception CodePPError of string


type type_def =
  | VoidType
  | IntType
  | ShortIntType
  | LongIntType
  | LongLongIntType
  | CharType
  | FloatType
  | DoubleType
  | ArrayType of int * type_def
  | ConstType of type_def
  | PointerType of type_def
[@@deriving sexp]

type const =
  | Int of int
  | Char of char
  | Float of float
  | String of string
[@@deriving sexp]

type assign_op =
  | AssignEq (* = *)
  | AddEq (* += *)
  | SubEq (* -= *)
  | MultEq (* *= *)
  | DivEq (* /= *)
  | ModEq (* %= *)
  | BitAndEq (* &= *)
  | BitOrEq (* |= *)
  | XorEq (* ^= *)
  | ShiftLEq (* <<= *)
  | ShiftREq (* >>= *)
[@@deriving sexp]

type unop = Negate | Pos | Complement | Not
[@@deriving sexp]

type binop =
  | Add
  | Sub
  | Mult
  | Div
  | Mod
  | Lt
  | Gt
  | Le
  | Ge
  | Neq
  | Eq
  | And
  | Or
  | BitAnd
  | BitOr
  | Xor
  | ShiftL
  | ShiftR
[@@deriving sexp]

type exp =
  | Assign of assign_op * exp * exp
  | Var of string
  | Const of const
  | UnOp of unop * exp
  | BinOp of binop * exp * exp
  | Condition of exp * exp * exp
  | Call of string * exp list
  | AddressOf of exp
  | Dereference of exp
  | SizeofType of type_def
  | SizeofExp of exp
[@@deriving sexp]

type decl_exp = {
  var_type: type_def;
  name: string;
  init: exp option;
} [@@deriving sexp]

type block = statement list
and statement =
  | Compound of block
  | Decl of decl_exp
  | Exp of exp
  | ReturnVal of exp
  | If of {
      cond : exp;
      tstat : statement;
      fstat : statement option;
    }
    (* TODO: option inti, cond, post *)
  | For of {
      init : exp;
      cond : exp;
      post : exp;
      body : statement;
    }
  | ForDecl of {
      init : decl_exp;
      cond : exp;
      post : exp;
      body : statement;
    }
  | While of exp * statement
  | Do of exp * statement
  | Break | Continue
  | Label of string
  | Goto of string
  | Nop
[@@deriving sexp]

type fun_decl = {
  name : string;
  fun_type : type_def;
  params : (string option * type_def) list;
  body : block;
}
[@@deriving sexp]

type prog = Prog of statement list * fun_decl list
[@@deriving sexp]

let string_of_prog p = p |> sexp_of_prog |> Sexp.to_string_hum ~indent:4

let rec pp_type fmt typ =
  match typ with
  | VoidType -> Format.fprintf fmt "void " 
  | ShortIntType -> Format.fprintf fmt "ShortIntType: Not Yet"
  | IntType -> Format.fprintf fmt "int "
  | LongIntType -> Format.fprintf fmt "long "
  | LongLongIntType -> Format.fprintf fmt "LongLongIntType: Not Yet"
  | CharType -> Format.fprintf fmt "char "
  | FloatType -> Format.fprintf fmt "float "
  | DoubleType -> Format.fprintf fmt "double "
  | ArrayType (n, t) -> Format.fprintf fmt "ArrayType: Not Yet"
  | ConstType t -> Format.fprintf fmt "const : Not Yet"
  | PointerType t -> Format.fprintf fmt "%a*" pp_type t 

let op_map = function
  | AddEq -> Add
  | SubEq -> Sub
  | MultEq -> Mult
  | DivEq -> Div
  | ModEq -> Mod
  | BitAndEq -> BitAnd
  | BitOrEq -> BitOr
  | XorEq -> Xor
  | ShiftLEq -> ShiftL
  | ShiftREq -> ShiftR
  | AssignEq -> raise (CodePPError "cannot map op_map AssignEQ")

let pp_const fmt c =
  match c with
  | Int i -> Format.fprintf fmt "%d" i 
  | Char c -> Format.fprintf fmt "%c" c
  | String s -> Format.fprintf fmt "%s" s
  | _ -> raise (CodePPError "Not yet pp_const")

let pp_unop fmt (uop : unop) =
  match uop with
  | Negate -> Format.fprintf fmt "--"
  | Pos -> Format.fprintf fmt "++"
  | Complement -> Format.fprintf fmt "~"
  | Not -> Format.fprintf fmt "!"

let pp_binop fmt bop =
  match bop with
  | Add -> Format.fprintf fmt "+"
  | Sub -> Format.fprintf fmt "-" 
  | Mult -> Format.fprintf fmt "*"
  | Div -> Format.fprintf fmt "/"
  | Mod -> Format.fprintf fmt "%s" "%"
  | Xor -> Format.fprintf fmt "^"
  | BitAnd -> Format.fprintf fmt "&"
  | BitOr -> Format.fprintf fmt "|"
  | ShiftL -> Format.fprintf fmt "<<"
  | ShiftR -> Format.fprintf fmt ">>"
  | Eq -> Format.fprintf fmt "="
  | Neq -> Format.fprintf fmt "!="
  | Lt -> Format.fprintf fmt "<"
  | Le -> Format.fprintf fmt "<="
  | Gt -> Format.fprintf fmt ">"
  | Ge -> Format.fprintf fmt ">="
  | Or -> Format.fprintf fmt "||"
  | And -> Format.fprintf fmt "&&"

let rec pp_args fmt args =
  match args with
  | [(Var id)] -> Format.fprintf fmt "%s" id 
  | (Var id) :: args -> Format.fprintf fmt "%s,%a" id pp_args args
  | [] -> Format.fprintf fmt ""


let rec pp_exp fmt e =
  match e with
  | Assign (AssignEq, Var id, rexp) -> Format.fprintf fmt "%s = %a" id pp_exp rexp
  | Assign (AssignEq, Dereference pt, rexp) -> Format.fprintf fmt "*%a = %a"
  pp_exp pt pp_exp rexp  
  | Assign (AssignEq, _, rexp) -> raise (CodePPError 
                            "the left hand side of an assignment should be a
                            variable or a dereference")
  | Assign (op, lexp, rexp) -> (*x += 3*) 
      let bexp = (BinOp (op_map op, lexp, rexp)) in
      Format.fprintf fmt "%a" pp_exp bexp
  | Var id -> Format.fprintf fmt "%s" id
  | Const c -> Format.fprintf fmt "%a" pp_const c
  | UnOp (uop, e) -> 
      Format.fprintf fmt "%a%a" pp_unop uop pp_exp e 
  | BinOp (bop, e1, e2) -> 
      Format.fprintf fmt "%a%a%a" pp_binop bop pp_exp e1 pp_exp e2
  | Condition (cond, texp, fexp) -> raise (CodePPError "does not support condition")
  | AddressOf (Var id) -> Format.fprintf fmt "&%s" id
  | AddressOf _ -> raise (CodePPError "Not possible case of AddressOf")
  | Dereference e -> Format.fprintf fmt "*%a" pp_exp e
  | SizeofType t -> Format.fprintf fmt "sizeof(%a)" pp_type t 
  | SizeofExp e -> Format.fprintf fmt "sizeof(%a)" pp_exp e
  | Call (f, args) -> Format.fprintf fmt "%s(%a)" f pp_args args

let pp_decl_exp fmt de =
  match de.init with
  | Some iexp -> Format.fprintf fmt " %a %s = %a;\n" pp_type de.var_type de.name pp_exp iexp
  | None -> Format.fprintf fmt " %a %s;\n" pp_type de.var_type de.name

let rec pp_statement fmt sta =
  match sta with
  | Decl de -> Format.fprintf fmt "%a" pp_decl_exp de
  | Exp e -> Format.fprintf fmt "%a" pp_exp e
  | ReturnVal e -> Format.fprintf fmt " return %a;" pp_exp e
  | Compound ss -> Format.fprintf fmt "{ %a }" pp_statements ss
  | If ifs -> 
      (match ifs.fstat with
        | Some fs -> Format.fprintf fmt "if (%a) %a %a" pp_exp ifs.cond
        pp_statement ifs.tstat pp_statement fs 
        | None -> Format.fprintf fmt "if (%a) %a" pp_exp ifs.cond pp_statement
        ifs.tstat
      )
  | While (cond, body) -> Format.fprintf fmt "while (%a) %a" pp_exp cond
  pp_statement body
  | Do (cond, body) -> Format.fprintf fmt "do %a while (%a);\n" pp_statement body pp_exp
  cond
  | For f -> Format.fprintf fmt "For statement is not support"
  | ForDecl f -> Format.fprintf fmt "ForDecl statement is not support"
  | Break -> Format.fprintf fmt "Break statement is not support"
  | Continue -> Format.fprintf fmt "Continue statement is not support"
  | Label l -> Format.fprintf fmt "Label statement is not support"
  | Goto l -> Format.fprintf fmt "Goto statement is not support"
  | Nop -> Format.fprintf fmt ";\n"
  (*and pp_for pp_init cond post body ctx = ()*)
  and pp_statements fmt stas =
    match stas with
    | s :: ss -> Format.fprintf fmt "%a" pp_statement s;
                 Format.fprintf fmt "%a" pp_statements ss
    |[] -> ()


(*let pp_statements fmt f =
  Format.fprintf fmt "%s" "hnm"*)
let rec pp_fun_params fmt params =
  match params with
  | (None,t)::[] -> Format.fprintf fmt "%a" pp_type t
  | (Some v, t)::[] -> Format.fprintf fmt "%a %s" pp_type t v
  | (None,t) :: ps -> Format.fprintf fmt "%a,%a" pp_type t pp_fun_params ps
  | (Some v, t) :: ps -> Format.fprintf fmt "%a %s,%a" pp_type t v pp_fun_params ps
  | [] -> Format.fprintf fmt ""

let pp_fun fmt func = 
  Format.fprintf fmt "%a %s(%a) {\n%a\n}\n\n" pp_type func.fun_type func.name
  pp_fun_params func.params pp_statements func.body

(*
let rec gen_funlist2 fmt flist =
  List.iter (fun f ->
    Format.fprintf fmt "%a" gen_fun f
  ) flist
*)

let rec pp_funlist fmt node = 
  match node with
  | f :: fs -> Format.fprintf fmt "%a" pp_fun f;
               Format.fprintf fmt "%a" pp_funlist fs
  | [] -> ()

let rec pp_statelist fmt node =
  Format.fprintf fmt "%a" pp_statements node


let pp_prog fmt node =
  match node with
  | Prog ([],[]) -> ();
  | Prog (slist,[]) -> Format.fprintf fmt "%a" pp_statelist slist
  | Prog ([],flist) -> Format.fprintf fmt "%a" pp_funlist flist
  | Prog (slist, flist) -> Format.fprintf fmt "%a\n%a" pp_statelist slist  pp_funlist flist 
