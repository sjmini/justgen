type t = (string, string list * bool) Hashtbl.t

let create file_name =
  let comment_regexp = Str.regexp {|//.*|} in
  let ut_name_regexp = Str.regexp {|\([a-zA-Z0-9_]+\) *:|} in
  let precond_regexp = Str.regexp {|-? *\([a-zA-Z0-9_-]+\( *|| *[a-zA-Z0-9_-]+\)+\) *-> *\(x?or\)|} in

  let ic = open_in file_name in
  let preconds = Hashtbl.create 100 in

  let rec loop cur_ut_name =
    try
      let line = String.trim (input_line ic) in
      if Str.string_match comment_regexp line 0 || line = "" then
        loop cur_ut_name
      else if Str.string_match ut_name_regexp line 0 then
        loop (Str.matched_group 1 line)
      else if Str.string_match precond_regexp line 0 then
        let r_names_string = Str.matched_group 1 line in
        let is_xor_string = Str.matched_group 3 line in
        let r_names =
          Str.split (Str.regexp_string "||") r_names_string
          |> List.map String.trim in
        let is_xor = is_xor_string = "xor" in
        Hashtbl.add preconds cur_ut_name (r_names, is_xor);
        loop cur_ut_name
      else
        failwith "wrong format"
    with End_of_file -> close_in ic in
  loop "";
  preconds

let print preconds =
  Hashtbl.iter
    (fun ut_name (precond, is_xor) ->
      Printf.printf "%s: " ut_name;
      print_string (String.concat " || " precond);
      print_string " -> ";
      if is_xor then print_string "xor\n" else print_string "or\n" )
    preconds

let preconds_of_unrefined_type_name mapping preconds ut_name =
  let bits_of_r_names r_names =
    List.fold_left
      (fun acc r_name ->
        let bits = Mapping.bits_of_refinement_name mapping r_name in
        Int64.logor acc bits )
      0L
      r_names in

  let base_ut_name =
    if String.contains ut_name '*' then
      String.sub ut_name 0 (String.length ut_name - 1)
    else
      ut_name in
  let preconds_of_utn = Hashtbl.find_all preconds base_ut_name in
  List.map
    (fun (r_names, is_xor) -> (bits_of_r_names r_names, is_xor))
    preconds_of_utn
