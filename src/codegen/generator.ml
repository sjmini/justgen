open Dependency
open SlangAST.Node
open TypeChecker.Type


module V = Set.Make(String)

module FNode = struct
  
  type t = { fn:FunType.t; mutable children:t list; mutable parent:string;
  mutable index:int; mutable ret:Type.t; mutable ret_conds:RefineSet.t; base_ret:string }

  let empty = {fn=FunType.empty; children=[]; parent=""; index=0; ret=NULL; ret_conds=RefineSet.empty; base_ret=""}

  let is_empty n = (n=empty) 

  let mk_node rt fn t = { fn=fn; children=[]; parent=""; index=0; ret=t; ret_conds=RefineSet.empty; base_ret=rt }

  let add_child n child_n = 
    let new_children = List.append n.children [child_n] in
    n.children <- new_children
    
  let add_parent n parent_n =
    n.parent <- parent_n

  let add_index n index_val =
    n.index <- index_val
(*
  let add_parent n parent_n =
    let new_parent = List.append n.parent [parent_n] in
    n.parent <- new_parent
*)
  let add_ret_conds n refine =
    n.ret_conds <- refine

  let get_fn n = n.fn
  
  let get_child n = n.children

  let get_ret n = n.ret 

  let rec pp_fnode_detail fmt res =
    FunType.pp fmt res.fn;
    Format.printf "\n@.";
    RefineSet.iter (fun z ->
      Format.fprintf fmt ":%a\n@." Refine.pp z
    )res.ret_conds

  let  pp_fnode fmt res =  
    let q = Queue.create () in
    (*pp_fnode_detail fmt res;*)
    Queue.push res q;
    while not (Queue.is_empty q) do
      let n = Queue.pop q in
      pp_fnode_detail fmt n;
      List.iter (fun r ->
        Queue.add r q 
      )n.children;
    done
end

module UnspecifyParam = LSet

module Unspecify = struct
  (*module S = Set.Make(UnspecifyParam)*)

  type t = String.t * String.t * UnspecifyParam.t
  [@@deriving compare]
end

module UnspecifySet = Set.Make(Unspecify)

module Code = Set.Make(String)
(*module Type = TypeChecker.Type*)



(*For variable name*)      
let rec pp_type_var fmt = function
  | PtrT s -> 
      Format.fprintf fmt "%a*" pp_type_var s
  | T s -> 
      if (String.compare s "va_list") == 0 then
        Format.fprintf fmt "jint"
      else
        Format.fprintf fmt "%s" s
  | NULL ->
      Format.fprintf fmt "Null"
  | DOT ->
      Format.fprintf fmt "jint"
      (*Format.fprintf fmt "Dot"*)

(*For func name*)      
let rec pp_type fmt = function
  | PtrT s -> 
      Format.fprintf fmt "%a_PTR" pp_type s
  | T s -> 
      Format.fprintf fmt "leaf_%s" s
  | NULL ->
      Format.fprintf fmt "leaf_Null"
  | DOT ->
      Format.fprintf fmt "leaf_Dot"

(*For func ret*)
let rec pp_ret fmt = function
  | BaseType(bn,_) -> Format.fprintf fmt "%s" bn 
  | PtrType(BaseType(t,_),_) -> Format.fprintf fmt "%s_PTR" t
  | _ -> Format.fprintf fmt "IGNORE" 
(*
  | Type(BaseType(bn,_),_,_) -> Format.fprintf fmt "%s" bn 
  | Type(PtrType(BaseType(t,_),_),_,_) -> Format.fprintf fmt "%s" t
*)

let getStringRegion_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==5) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let setObjectArrayElement_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==4) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let newString_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let isSameObject_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && ((!vid==2) || (!vid==3)) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let isInstanceOf_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let deleteLocalRef_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let deleteGlobalRef_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let newGlobalRef_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let findClass_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let defineClass_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && ((!vid==2) || (!vid==3)) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let ensureLocalCapacity_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isZero") == 0) && (!vid==2) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res

let getStringUTFRegion_check params =
  let res = ref true in
  let vid = ref 1 in
  List.iter (fun (pt,rs) ->
      SetOfRefineSet.iter (fun rr ->
        RefineSet.iter (fun r ->
          match r with
          | Pos s -> 
              let str_arg = String.sub s 0 6 in
              if ((String.compare str_arg "isNULL") == 0) && ((!vid==2) || (!vid==5)) then
                res := false
          | Neg s -> ()
    ) rr ) rs; vid := (!vid)+1
  ) params; !res


let rec parse_unspecify_func unspecify_fun_type ast =
  match ast with
  | Program (decllist, _) ->
      List.fold_left (fun fun_type' n -> parse_unspecify_func fun_type' n) unspecify_fun_type decllist
  | Rule (fslist, _, _) ->
      parse_unspecify_func unspecify_fun_type fslist
  | FunSpecList (fslist, _) ->
      List.fold_left (fun fun_type' n -> parse_unspecify_func fun_type' n) unspecify_fun_type fslist
  | FunUnSpec (Type(t,r_opt,_), FunName(fn,_), ParamTypeList(plist, _), _) -> (
      let res = ref true in
      let param_list = List.fold_right f_param plist [] in
      (*
      Format.printf "<<<<%s>>>>\n" fn;
      List.iter (fun (pt,rs) ->
        Format.printf ",%a@" Type.pp pt;
        SetOfRefineSet.iter (fun rr ->
          RefineSet.iter (fun r ->
          Format.printf "%a&&" Refine.pp r
          ) rr ) rs ) param_list;
      Format.printf "\n";
*)
      ( match fn with
      |"SetObjectArrayElement" -> (*Format.printf "HSJ:SetObjectArrayElement null 4\n";*)
          res := setObjectArrayElement_check param_list;
      |"GetStringRegion" -> (*Format.printf "HSJ:GetStringRegion null 5\n";*) 
          res := getStringRegion_check param_list;
      |"NewString" -> (*Format.printf "HSJ:NewString null 2\n";*)
          res := newString_check param_list;
      |"IsSameObject" -> (*Format.printf "HSJ:IsSameObject null 2 3\n";*)
          res := isSameObject_check param_list;
      |"IsInstanceOf" -> (*Format.printf "HSJ:IsInstanceOf null 2\n";*)
          res := isInstanceOf_check param_list;
      |"DeleteLocalRef" -> (*Format.printf "HSJ:DeleteLocalRef null 2\n";*)
          res := deleteLocalRef_check param_list;
      |"DeleteGlobalRef" -> (*Format.printf "HSJ:DeleteGlobalRef\n null 2";*)
          res := deleteGlobalRef_check param_list;
      |"NewGlobalRef" -> (*Format.printf "HSJ:NewGlobalRef\n"; null 2*)
          res := newGlobalRef_check param_list;
      |"FindClass" -> (*Format.printf "HSJ:FindClass\n null 2";*)
          res := findClass_check param_list;
      |"DefineClass" -> (*Format.printf "HSJ:DefineClass\n null 2 3";*)
          res := defineClass_check param_list; 
      |"EnsureLocalCapacity" -> (*Format.printf "HSJ:EnsureLocalCapacity iszero 2\n";*)
          res := ensureLocalCapacity_check param_list;
      |"GetStringUTFRegion" -> (*Format.printf "HSJ:GetStringUTFRegion null 2 5\n";*)
          res := getStringUTFRegion_check param_list;
      |_-> res := true
      );
    
    if(!res=true) then
      let param_set = merge_fun_info param_list (UnspecifyParam.singleton []) in
      let ret_t = Format.asprintf "%a" pp_ret t in
      UnspecifySet.add (ret_t, fn, param_set) unspecify_fun_type;
    else begin
      unspecify_fun_type
    end
    
      (*returns LSet = Set(TList) = TList(T,RefineSet)L*)
      (*
      let param_set = merge_fun_info param_list (UnspecifyParam.singleton []) in
      let ret_t = Format.asprintf "%a" pp_ret t in

      UnspecifySet.add (ret_t, fn, param_set) unspecify_fun_type 
      *)
      (*LSet.fold func_pointer param_set Code.empty fun_type*)
      (* End of FunSpec *)
  )
  | _ -> unspecify_fun_type


let set_length target_set =
  let count = ref 0 in
  RefineSet.iter (fun n ->
    count := !count+1
  ) target_set;
  count




(*Return FunType which is not called by parent.
 * This prevent cycle
 * checking with funName(string)
 *)
let rec no_cycle_func fun_list ps =
  let check = (fun (fn,params) final_fun_type ->
    let tmp = V.add fn V.empty in
    let re = V.diff tmp ps in
    if (V.is_empty re) then
      final_fun_type
    else
      begin
        FunType.mk fn params
      end
  )
  in
  FunTypeSet.fold check fun_list FunType.empty


(*typ= one parmeter type
 * refines = one parameter but all refines (RefineSet)
 * return FunRtyType, ret_cond:RefineSet
 * return FunType, ret_cond:RefineSet
 * ps = set of FunType (parent's FunType)
 * fun_info = FunTypeMap
*)
(* val fold : (key -> 'a -> 'b -> 'b) -> 'a t -> 'b -> 'b *)
let get_partial_func typ refines fun_info ps =
  let impl (n,r) fts (ft, rs) = (*fts=funTypeMap's FunTypeSet *)
    if (n = typ) && (RefineSet.subset r refines) then
          begin
              let diff_funtype = no_cycle_func fts ps in
              if not (FunType.is_empty diff_funtype) then
                begin
                    let diffset = RefineSet.diff refines r in
                    let len = set_length diffset in
                    let origin_len = set_length rs in(
                      if (!origin_len == 0) then
                        (diff_funtype, diffset)
                      else if !len < !origin_len then
                        begin
                        (*Format.printf "in here?\n@.";*)
                        (diff_funtype, diffset)
                        end
                      else (ft,rs)
                   )
                end
              else (ft,rs)
          end
    else
      (ft, rs)
    in
  FunTypeMap.fold impl fun_info (FunType.empty, RefineSet.empty)

(*
let get_partial_func typ refines fun_info ps =
  let impl (n,r) fts (ft, rs) = (*fts=funTypeMap's FunTypeSet *)
    if (n = typ) && (RefineSet.subset r refines) then
          begin
              let diff_funtype = FunTypeSet.diff fts ps in
              if not (FunTypeSet.is_empty diff_funtype) then
                begin
                    let diffset = RefineSet.diff refines r in
                    let len = set_length diffset in
                    let origin_len = set_length rs in(
                      if (!origin_len == 0) then
                        ((FunTypeSet.choose diff_funtype), diffset)
                      else if !len < !origin_len then
                        begin
                        (*Format.printf "in here?\n@.";*)
                        ((FunTypeSet.choose diff_funtype), diffset)
                        end
                      else (ft,rs)
                   )
                end
              else (ft,rs)
          end
    else
      (ft, rs)
    in
  FunTypeMap.fold impl fun_info (FunType.empty, RefineSet.empty)
  *)
  (*FunTypeMap.fold impl fun_info (FunRetType.mk NULL RefineSet.empty)*)





let pp_refine fmt = function
  | Dependency.Refine.Pos s -> Format.fprintf fmt "R%s" s
  | Dependency.Refine.Neg s -> Format.fprintf fmt "RNot_%s" s

let convert_to_string (t,refines) =
  let ty = Format.asprintf "%a" pp_type t in
  let r = RefineSet.fold (fun refine acc -> 
    (acc ^ (Format.asprintf "_%a" pp_refine refine))
  )refines ""
  in
  (ty^r)

let checkIsThisByteArray refines =
  let fst = ref false in
  let x = RefineSet.iter (fun r_s ->
    match r_s with
    | Dependency.Refine.Pos s ->
        if (String.compare s "isThisByteArray") == 0 then
          fst := true
    | Dependency.Refine.Neg s ->
        if(String.compare s "isThisByteArray") == 0 then
          fst := true
  )refines in
  x; !fst

let checkIsDeletedO refines =
  let fst = ref 0 in
  let x = RefineSet.iter (fun r_s ->
    match r_s with
    | Dependency.Refine.Pos s ->
        if (String.compare s "isDeletedO") == 0 then
          fst := 2
    | Dependency.Refine.Neg s ->
        if(String.compare s "isDeletedO") == 0 then
          fst := 1
  )refines in
  x; !fst

let checkIsNull refines =
  let fst = ref false in
  let x = RefineSet.iter (fun r_s ->
    match r_s with
    | Dependency.Refine.Pos s -> 
      if (String.length s) >= 6 then
        begin
          let sub_r_s = String.sub s 0 6 in
          if(String.compare sub_r_s "isNULL") == 0 then
            fst := true
        end
    | _ -> ()
  )refines in
  x; !fst

(*t = one parmeter type
 * refines = one parameter but all refines (RefineSet)
 * ps = set of FunType (parent's FunType set) -> change to string.
 * return FunType ret_cond(RefineSet)
*)
let get_exact_function t refines fun_info ps =
  let isNullCheck = checkIsNull refines in
  let isDeleteOCheck = checkIsDeletedO refines in
  if (isNullCheck) then
    begin
       let res = FunType.mk ("leaf_NULL") [] in
       (res, RefineSet.empty)
    end
  else if (isDeleteOCheck == 1) then
    begin
       let res = FunType.mk ("leaf_RNot_isDeletedO") [] in
       (res, refines)
       (*(res, RefineSet.empty)*)
    end
  else if (isDeleteOCheck == 2) then
    begin
       let res = FunType.mk ("leaf_RisDeletedO") [] in
       (res, refines)
       (*(res, RefineSet.empty)*)
    end
  else
    begin
      let key = (FunRetType.mk t refines) in
      match FunTypeMap.find_opt key fun_info with
      | Some fun_list -> (*FunTypeSet*)
          let target_fun = no_cycle_func fun_list ps in
          if (FunType.is_empty target_fun) then
          begin
            let res = FunType.mk (convert_to_string (t,refines)) [] in
            (res, RefineSet.empty)
          end
          else
            begin
              (*(target_fun, RefineSet.empty)*)
              (target_fun, refines)
            end
      | None ->
          let (sfunt, addRS) = get_partial_func t refines fun_info ps in
          if (FunType.is_empty sfunt) then
            begin
            let res = FunType.mk (convert_to_string (t,refines)) [] in
            (res, RefineSet.empty)
            end
          else
            begin
              (*(sfunt, addRS)*)
              (sfunt, refines)
            end
    end
(* old-version : checking parent functions with FunTypeSet.diff 
let get_exact_function t refines fun_info ps =
  let key = (FunRetType.mk t refines) in
  (*Format.printf "analyzing key : %a\n@." FunRetType.pp key;*)
  match FunTypeMap.find_opt key fun_info with
  | Some fun_list -> (*FunTypeSet*)
      (*let target_set = FunTypeSet.diff fun_list ps in*)
      let target_set = no_cycle_func fun_list ps in
      begin
      match FunTypeSet.choose_opt target_set with
      | Some res -> (res, RefineSet.empty)
      | None -> let res = FunType.mk (convert_to_string (t,refines)) [] in 
      (*| None -> let res = FunType.mk "leaf" [(t,refines)] in *)
          (res, RefineSet.empty) 
      end
  | None ->
      (*Returns : FunRetType*)
      (*let tmp_fun = get_partial_func t refines fun_info ps in*)
      let (sfunt, addRS) = get_partial_func t refines fun_info ps in
      (*Format.printf "analyzed : %a\n@." FunRetType.pp tmp_fun;*)
      (*let tmp_key = FunRetType.mk NULL RefineSet.empty in*)
      (*Format.printf "tmp : %a\n@." FunRetType.pp tmp_key;*)
      if (FunType.is_empty sfunt) then
        begin
        (*Format.printf "in leaf\n@.";*)
        let res = FunType.mk (convert_to_string (t,refines)) [] in
        (*let res = FunType.mk "leaf" [(t,refines)] in*)
        (res, RefineSet.empty)
        end
      else
        begin
          (sfunt, addRS)
        (*match FunTypeMap.find_opt tmp_fun fun_info with
        | Some fun_l ->
            let result = FunTypeSet.choose fun_l in
            let (r1,r2) = tmp_fun in
            let diff = RefineSet.diff refines r2 in
            (result,diff)
        | _ -> failwith "Failed in get_exact_function"*)
        end
*)


(* ret_t = return type of the function : leaf_%s
 * fn: string:fun_name
 * params: TList:parameter list for one condition
 * ps = FunTypeSet
 * return : FNode after DFS *)
let parse_func ret_t fn params fun_info =
  let q = Queue.create () in
  let fun_type = FunType.mk fn params in
  let base_node = FNode.mk_node ret_t fun_type NULL in
  begin
   (* Format.printf "%s\n@." fn; *)
    (*Format.printf "Unspecified : %a\n@." FunType.pp fun_type;*)
    (*Queue.push (base_node,(FunTypeSet.add fun_type FunTypeSet.empty)) q;*)
    let base_ps = V.add fn V.empty in
    Queue.push (base_node, base_ps, RefineSet.empty) q;
    while not (Queue.is_empty q) do
      let n, ps, rs = Queue.pop q in
      let (fname, p_refines_list) = n.fn in
        begin
          let index = ref 0 in (*For which parameter*)
          Base.List.iter p_refines_list
            ~f:(fun (t, p_refine_set) -> (* For each param *)
           (*Format.printf "before : %a\n@." FunRetType.pp (t, p_refine_set);*)
           (*Format.printf "before ps : %a\n@." FunTypeSet.pp ps;*)
           index := !index + 1;
           let (param_func,diff) = get_exact_function t p_refine_set fun_info ps in
           (*Format.printf "obatained : %a\n@." FunType.pp param_func;*)
           let param_node = FNode.mk_node ret_t param_func t in
           FNode.add_parent param_node fname;
           FNode.add_index param_node !index;
           (*let ps_prime = FunTypeSet.add param_func ps in*)
           let ps_prime = V.add (FunType.get_fn param_func) ps in
           let x = (if (RefineSet.is_empty rs) then
             begin
               FNode.add_ret_conds param_node diff;
               Queue.push (param_node, ps_prime, diff) q
             end
           else
             begin
               FNode.add_ret_conds param_node rs;
               Queue.push (param_node,ps_prime,rs) q
             end
           )
           in
           x;
           FNode.add_child n param_node
           )
        end
    done;
    base_node
  end

module Vtype = struct
  type t = String.t * String.t
  [@@deriving compare]
end


let id = ref 0

let new_uid () = 
  begin
    id := (!id)+1;
    "tmp_" ^ (string_of_int !id)
  end

let init_uid () =
  id := 0

let rec code_generate ({fn; children; ret; ret_conds; parent; index; base_ret}: FNode.t) unique_param flag set_var_type =
  let (fname,params) = fn in
  (*Format.printf "in fn = %s\n@." fname;*) 
  let codes = ("","") in
  let res = List.fold_left (fun ((gen_code, gen_param), set_var_type') n -> (
    let uid = new_uid () in
    let ((gen_code', gen_param'), set_var_type'') = code_generate n uid false set_var_type' in
    (*Format.printf "gen_code' = %s, gen_param' = %s\n@." gen_code' gen_param';*)
    let gen_f_param = (
      if (String.compare gen_param "") == 0 then
        gen_param'
      else
        (gen_param ^","^gen_param')
    ) in
    (((gen_code'^ gen_code), (gen_f_param)), set_var_type'')
  ))(codes, set_var_type) children

  in
  let ((g_c, g_p),vs) = res in
    (*Format.printf "one g_c = %s, g_p = %s\n@." g_c g_p;*) 
    let (pre_code,alt_set) = (
        let ret_refine = RefineSet.fold (fun r acc ->
          acc ^ "@" ^ (Format.asprintf "%a" Refine.pp r)
        )ret_conds ""
        in
      let end_with_len = (String.length fname)-1 in
      let end_with = String.sub fname end_with_len 1 in
      (*let end_with = String.sub fname 0 1 in*)
      if flag then
        let ex_check = "jthrowable exc = (*env)->ExceptionOccurred(env);\n assert(exc == NULL && \"JNI_Test_Gen_Fail\");\n" in
        if (String.compare ret_refine "") == 0 then
          begin
            if (String.compare end_with "V") == 0 then
              begin
                let s = "call_" ^ fname ^ "(" ^ g_p ^ ");\n" in
                (s,set_var_type)
              end
            else
              (* JNI_Output(a,env); *)
              begin
                 if (String.compare base_ret "void") == 0 then
                    let s = ex_check ^ "printf(\"Testing_EAN_JNI: \");\n fflush(stdout);\n (*env)->" ^ fname ^ "(" ^ g_p ^ ");\n" in
                    (s,set_var_type)
                 else if (String.compare base_ret "char") == 0 || (String.compare base_ret "jchar") == 0 then
                    let s = ex_check ^ "printf(\"Testing_EAN_JNI: \");\n fflush(stdout);\n JNI_Output_char((*env)->" ^ fname ^ "(" ^ g_p ^ "), env);\n" in
                    (s,set_var_type)
                 else if (String.compare base_ret "char_PTR") == 0 || (String.compare base_ret "jchar_PTR") == 0  then
                    let s = ex_check ^ "printf(\"Testing_EAN_JNI: \");\n fflush(stdout);\n JNI_Output_char_ptr((*env)->" ^ fname ^ "(" ^ g_p ^ "), env);\n" in
                    (s,set_var_type)
                 else if (String.compare base_ret "jstring") == 0 then 
                    let s = ex_check ^ "printf(\"Testing_EAN_JNI: \");\n fflush(stdout);\n JNI_Output_jstring((*env)->" ^ fname ^ "(" ^ g_p ^ "), env);\n" in
                    (s,set_var_type)
                 else
                    let s = ex_check ^ "printf(\"Testing_EAN_JNI: \");\n fflush(stdout);\n JNI_Output((*env)->" ^ fname ^ "(" ^ g_p ^ "), env);\n" in
                    (s,set_var_type)
              end
          end
        else
          begin
            if (String.compare end_with "V") == 0 then
              begin
                let s = "call_" ^ fname ^ "(" ^ g_p ^ "); //ret_conds:" ^ ret_refine ^ "\n" in
                (s,set_var_type)
              end
            else
              begin
                if (String.compare base_ret "void") == 0 then
                  let s = ex_check ^  "printf(\"Testing_EAN_JNI: \");\n fflush(stdout);\n (*env)->" ^ fname ^ "(" ^ g_p ^ ");\n" in
                  (s,set_var_type)
                 else if (String.compare base_ret "char") == 0 || (String.compare base_ret "jchar") ==0 then
                  let s = ex_check ^ "printf(\"testing_ean_jni: \");\n fflush(stdout);\n jni_output_char((*env)->" ^ fname ^ "(" ^ g_p ^ "), env); //ret_conds:" ^ ret_refine ^ "\n" in
                  (s,set_var_type)
                 else if (String.compare base_ret "char_PTR") == 0 || (String.compare base_ret "jchar_PTR") ==0 then
                  let s = ex_check ^ "printf(\"testing_ean_jni: \");\n fflush(stdout);\n jni_output_char_ptr((*env)->" ^ fname ^ "(" ^ g_p ^ "), env); //ret_conds:" ^ ret_refine ^ "\n" in
                  (s,set_var_type)
                 else if (String.compare base_ret "jstring") == 0 then 
                  let s = ex_check ^ "printf(\"testing_ean_jni: \");\n fflush(stdout);\n jni_output_jstring((*env)->" ^ fname ^ "(" ^ g_p ^ "), env); //ret_conds:" ^ ret_refine ^ "\n" in
                  (s,set_var_type)
                else
                  let s = ex_check ^ "printf(\"testing_ean_jni: \");\n fflush(stdout);\n jni_output((*env)->" ^ fname ^ "(" ^ g_p ^ "), env); //ret_conds:" ^ ret_refine ^ "\n" in
                  (s,set_var_type)
              end
          end
      else
        let r = Format.asprintf "%a" pp_type_var ret in
        let r_f = r ^ " " ^ unique_param ^ ";" in
        let s_f = V.add r_f set_var_type in
        
        let sub_str = String.sub fname 0 4 in
        if (String.compare sub_str "leaf") == 0 then
          begin
            if (String.compare fname "leaf_JNIEnv_PTR") == 0 then
              begin
                let t_f = unique_param ^ "= env; //parent:" ^ parent ^ " index:" ^ string_of_int index ^ " ret_conds:" ^ ret_refine ^ "\n" in
                (t_f, s_f)
              end
            else
              begin
                let t_f = unique_param ^ "=" ^ fname ^ "(leaf_env, \"" ^ parent^ "\", \"" ^ ret_refine ^ "\");\n" in
                (*let t_f = unique_param ^ "=" ^ fname ^ "(" ^ g_p ^ "); //parent:" ^ parent ^ " index:" ^ string_of_int index ^ " ret_conds:" ^ ret_refine ^ "\n" in *)
                (t_f, s_f)
              end
          end
        else (*no leaf funcs*)
          if (String.compare ret_refine "") ==0 then
            begin
              if (String.compare end_with "V") == 0 then
                begin
                  let t_f = unique_param ^ "=" ^ "call_" ^ fname ^ "(" ^ g_p ^ ");\n" in
                  (t_f, s_f)
                end
              else
                begin
                  let t_f = unique_param ^ "=" ^ "(*env)->" ^ fname ^ "(" ^ g_p ^ ");\n" in
                  (t_f, s_f)
                end
            end
          else
            begin
              if (String.compare end_with "V") == 0 then
                begin
                  let t_f = unique_param ^ "= call_" ^ fname ^ "(" ^ g_p ^ "); //" ^ ret_refine ^ "\n" in
                  (t_f, s_f)
                end
              else
                begin
                  let t_f = unique_param ^ "= (*env)->" ^ fname ^ "(" ^ g_p ^ "); //" ^ ret_refine ^ "\n" in
                  (t_f, s_f)
                end
            end
    )
    in
(*    Format.printf "two g_c = %s, g_p = %s\n@." g_c g_p; 
    Format.printf "pre_code = %s\n@." pre_code; *)
    (*(((g_c^pre_code),unique_param), (vs))*)
    (((g_c^pre_code),unique_param), (V.union vs alt_set))


let valid_unspec params = 
  let fst = ref false in
  let x = Base.List.iter params 
  ~f:(fun (t, p_refine_set) ->
    let result = checkIsThisByteArray p_refine_set in
    if (result) then
      fst := true
  ) in
  x; !fst


let load_file f =
  let ic = open_in f in
    let n = in_channel_length ic in
      let s = Bytes.create n in
        really_input ic s 0 n;
        close_in ic;
        (Bytes.unsafe_to_string s)
(* 
 * fun_info == funTypeMap for normal functions 
 * unspecify_func == funTypeMap for unspecified functions
*)  

let rec rmrf path = match Sys.is_directory path with
  | true ->
    Sys.readdir path |>
    Array.iter (fun name -> rmrf (Filename.concat path name));
    Unix.rmdir path
  | false -> Sys.remove path

let gen_start ast fun_info =
  (*Printf.printf "in gen_start";*)
  let unspecify_func = parse_unspecify_func UnspecifySet.empty ast in
(*  parse_unspecify_func UnspecifySet.empty ast*)
 
  (*Format.printf "Done parsing unspec\n@.";*)
  let fileID = ref 0 in
  let sourcefile = ref "" in
  let testfile = ref "" in
  let path = Sys.getcwd() in
  rmrf (path^"/test_case/");
  Unix.mkdir (path^"/test_case") 0o777;
  UnspecifySet.iter (fun (ret_t, fn, params) ->
    init_uid();
    LSet.iter (fun param ->
       let check_spec = valid_unspec param in
      if ((String.compare fn "ReleaseByteArrayElements") == 0) || (check_spec == false) then
        begin
          try
            let dirname = path^"/test_case/test"^(string_of_int !fileID) in
            Unix.mkdir dirname 0o777;
            testfile := dirname ^ "/HelloJNI.c";
            sourcefile := path^"/test/code/HelloJNI_spec.c";
            let tmp_str = (!sourcefile) in
            let pre_string = load_file tmp_str in
            let tmp_testfile = (!testfile) in
            let oc = open_out tmp_testfile in
            Printf.fprintf oc "%s\n" pre_string;
            fileID := (!fileID)+1;
            let base_node = parse_func ret_t fn param fun_info in
            let ((result,_), res_set) = code_generate base_node "" true V.empty in
            Format.printf "//test%d;Unspecified: %a\n@." (!fileID-1) FunType.pp (FNode.get_fn base_node);
            V.iter (fun s ->
              Printf.fprintf oc "%s\n" s
            ) res_set;
            Printf.fprintf oc "%s\n" result;
            
            Printf.fprintf oc "if ((*env)->ExceptionOccurred(env)) {\n";
            Printf.fprintf oc "printf(\"Unspecified_Exception_Occurs\\n\");\n";
            Printf.fprintf oc "(*env)->ExceptionDescribe(env);}\n";
            Printf.fprintf oc "return 0;\n";
            Printf.fprintf oc "}\n";
            close_out oc
            
          with e ->
          let msg = Printexc.to_string e
          and stack = Printexc.get_backtrace () in
          Format.printf "there was an error: %s%s\n" msg stack;

        end
  ) params ) unspecify_func;
  Format.printf "Last No. %s\n" (string_of_int (!fileID-1));
  
