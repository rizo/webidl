let phys_equal = Stdlib.( == )

type +'cls t constraint 'cls = [> ]
type +'cls js = 'cls t

(* Equality *)

external equal : 'a js -> 'a js -> bool = "caml_js_equals"
external strict_equal : 'a js -> 'a js -> bool = "caml_js_strict_equals"

(* Any *)

type any = [ `Any ] js

(* external to_any : 'cls js -> any = "%identity"
   external of_any : any -> 'cls js = "%identity" *)

(* Unsafe *)

external raw : string -> 'a js = "caml_pure_js_expr"
external any : 'a -> any = "%identity"
external magic : 'a js -> 'b js = "%identity"

(* Class *)

type 'a class' = [ `Class of 'a ] js constraint 'a = [> ]

(* Function *)

type function' = [ `Function ] js

(* Object *)

type object' = [ `Object ] js

external get : 'obj js -> string -> 'a js = "caml_js_get"
external set : 'obj js -> string -> 'a js -> unit = "caml_js_set"
external del : 'obj js -> string -> unit = "caml_js_delete"
external obj : (string * any) array -> object' = "caml_js_object"
external obj_new : 'a class' -> any array -> 'a js = "caml_js_new"

external meth_call : 'obj js -> string -> any array -> 'a js
  = "caml_js_meth_call"

(* Function *)

external of_fun : int -> (_ -> _) -> [ `Function ] js
  = "caml_js_wrap_callback_strict"

external fun_call : [ `Function ] js -> any array -> any = "caml_js_fun_call"

(* Boolean *)

type boolean = [ `Boolean ] js

external of_bool : Stdlib.Bool.t -> boolean = "caml_js_from_bool"
external to_bool : boolean -> Stdlib.Bool.t = "caml_js_to_bool"

let true' = of_bool true
let false' = of_bool false

(* Number *)

type number = [ `Number ] t

external of_int : Stdlib.Int.t -> number = "%identity"
external to_int : number -> Stdlib.Int.t = "%identity"
external of_float : Stdlib.Float.t -> number = "caml_js_from_float"
external to_float : number -> Stdlib.Float.t = "caml_js_to_float"

(* String *)

type string = [ `String ] js

external of_string : Stdlib.String.t -> string = "caml_jsstring_of_string"
external to_string : string -> Stdlib.String.t = "caml_string_of_jsstring"

(* Array *)

external of_any_array : any Stdlib.Array.t -> any = "caml_js_from_array"
external to_any_array : any -> any Stdlib.Array.t = "caml_js_to_array"

(* nullable *)
type 'a nullable = [ `Nullable of 'a ] js constraint 'a = [> ]

external nullable : 'cls js -> 'cls nullable = "%identity"
external nullable_get : 'cls nullable -> 'cls js = "%identity"

let null = raw "null"
let is_null any = phys_equal any null

let nullable_of_option to_js opt =
  match opt with
  | None -> null
  | Some x -> nullable (to_js x)

let nullable_to_option of_js nullable =
  if is_null nullable then None else Some (of_js (nullable_get nullable))

(* undefined *)

type 'a undefined = [ `Undefined of 'a ] js constraint 'a = [> ]

external defined : 'cls js -> 'cls undefined = "%identity"
external undefined_get : 'cls undefined -> 'cls js = "%identity"

let undefined = raw "undefined"
let is_undefined any = phys_equal any undefined
let is_defined any = not (is_undefined any)

let undefined_of_option to_js opt =
  match opt with
  | None -> undefined
  | Some x -> defined (to_js x)

let undefined_to_option of_js undefined =
  if is_undefined undefined then None else Some (of_js (undefined_get undefined))

(* Any *)

module Ffi = struct
  external repr : 'a -> any = "%identity"

  let unsafe_cast _ this = Obj.magic this
  let magic this = Obj.magic this

  external js_of_int : Stdlib.Int.t -> [ `Int ] js = "%identity"
  external int_of_js : [ `Int ] js -> Stdlib.Int.t = "%identity"

  external js_of_string : Stdlib.String.t -> [> `String ] js
    = "caml_jsstring_of_string"

  external string_of_js : [ `String ] js -> Stdlib.String.t
    = "caml_string_of_jsstring"

  external js_of_bool : Stdlib.Bool.t -> [> `Bool ] js = "caml_js_from_bool"
  external bool_of_js : [ `Bool ] js -> Stdlib.Bool.t = "caml_js_to_bool"
  external js_of_float : Stdlib.Float.t -> [> `Float ] js = "caml_js_from_float"
  external float_of_js : [ `Float ] js -> Stdlib.Float.t = "caml_js_to_float"

  (* FIXME: this is wrong *)
  external js_of_array : ('a -> 'a_js js) -> 'a array -> [ `Array of 'a_js ] js
    = "caml_js_from_array"

  external array_of_js : ('a_js js -> 'a) -> [ `Array of 'a_js ] js -> 'a array
    = "caml_js_to_array"

  (* TODO: review *)
  external caml_js_of_array : any Stdlib.Array.t -> [ `Any ] js
    = "caml_js_from_array"

  external caml_js_to_array : [ `Any ] js -> any Stdlib.Array.t
    = "caml_js_to_array"
end

open Ffi

external to_any : _ js -> any = "%identity"
external of_any : any -> 'a js = "%identity"

module Any = struct
  type t = any

  let of_bool x = to_any (js_of_bool x)
  let of_int x = to_any (js_of_int x)
  let of_float x = to_any (js_of_float x)
  let of_string x = to_any (js_of_string x)

  let of_array any_of_x xs =
    to_any (Ffi.caml_js_of_array (Stdlib.Array.map any_of_x xs))

  let of_fun n x = to_any (of_fun n x)
  let nullable_of_option to_js o = to_any (nullable_of_option to_js o)
  let undefined_of_option to_js o = to_any (undefined_of_option to_js o)
  let to_bool x = bool_of_js (of_any x)
  let to_int x = int_of_js (of_any x)
  let to_float x = float_of_js (of_any x)
  let to_string x = string_of_js (of_any x)
  let to_array x_of_any xs = Stdlib.Array.map x_of_any (Ffi.caml_js_to_array xs)
  let nullable_to_option of_js any = nullable_to_option of_js (of_any any)
  let undefined_to_option of_js any = undefined_to_option of_js (of_any any)
end

(* Unit *)

let of_unit () = undefined
let to_unit _ = ()

(* Symbol *)

type symbol = [ `Symbol ] js

(* Array *)

module Array = struct
  type 'kind t = [ `Array of 'kind ] js constraint 'kind = [> ]
end

type 'a array = 'a Array.t

let of_array = js_of_array
let to_array = array_of_js

(* Dict *)

type 'cls dict = [ `Dict of 'cls ] js constraint 'kind = [> ]

(* Iterable *)

type iterable = [ `Iterable ] js

(* Promise *)

type 'a promise = [ `Promise of 'a ] js

(* Global *)

let global_this = raw "globalThis"
let global prop = get global_this prop
