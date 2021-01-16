type expr_helpers = 
  private {
    btrue : Z3.Expr.expr;
    bnot : Z3.Expr.expr -> Z3.Expr.expr;
    band : Z3.Expr.expr list -> Z3.Expr.expr;
    bor : Z3.Expr.expr list -> Z3.Expr.expr;
    beq : Z3.Expr.expr -> Z3.Expr.expr -> Z3.Expr.expr;
    is : Z3.Expr.expr -> Z3.Expr.expr -> Z3.Expr.expr;
    x : int -> string -> Z3.Expr.expr;
    bv_mk_const : string -> Z3.Expr.expr;
    bv_mk_numeral : int64 -> Z3.Expr.expr;
    bvand : Z3.Expr.expr -> Z3.Expr.expr -> Z3.Expr.expr;
    bvsub : Z3.Expr.expr -> Z3.Expr.expr -> Z3.Expr.expr }

type bv_helpers =
  private {
    of_unrefined_type : string -> Z3.Expr.expr;
    of_refinement : string -> Z3.Expr.expr }

val get_expr_helpers : Z3.context -> expr_helpers

val get_bv_helpers : Mapping.t -> Z3.context -> bv_helpers
