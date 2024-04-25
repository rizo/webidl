module String_map = Map.Make (String)
module String_set = Set.Make (String)

let print fmt = Printf.kfprintf (fun oc -> output_char oc '\n') stdout fmt
let fail fmt = Printf.ksprintf failwith fmt
let ( = ) : int -> int -> bool = ( = )
let ( < ) : int -> int -> bool = ( < )
let ( > ) : int -> int -> bool = ( > )
let ( <= ) : int -> int -> bool = ( <= )
let ( >= ) : int -> int -> bool = ( >= )
