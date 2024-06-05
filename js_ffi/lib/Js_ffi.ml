let phys_equal = Stdlib.( == )

type any

external raw : string -> any = "caml_pure_js_expr"
external any : 'a -> any = "%identity"

(* bool *)

external any_of_bool : bool -> any = "caml_js_from_bool"
external bool_of_any : any -> bool = "caml_js_to_bool"

(* int *)

external any_of_int : int -> any = "%identity"
external int_of_any : any -> int = "%identity"

(* float *)

external any_of_float : float -> any = "caml_js_from_float"
external float_of_any : any -> float = "caml_js_to_float"

(* string *)

external any_of_string : string -> any = "caml_jsstring_of_string"
external string_of_any : any -> string = "caml_string_of_jsstring"

(* char *)

let any_of_char x = any_of_int (Char.code x)
let char_of_any any = Char.chr (int_of_any any)

(* array *)

external any_of_array : any array -> any = "caml_js_from_array"
external array_of_any : any -> any array = "caml_js_to_array"

(* nullable *)

let null = raw "null"
let is_null any = phys_equal any null

let nullable_of_option opt =
  match opt with
  | None -> null
  | Some any -> any

let option_of_nullable any = if is_null any then None else Some any

(* undefined *)

let undefined = raw "undefined"
let is_undefined any = phys_equal any undefined
let is_defined any = not (is_undefined any)

let undefined_of_option opt =
  match opt with
  | None -> undefined
  | Some any -> any

let option_of_undefined any = if is_undefined any then None else Some any

(* unit *)

let any_of_unit () = undefined
let unit_of_any _ = ()

(* tuple *)
let any_of_t2 (a, b) = any_of_array [| a; b |]
let any_of_t3 (a, b, c) = any_of_array [| a; b; c |]
let any_of_t4 (a, b, c, d) = any_of_array [| a; b; c; d |]
let any_of_t5 (a, b, c, d, e) = any_of_array [| a; b; c; d; e |]

let t2_of_any any =
  let arr = array_of_any any in
  Array.(get arr 0, get arr 1)

let t3_of_any any =
  let arr = array_of_any any in
  Array.(get arr 0, get arr 1, get arr 2)

let t4_of_any any =
  let arr = array_of_any any in
  Array.(get arr 0, get arr 1, get arr 2, get arr 3)

let t5_of_any any =
  let arr = array_of_any any in
  Array.(get arr 0, get arr 1, get arr 2, get arr 3, get arr 5)

(* fun *)

external any_of_fun : int -> (_ -> _) -> any = "caml_js_wrap_callback_strict"
external fun_call : any -> any array -> any = "caml_js_fun_call"

(* obj *)

external get : any -> string -> any = "caml_js_get"
external set : any -> string -> any -> unit = "caml_js_set"
external del : any -> string -> unit = "caml_js_delete"
external obj : (string * any) array -> any = "caml_js_object"
external obj_new : any -> any array -> any = "caml_js_new"
external meth_call : any -> string -> any array -> any = "caml_js_meth_call"

let global_this = raw "globalThis"
let global prop = get global_this prop

(* equal *)

external equal : any -> any -> bool = "caml_js_equals"
external strict_equal : any -> any -> bool = "caml_js_strict_equals"

(* type *)

external typeof : any -> string = "caml_js_typeof"
external instanceof : any -> constr:any -> bool = "caml_js_instanceof"

(* debug *)

external debugger : unit -> unit = "debugger"

let console = raw "console"
let debug x = meth_call console "debug" [| any x |] |> ignore
