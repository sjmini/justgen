let curpos = ref (0,0)

type t = int * int

let mk ln col = (ln, col)

let pp fmt (ln, col) = 
  Format.fprintf fmt "[ line: %d, column: %d ]" ln col

