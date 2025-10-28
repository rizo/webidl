(** {1 Object} *)

type +'a obj constraint 'a = [> ]
type any = [ `Any ] obj
type prop = Stdlib.String.t

external get : 'a obj -> prop -> 'v obj = "caml_js_get"
external set : 'a obj -> prop -> 'v obj -> unit = "caml_js_set"
external del : 'a obj -> prop -> unit = "caml_js_delete"
external obj : (prop * any) Stdlib.Array.t -> 'a obj = "caml_js_object"

external new_obj : [ `Function ] obj -> any Stdlib.Array.t -> 'a obj
  = "caml_js_new"

external call : [ `Function ] obj -> any Stdlib.Array.t -> 'r obj
  = "caml_js_fun_call"

external meth : 'a obj -> prop -> any Stdlib.Array.t -> 'r obj
  = "caml_js_meth_call"

external typeof : 'a obj -> Stdlib.String.t = "caml_js_typeof"

external instanceof : 'a obj -> constr:'constr obj -> bool
  = "caml_js_instanceof"

external equal : 'a obj -> 'a obj -> bool = "caml_js_equals"
external strict_equal : 'a obj -> 'a obj -> bool = "caml_js_strict_equals"

(** {1 Nullable} *)

type +'a nullable = [ `Nullable of 'a ] obj

val null : 'a nullable
external nullable : 'a -> 'a nullable = "%identity"
val is_null : 'a nullable -> bool

module Nullable : sig
  type +'a t = 'a nullable

  val of_option : 'a option -> 'a t
  val to_option : 'a t -> 'a option
  val is_null : 'a nullable -> bool
  val get : 'a t -> 'a
  external unsafe_get : 'a t -> 'a = "%identity"
  val map : ('a -> 'b) -> 'a t -> 'b t
  val map_or : 'b -> ('a -> 'b) -> 'a t -> 'b
  val map_or_else : (unit -> 'b) -> ('a -> 'b) -> 'a t -> 'b
end

(** {1 Optional} *)

type +'a optional = [ `Optional of 'a ] obj

val undefined : 'a optional
external optional : 'a -> 'a optional = "%identity"
val is_undefined : 'a optional -> bool

module Optional : sig
  type +'a t = 'a optional

  val of_option : 'a option -> 'a t
  val to_option : 'a t -> 'a option
  val is_undefined : 'a t -> bool
  val get : 'a t -> 'a
  external unsafe_get : 'a t -> 'a = "%identity"
  val map : ('a -> 'b) -> 'a t -> 'b t
  val map_or : 'b -> ('a -> 'b) -> 'a t -> 'b
  val map_or_else : (unit -> 'b) -> ('a -> 'b) -> 'a t -> 'b
end

(** {1 Conversion} *)

(* TODO: Document safe casts. *)

type 'a constr = [ `Constr of 'a ] obj

external magic : _ obj -> 'a = "%identity"
external cast : _ obj -> 'a constr -> 'a obj = "%identity"
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

module Ml : sig
  external any : any -> 'a obj = "%identity"
  external bool : [ `Boolean ] obj -> bool = "caml_js_to_bool"
  external float : [ `Number ] obj -> float = "caml_js_to_float"
  external int : [ `Number ] obj -> int = "%identity"
  external int32 : [ `Number ] obj -> int32 = "caml_js_to_int32"
  external nativeint : [ `Number ] obj -> nativeint = "caml_js_to_nativeint"
  external char : [ `Number ] obj -> char = "%identity"
  external string : [ `String ] obj -> string = "caml_string_of_jsstring"
  external ascii : [ `String ] obj -> string = "caml_string_of_jsstring"
  external array : [ `Array of 'a ] obj -> 'a array = "caml_js_to_array"
  val unit : [ `Optional of unit ] obj -> unit
  val nullable : [ `Nullable of 'a ] obj -> 'a option
  val optional : [ `Optional of 'a ] obj -> 'a option
end

(** {1 Unicode} *)

module Unicode : sig
  external utf16 : Stdlib.String.t -> Stdlib.String.t
    = "caml_jsstring_of_string"

  external utf8 : Stdlib.String.t -> Stdlib.String.t = "caml_string_of_jsstring"
end

(** {1 Raw JavaScript} *)

external expr : Stdlib.String.t -> 'a obj = "caml_pure_js_expr"
external exec : Stdlib.String.t -> unit = "caml_js_expr"

(** {1 Debug} *)

val debug : 'a -> unit
val log : 'a -> unit
external debugger : unit -> unit = "debugger"

(** {1 Types} *)

type bigint = [ `Bigint ] obj
type symbol = [ `Symbol ] obj
type 'a array = [ `Array of 'a ] obj
type 'a dict = [ `Dict of 'a ] obj
type 'a promise = [ `Promise of 'a ] obj

(* {1 String} **)

type string = [ `String ] obj

module String : sig
  type t = [ `String ] obj

  val to_string : t -> Stdlib.String.t
end

(* {1 Boolean} **)

type boolean = [ `Boolean ] obj

module Boolean : sig
  type t = [ `Boolean ] obj

  val to_bool : t -> Stdlib.Bool.t
end

(* {1 Boolean} **)

type number = [ `Number ] obj

module Number : sig
  type t = [ `Number ] obj

  val to_float : t -> Stdlib.Float.t
end
