type t

val create : string -> t

val print : t -> unit

val preconds_of_unrefined_type_name : Mapping.t -> t -> string -> (int64 * bool) list
