type t

val is_rule : SlangAST.Node.t -> bool

val get_rules : SlangAST.Node.t -> t list

val get_fun_name : t -> string

val get_fun_type : t -> SlangAST.Node.t

val print : t -> unit

val encode : Mapping.t -> Preconds.t -> Z3.context -> t -> Z3.Expr.expr list

val split : t -> t list
