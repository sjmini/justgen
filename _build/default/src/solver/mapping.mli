type t

val create : string -> t

val bits_of_unrefined_type_name : t -> string -> int64

val unrefined_type_name_of_bits : t -> int64 -> string

val bits_of_refinement_name : t -> string -> int64

val refinement_name_of_bits_and_unrefined_type_name : t -> int64 -> string -> string

val get_subtype_names : t -> string -> string list

val get_possible_refinements_bits : t -> string -> int64

val print : t -> unit
