open Z3
open SlangAST.Node

type expr_helpers = 
  { btrue : Z3.Expr.expr;
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
  { of_unrefined_type : string -> Z3.Expr.expr;
    of_refinement : string -> Z3.Expr.expr }

let get_expr_helpers ctx =
  { btrue = Boolean.mk_true ctx;
    bnot = Boolean.mk_not ctx;
    band = Boolean.mk_and ctx;
    bor = Boolean.mk_or ctx;
    beq = Boolean.mk_eq ctx;
    is = (fun x bv ->
      (Boolean.mk_eq ctx (BitVector.mk_and ctx x bv) bv) );
    x = (fun i subscript ->
      (BitVector.mk_const_s ctx ("x_" ^ (string_of_int i) ^ "_" ^ subscript) Constants.bv_size) );
    bv_mk_const = (fun const_name ->
      (BitVector.mk_const_s ctx const_name Constants.bv_size) );
    bv_mk_numeral = (fun n ->
      (BitVector.mk_numeral ctx (Int64.to_string n) Constants.bv_size) );
    bvand = BitVector.mk_and ctx;
    bvsub = BitVector.mk_sub ctx }

let get_bv_helpers mapping ctx =
  { of_unrefined_type = (fun ut_name ->
      let bits = Mapping.bits_of_unrefined_type_name mapping ut_name in
      (BitVector.mk_numeral ctx (Int64.to_string bits) Constants.bv_size) );
    of_refinement = (fun r_name ->
      let bits = Mapping.bits_of_refinement_name mapping r_name in
      (BitVector.mk_numeral ctx (Int64.to_string bits) Constants.bv_size) ) }
