%token KW_SPEC KW_TYPE KW_RULE KW_DEFTYPE KW_REFINE KW_IN KW_UNSPEC
%token LSPAREN RSPAREN LMPAREN RMPAREN STAR COMMA AND OR DOT BANG AT SHARP 
%token OP_SUBTYPE 
%token <string> NAME
%token EOF 
%left AND OR
%type <SlangAST.Node.t> main
%start main
%%

main:
  decls EOF { SlangAST.Node.mk_program $1 !SourcePosition.curpos}
  ;
decls: 
  | decl { [$1] }
  | decl decls { $1 :: $2 }
  ;
decl: 
  | KW_DEFTYPE NAME OP_SUBTYPE NAME { 
      SlangAST.Node.mk_type_declaration $2 ~parent_type:$4 !SourcePosition.curpos
    }
  | KW_DEFTYPE NAME { SlangAST.Node.mk_type_declaration $2 !SourcePosition.curpos}
  | KW_REFINE NAME KW_IN typ { SlangAST.Node.mk_refine_declaration $2 $4 !SourcePosition.curpos}
  | KW_RULE LMPAREN funspecs funtype RMPAREN { SlangAST.Node.mk_rule $3 $4 !SourcePosition.curpos}
  ;
funspecs: 
  | spec { SlangAST.Node.mk_fun_spec_list [$1] !SourcePosition.curpos}
  | spec funspecs { 
      match $2 with 
      | SlangAST.Node.FunSpecList (l,_) -> SlangAST.Node.mk_fun_spec_list ($1 :: l) !SourcePosition.curpos
      | _ -> failwith "parsing error" 
    }
  ;
funtype:
  KW_TYPE fulltyp NAME LSPAREN types RSPAREN { 
      SlangAST.Node.mk_fun_type $2 (SlangAST.Node.mk_fun_name $3 !SourcePosition.curpos) $5 !SourcePosition.curpos
    }
  ;
spec:
  | funspec { $1 }
  | unspec { $1 }
  ;
funspec:
  KW_SPEC fulltyp NAME LSPAREN types RSPAREN { 
      SlangAST.Node.mk_fun_spec $2 (SlangAST.Node.mk_fun_name $3 !SourcePosition.curpos) $5 !SourcePosition.curpos
    }
  ;
unspec:
  KW_UNSPEC fulltyp NAME LSPAREN types RSPAREN { 
      SlangAST.Node.mk_fun_unspec $2 (SlangAST.Node.mk_fun_name $3 !SourcePosition.curpos) $5 !SourcePosition.curpos
    }
  ;
types:
  | fulltyp { SlangAST.Node.mk_param_type_list [$1] !SourcePosition.curpos}
  | fulltyp COMMA types { 
      match $3 with 
      | SlangAST.Node.ParamTypeList (l, _) -> SlangAST.Node.mk_param_type_list ($1 :: l) !SourcePosition.curpos
      | _ -> failwith "parsing error" 
    }
  ;
fulltyp:
  | btyp { SlangAST.Node.mk_type $1 !SourcePosition.curpos}
  | btyp AT refinement { SlangAST.Node.mk_type $1 ~refinement:$3 !SourcePosition.curpos}
  ;
btyp: 
  | SHARP typ { SlangAST.Node.mk_sharp_type $2 !SourcePosition.curpos}
  | typ { $1 }
  ;
typ: 
  | DOT { SlangAST.Node.dot_type !SourcePosition.curpos} 
  | typ STAR { SlangAST.Node.mk_ptr_type $1 !SourcePosition.curpos}
  | NAME { SlangAST.Node.mk_base_type $1 !SourcePosition.curpos}
  ;
refinement: 
  predicate { SlangAST.Node.mk_refinement $1 !SourcePosition.curpos}
  ;
predicate:
  | LSPAREN predicate RSPAREN { $2 }
  | BANG NAME { (SlangAST.Node.mk_predicate $2 !SourcePosition.curpos |> SlangAST.Node.mk_refined_by_not) !SourcePosition.curpos}
  | NAME { SlangAST.Node.mk_predicate $1 !SourcePosition.curpos}
  | predicate AND predicate { SlangAST.Node.mk_refined_by_and $1 $3 !SourcePosition.curpos}
  | predicate OR predicate { SlangAST.Node.mk_refined_by_or $1 $3 !SourcePosition.curpos}
  
