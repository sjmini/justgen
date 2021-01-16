let src_extension = ".s"

let collect_src (dir:string) : string list = 
  let rec collect_src_impl (dir:string) (src:string list) =
    let all_files = Sys.readdir dir |> Array.to_list |> List.map (fun x -> dir ^
      "/" ^ x) in
    let subdirs = List.filter Sys.is_directory all_files in
    let specs = List.filter (fun f -> String.equal (Filename.extension f)
      src_extension) all_files in
    List.fold_left (fun src subdir -> collect_src_impl subdir src) 
      (src @ specs) subdirs 
  in
  collect_src_impl dir []
