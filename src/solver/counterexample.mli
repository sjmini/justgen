type t

val create : Z3.Model.model -> t

val print : t -> unit

val encode : Z3.context -> t -> Z3.Expr.expr

val to_fun_unspec : Mapping.t -> Rule.t -> t -> SlangAST.Node.t
