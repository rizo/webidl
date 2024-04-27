type +'a t
type 'a js = 'a t
type any = [ `Any ] js

module Ffi = struct
  type prop = Stdlib.String.t

  external pure_js_expr : string -> 'a t = "caml_pure_js_expr"

  let js_null = pure_js_expr "null"
  let js_undefined = pure_js_expr "undefined"

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

  external get : 'obj js -> prop -> 'value js = "caml_js_get"
  external set : 'obj js -> prop -> 'value js -> unit = "caml_js_set"
  external del : 'obj js -> prop -> unit = "caml_js_delete"
  external obj : (prop * any) Stdlib.Array.t -> 'obj js = "caml_js_object"
  external obj_new : 'cls js -> any Stdlib.Array.t -> 'obj js = "caml_js_new"

  external meth_call : 'obj js -> prop -> any Stdlib.Array.t -> 'return js
    = "caml_js_meth_call"

  external fun_call : [ `Function ] js -> any Stdlib.Array.t -> 'return js
    = "caml_js_fun_call"

  external js_of_fun : Stdlib.Int.t -> (_ -> _) -> [ `Function ] js
    = "caml_js_wrap_callback_strict"
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
  let to_bool x = bool_of_js (of_any x)
  let to_int x = int_of_js (of_any x)
  let to_float x = float_of_js (of_any x)
  let to_string x = string_of_js (of_any x)
end

(* Unit *)

let of_unit () = js_undefined
let to_unit _ = ()

(* Int *)

module Int = struct
  type t = [ `Int ] js
end

let of_int = js_of_int
let to_int = int_of_js

type int = Int.t

(* Float *)

module Float = struct
  type t = [ `Float ] js
end

let of_float = js_of_float
let to_float = float_of_js

type float = Float.t

(* String *)

module String = struct
  type t = [ `String ] js
end

let of_string = js_of_string
let to_string = string_of_js

type string = String.t

(* Bool *)

module Bool = struct
  type t = [ `Bool ] js
end

type bool = Bool.t

let of_bool = js_of_bool
let to_bool = bool_of_js
let true' = of_bool true
let false' = of_bool false

(* Array *)

module Array = struct
  type 'a t = [ `Array of 'a ] js
end

type 'a array = 'a Array.t

let of_array = js_of_array
let to_array = array_of_js

(* Iterable *)

module Iterable = struct
  type 'a t = [ `Iterable of 'a ] js
end

type 'a iterable = 'a Iterable.t

(* Nullable *)

module Nullable = struct
  type 'a t = [ `Nullable of 'a ] js
end

type 'a nullable = 'a Nullable.t

let null = Ffi.js_null

(* Undefined *)

module Undefined = struct
  type 'a t = [ `Undefined of 'a ] js
end

type 'a undefined = 'a Undefined.t

let undefined = Ffi.js_undefined

(* Object *)

module Obj = struct
  type t = [ `Obj ] js
end

type obj = Obj.t
