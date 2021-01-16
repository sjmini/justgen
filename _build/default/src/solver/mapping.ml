type t =
  { bits_of_utn : (string, int64) Hashtbl.t;
    utn_of_bits : (int64, string) Hashtbl.t;

    bits_of_rn : (string, int64) Hashtbl.t;
    rn_of_bits_utn : ((int64 * string), string) Hashtbl.t;

    rns_of_utn : (string, string) Hashtbl.t }

let create file_name =
  let type_regexp = Str.regexp {|\([01 ]+\): *\([a-zA-Z0-9_]+ *\*?\)|} in
  let refine_regexp = Str.regexp {|\([01 ]+\): *\([a-zA-Z0-9_-]+\) +in +\([a-zA-Z0-9_]+ *\*?\)|} in

  let ic = open_in file_name in
  let bits_of_utn = Hashtbl.create 100 in
  let utn_of_bits = Hashtbl.create 100 in
  let bits_of_rn = Hashtbl.create 100 in
  let rn_of_bits_utn = Hashtbl.create 100 in
  let rns_of_utn = Hashtbl.create 100 in

  let parse_raw_bit_string raw_bit_string =
    Int64.of_string ("0b" ^ (String.concat "" (String.split_on_char ' ' raw_bit_string))) in

  let rec loop () =
    try
      let line = String.trim (input_line ic) in
      if line = "Type" || line = "Refine" || line = "" then
        loop ()
      else if Str.string_match refine_regexp line 0 then
        let raw_bit_string = Str.matched_group 1 line in
        let bits = parse_raw_bit_string raw_bit_string in
        let masked_bits = Int64.logand bits Constants.refinement_mask in
        let r_name = Str.matched_group 2 line in
        let ut_name = Str.matched_group 3 line in
        Hashtbl.add bits_of_rn r_name masked_bits;
        Hashtbl.add rn_of_bits_utn (masked_bits, ut_name) r_name;
        Hashtbl.add rns_of_utn ut_name r_name;
        loop ()
      else if Str.string_match type_regexp line 0 then
        let raw_bit_string = Str.matched_group 1 line in
        let bits = parse_raw_bit_string raw_bit_string in
        let ut_name = Str.matched_group 2 line in
        Hashtbl.add bits_of_utn ut_name bits;
        Hashtbl.add utn_of_bits bits ut_name;
        loop ()
      else
        failwith "wrong format"
    with End_of_file -> close_in ic in
  loop ();
  { bits_of_utn = bits_of_utn; 
    utn_of_bits = utn_of_bits;
    bits_of_rn = bits_of_rn;
    rn_of_bits_utn = rn_of_bits_utn;
    rns_of_utn = rns_of_utn }

let is bits1 bits2 =
  Int64.logand bits1 bits2 = bits2

let bits_of_unrefined_type_name mapping ut_name =
  if String.contains ut_name '*' then
    let base_ut_name = String.sub ut_name 0 (String.length ut_name - 1) in
    let base_ut_bits = Hashtbl.find mapping.bits_of_utn base_ut_name in
    Int64.logor base_ut_bits Constants.ptr_mask
  else
    Hashtbl.find mapping.bits_of_utn ut_name

let unrefined_type_name_of_bits mapping bits =
  if is bits Constants.ptr_mask then
    let masked_bits = Int64.logand bits (Int64.lognot Constants.ptr_mask) in
    (Hashtbl.find mapping.utn_of_bits masked_bits) ^ "*"
  else
    Hashtbl.find mapping.utn_of_bits bits

let bits_of_refinement_name mapping r_name =
  Hashtbl.find mapping.bits_of_rn r_name

let refinement_name_of_bits_and_unrefined_type_name mapping bits ut_name =
  Hashtbl.find mapping.rn_of_bits_utn (bits, ut_name)

let get_subtype_names mapping ut_name =
  if String.contains ut_name '*' then
    let base_ut_name = String.sub ut_name 0 (String.length ut_name - 1) in
    let bits = Hashtbl.find mapping.bits_of_utn base_ut_name in
    Hashtbl.fold
      (fun cur_ut_name cur_bits acc ->
        if is cur_bits bits then (cur_ut_name ^ "*") :: acc else acc)
      mapping.bits_of_utn
      []
  else
    let bits = Hashtbl.find mapping.bits_of_utn ut_name in
    Hashtbl.fold
      (fun cur_ut_name cur_bits acc ->
        if is cur_bits bits then cur_ut_name :: acc else acc)
      mapping.bits_of_utn
      []

let get_possible_refinements_bits mapping ut_name =
  let r_names = Hashtbl.find_all mapping.rns_of_utn ut_name in
  List.fold_left
    (fun acc r_name -> Int64.logor (bits_of_refinement_name mapping r_name) acc)
    0L
    r_names

let print mapping =
  print_endline "bits_of_utn:";
  Hashtbl.iter
    (fun ut_name bits -> Printf.printf "%s : 0x%Lx\n" ut_name bits)
    mapping.bits_of_utn;
  
  print_endline "\nbits_of_rn:";
  Hashtbl.iter
    (fun r_name bits -> Printf.printf "%s : 0x%Lx\n" r_name bits)
    mapping.bits_of_rn;
  
  print_endline "\nrns_of_utn:";    
  Hashtbl.iter
    (fun ut_name r_name -> Printf.printf "%s in %s\n" r_name ut_name)
    mapping.rns_of_utn;
  
  print_endline "\nget_subtype_names:";
  Hashtbl.iter
    (fun ut_name _ ->
      List.iter
        (fun subtype_name -> Printf.printf "%s <: %s\n" subtype_name ut_name)
        (get_subtype_names mapping ut_name) )
    mapping.bits_of_utn;

  print_newline ()
