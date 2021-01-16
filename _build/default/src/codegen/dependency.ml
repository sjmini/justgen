open SlangAST.Node 
module Type = TypeChecker.Type


module Refine = struct
  type t = Pos of String.t
  | Neg of String.t
  [@@deriving compare]

  let mk s = Pos s

  let negate = function
    | Pos s -> Neg s
    | Neg s -> Pos s

  let pp fmt r = 
    match r with
    | Pos s -> Format.fprintf fmt "%s" s
    | Neg s -> Format.fprintf fmt "!%s" s
end

module RefineSet = Set.Make(Refine)

module SetOfRefineSet = Set.Make(RefineSet)

module TList = struct 
  module L = Base.List 
  
  type t = (Type.t * RefineSet.t) L.t 
  [@@deriving compare] 
end 
  
module LSet = Set.Make(TList)



let pp_refine_set fmt rs = 
  let fst = ref true in 
  RefineSet.iter (fun r -> 
    if !fst then
      begin
        fst := false; 
        Format.fprintf fmt "%a" Refine.pp r
      end
    else 
      Format.fprintf fmt " && %a" Refine.pp r) rs

module FunType = struct
  module S = RefineSet

  (* for just one function, all parameters info  *)
  type param_list_t = (Type.t * S.t) Base.List.t
  [@@deriving compare]

  type t = String.t * param_list_t
  [@@deriving compare]
  
  let empty = ("", [])

  let is_empty n = (compare empty n) == 0
  let mk t rs = (t, rs)

  let mk_n n = n
  
  let get_fn (fn, params) = fn

  let pp fmt (fn, params) = 
    begin
      Format.fprintf fmt "%s(" fn;
      let fst = ref true in
      (Base.List.iter params 
        ~f:(fun (t, s) -> 
          if !fst then 
            begin
              fst := false;
              if RefineSet.is_empty s 
              then Format.fprintf fmt "%a" Type.pp t
              else Format.fprintf fmt "%a@%a" Type.pp t pp_refine_set s
            end
          else
            if RefineSet.is_empty s
            then Format.fprintf fmt ", %a" Type.pp t
            else Format.fprintf fmt ", %a@%a" Type.pp t pp_refine_set s));
      Format.fprintf fmt ")"
    end
end

(*
module FunParmType = struct
  module S = SetOfRefineSet

  type t = Type.t * S.t 
  [@@deriving compare]
      
  let mk t rs = (t, rs)

  (*
  let pp fmt (t, rs) = 
    Format.fprintf fmt "%a@%a" Type.pp t pp_refine_set rs
    *)
end
*)

module FunRetType = struct
  module S = RefineSet
  type t = Type.t * S.t 
  [@@deriving compare]
      
  let mk t rs = (t, rs)

  let pp fmt (t, rs) =
    if RefineSet.is_empty rs 
    then Format.fprintf fmt "%a" Type.pp t
    else Format.fprintf fmt "%a@%a" Type.pp t pp_refine_set rs
end

module FunTypeMap = Map.Make(FunRetType)


module FunTypeSet = struct
  include Set.Make(FunType)

  let pp fmt fns = 
    let fst = ref true in 
    iter (fun fn -> 
      if !fst then
        begin
          fst := false; 
          Format.fprintf fmt "%a" FunType.pp fn
        end
      else 
        Format.fprintf fmt ", %a" FunType.pp fn)
    fns
end

type t = FunTypeSet.t FunTypeMap.t

let pp fmt ftm = 
  let fst = ref true in 
  FunTypeMap.iter (fun k v -> 
    if !fst then
      begin
        fst := false; 
        Format.fprintf fmt "[(%a) |-> (%a)]" FunRetType.pp k FunTypeSet.pp v
      end
    else 
      Format.fprintf fmt "\n[(%a) |-> (%a)]" FunRetType.pp k FunTypeSet.pp v)
  ftm


let cart_prod s1 s2 =
  SetOfRefineSet.fold (fun ele1 acc1 ->
    SetOfRefineSet.fold (fun ele2 acc2 -> SetOfRefineSet.add (RefineSet.union
    ele1 ele2) acc2) s2 acc1)
  s1 SetOfRefineSet.empty

let extract_refines r = 
  let open SlangAST.Node in
  let rec impl = function
    | Refinement (t, _) -> impl t
    | RefinedByAnd (t1, t2, _) -> 
        cart_prod (impl t1) (impl t2)
    | RefinedByOr (t1, t2, _) -> 
        SetOfRefineSet.union (impl t1) (impl t2)
    | RefinedByNot (RefinePredicate (s, _), _) -> 
        SetOfRefineSet.singleton (RefineSet.singleton (Refine.mk s |>
        Refine.negate)) 
    | RefinePredicate (s, _) -> 
        SetOfRefineSet.singleton (RefineSet.singleton (Refine.mk s)) 
    | _ -> failwith "Cannot use a negation operator for not a sinlge
    refinement."
  in
  impl r


let update k fn params m =
  let impl param m = 
    FunTypeMap.update k (fun prev_fns ->
      match prev_fns with
      | Some s -> 
          Some (FunTypeSet.add (fn, param) s)
      | None ->
          Some (FunTypeSet.singleton (fn, param))
    ) m
  in
  LSet.fold impl params m
(* val fold : (elt -> 'a -> 'a) -> t -> 'a -> 'a *)

let f_param t acc = 
  match t with
  | Type (ty, r_opts, _) -> (
     let parm_t = Type.convert_node_to_type ty in
      match r_opts with
      | Some r ->
          let rs_set = extract_refines r in
          (parm_t, rs_set) :: acc
      | None ->
          (parm_t, SetOfRefineSet.empty) :: acc
    )
  | _ -> failwith "Function parameters must be Type"


let merge_fun_info param_list accum = 
   let thirdI = (fun p_t lst rs acc -> 
     let elem = (p_t, rs) in 
     let lst' = elem :: lst in
     LSet.add lst' acc)
   in
   let secondI = (fun p_t sr lst acc ->
     if (SetOfRefineSet.is_empty sr) then
       begin
         thirdI p_t lst RefineSet.empty acc
       end
     else SetOfRefineSet.fold (thirdI p_t lst) sr acc
   )
   in
   let firstI = (fun (p_t, sr) acc ->
      LSet.fold (secondI p_t sr) acc LSet.empty
   )
   in
   List.fold_right firstI param_list accum

(*module FunParmList = List.Make(FunParmType)*)

let rec init_fun_type spc_map ast = 
  (*let module TList = struct module L = Base.List type t = (Type.t *
  RefineSet.t) L.t [@@deriving compare] end in
  let module LSet = Set.Make(TList) in *)
  (*
  let update k fn params m =
    let impl param m = 
      FunTypeMap.update k (fun prev_fns ->
        match prev_fns with
        | Some s -> 
            Some (FunTypeSet.add (fn, param) s)
        | None ->
            Some (FunTypeSet.singleton (fn, param))
      ) m
    in
    LSet.fold impl params m
  in
  *)
 (* let open SlangAST.Node in *)
  match ast with
  | Program (decllist, _) ->
      List.fold_left (fun spc_map' n -> init_fun_type spc_map' n) spc_map decllist
  | Rule (fslist, _, _) ->
      init_fun_type spc_map fslist
  | FunSpecList (fslist', _) ->
      List.fold_left (fun spc_map' n -> init_fun_type spc_map' n) spc_map fslist'
  | FunSpec (Type(t, r_opt, _), FunName (fn, _), ParamTypeList (plist, _), _) -> (
      let ret_t = Type.convert_node_to_type t in
      let param_list = List.fold_right f_param plist []
      in
      let param_set = merge_fun_info param_list (LSet.singleton []) in (
      match r_opt with
      | Some r ->
          let rs_set = extract_refines r in
          let f = (fun rs m -> update (FunRetType.mk ret_t rs) fn param_set m) in
          SetOfRefineSet.fold f rs_set spc_map
      | None -> 
          update (FunRetType.mk ret_t FunRetType.S.empty) fn param_set spc_map
      ))
  | _ -> spc_map
  

(*  *)
let mk_fun_type_map ast = 
   let res = init_fun_type FunTypeMap.empty ast in
   (*Format.printf "%a\n@." pp res;*)
   res


