(** {1 Object} *)

type +'a obj constraint 'a = [> ]
type any = [ `Any ] obj

(** {1 Object operations} *)

type prop = Stdlib.String.t

external get : 'a obj -> prop -> 'v obj = "caml_js_get"
external set : 'a obj -> prop -> 'v obj -> unit = "caml_js_set"
external del : 'a obj -> prop -> unit = "caml_js_delete"
external obj : (prop * any) Stdlib.Array.t -> 'a obj = "caml_js_object"

external new_obj : [ `Function ] obj -> any Stdlib.Array.t -> 'a obj
  = "caml_js_new"

external magic : _ obj -> 'a obj = "%identity"

external call : [ `Function ] obj -> any Stdlib.Array.t -> 'r obj
  = "caml_js_fun_call"

external meth : 'a obj -> prop -> any Stdlib.Array.t -> 'r obj
  = "caml_js_meth_call"

external typeof : 'a obj -> Stdlib.String.t = "caml_js_typeof"

external instanceof : 'a obj -> constr:'constr obj -> bool
  = "caml_js_instanceof"

external equal : 'a obj -> 'a obj -> bool = "caml_js_equals"
external strict_equal : 'a obj -> 'a obj -> bool = "caml_js_strict_equals"

(** {1 Raw JavaScript} *)

external expr : Stdlib.String.t -> 'a obj = "caml_pure_js_expr"
external exec : Stdlib.String.t -> unit = "caml_js_expr"

(** {1 Encode OCaml values} *)

external any : 'a -> any = "%identity"
external bool : bool -> [> `Boolean ] obj = "caml_js_from_bool"
external float : float -> [> `Number ] obj = "caml_js_from_float"
external int : int -> [> `Number ] obj = "%identity"
external int32 : int32 -> [> `Number ] obj = "caml_js_from_int32"
external nativeint : nativeint -> [> `Number ] obj = "caml_js_from_nativeint"
external char : char -> [> `Number ] obj = "%identity"
external string : string -> [> `String ] obj = "caml_jsstring_of_string"
external ascii : string -> [> `String ] obj = "%identity"
external array : 'a array -> [ `Array of 'a ] obj = "caml_js_from_array"

external func : int -> (_ -> _) -> [> `Function ] obj
  = "caml_js_wrap_callback_strict"

(** {1 Decode OCaml values} *)

external to_bool : [ `Boolean ] obj -> bool = "caml_js_to_bool"
external to_float : [ `Number ] obj -> float = "caml_js_to_float"
external to_int : [ `Number ] obj -> int = "%identity"
external to_int32 : [ `Number ] obj -> int32 = "caml_js_to_int32"
external to_nativeint : [ `Number ] obj -> nativeint = "caml_js_to_nativeint"
external to_char : [ `Number ] obj -> char = "%identity"
external to_string : [ `String ] obj -> string = "caml_string_of_jsstring"
external to_ascii : [ `String ] obj -> string = "%identity"
external to_array : [ `Array of 'a ] obj -> 'a array = "caml_js_to_array"

(* Nullable *)

module Nullable = struct
  type +'a t = [ `Nullable of 'a ] obj

  let null = expr "null"

  external make : 'a -> 'a t = "%identity"

  let is_null this = Stdlib.( == ) this null

  external unsafe_get : 'a t -> 'a = "%identity"

  let of_option opt =
    match opt with
    | None -> null
    | Some this -> make this

  let to_option this = if is_null this then None else Some (unsafe_get this)

  let get this =
    if is_null this then failwith "Nullable.get" else unsafe_get this

  let map f this = if is_null this then null else make (f (unsafe_get this))

  let map_or default f this =
    if is_null this then default else f (unsafe_get this)

  let map_or_else get_default f this =
    if is_null this then get_default () else f (unsafe_get this)
end

type +'a nullable = 'a Nullable.t

external nullable : 'a -> 'a Nullable.t = "%identity"

let null = Nullable.null
let is_null = Nullable.is_null

(*  Undefined *)

module Undefined = struct
  type +'a t = [ `Undefined of 'a ] obj

  let undefined = expr "undefined"

  external defined : 'a -> 'a t = "%identity"

  let is_undefined this = Stdlib.( == ) this undefined
  let is_defined this = not (is_undefined this)

  external unsafe_get : 'a t -> 'a = "%identity"

  let of_any x_of_any any =
    if is_undefined any then undefined else defined (x_of_any any)

  let to_any any_of_x this =
    if is_undefined this then any this else any_of_x (unsafe_get this)

  let of_option opt =
    match opt with
    | None -> undefined
    | Some this -> defined this

  let to_option this = if is_undefined this then None else Some (unsafe_get this)

  let get this =
    if is_undefined this then failwith "Undefined.get" else unsafe_get this

  let map f this =
    if is_undefined this then undefined else defined (f (unsafe_get this))

  let map_or default f this =
    if is_undefined this then default else f (unsafe_get this)

  let map_or_else get_default f this =
    if is_undefined this then get_default () else f (unsafe_get this)
end

type +'a undefined = 'a Undefined.t

let undefined = Undefined.undefined

external defined : 'a -> 'a Undefined.t = "%identity"

let is_undefined = Undefined.is_undefined
let is_defined = Undefined.is_defined

(** {1 Unicode} *)

module Unicode = struct
  external utf16 : Stdlib.String.t -> Stdlib.String.t
    = "caml_jsstring_of_string"

  external utf8 : Stdlib.String.t -> Stdlib.String.t = "caml_string_of_jsstring"
end

(** {1 Debug} *)

let debug x = ignore (meth (expr "console") "debug" [| any x |])
let log x = ignore (meth (expr "console") "log" [| any x |])

external debugger : unit -> unit = "debugger"

(** {1 Types} *)

type string = [ `String ] obj
type boolean = [ `Boolean ] obj
type number = [ `Number ] obj
type bigint = [ `Bigint ] obj
type symbol = [ `Symbol ] obj
type 'a nullable = [ `Nullable of 'a ] obj
type 'a undefined = [ `Undefined of 'a ] obj
type 'a array = [ `Array of 'a ] obj
type 'a dict = [ `Dict of 'a ] obj
type 'a promise = [ `Promise of 'a ] obj
