type +'cls t constraint 'cls = [> ]
type +'cls js = 'cls t

(** {2 Any} *)

type any = [ `Any ] js

external to_any : 'cls js -> any = "%identity"
external of_any : any -> 'cls js = "%identity"

module Any : sig
  type t = any

  val of_bool : Stdlib.Bool.t -> t
  val to_bool : t -> Stdlib.Bool.t
  val of_int : Stdlib.Int.t -> t
  val to_int : t -> Stdlib.Int.t
  val of_float : Stdlib.Float.t -> t
  val to_float : t -> Stdlib.Float.t
  val of_string : Stdlib.String.t -> t
  val to_string : t -> Stdlib.String.t
  val of_array : ('a -> t) -> 'a Stdlib.Array.t -> t
  val to_array : (t -> 'a) -> t -> 'a Stdlib.Array.t
  val nullable_of_option : ('a -> t) -> 'a option -> t
  val nullable_to_option : (t -> 'a) -> t -> 'a option
  val undefined_of_option : ('a -> t) -> 'a option -> t
  val undefined_to_option : (t -> 'a) -> t -> 'a option
  val of_fun : Stdlib.Int.t -> (_ -> _) -> t
end

(** {2 Function} *)

type function' = [ `Function ] js

external of_fun : int -> (_ -> _) -> function' = "caml_js_wrap_callback_strict"
external fun_call : function' -> any array -> any = "caml_js_fun_call"

(** {2 Object} *)

type object' = [ `Object ] js

external get : 'cls js -> string -> any = "caml_js_get"
external set : 'cls js -> string -> any -> unit = "caml_js_set"
external del : 'cls js -> string -> unit = "caml_js_delete"
external obj : (string * any) array -> any = "caml_js_object"
external obj_new : any -> any array -> any = "caml_js_new"
external meth_call : 'cls js -> string -> any array -> any = "caml_js_meth_call"

(** {2 Boolean} *)

type boolean = [ `Boolean ] js

external of_bool : Stdlib.Bool.t -> boolean = "caml_js_from_bool"
external to_bool : boolean -> Stdlib.Bool.t = "caml_js_to_bool"
val true' : boolean
val false' : boolean

(* {2 Symbol} *)

type symbol = [ `Symbol ] js

(** {2 Number} *)

type number = [ `Number ] t

external of_int : Stdlib.Int.t -> number = "%identity"
external to_int : number -> Stdlib.Int.t = "%identity"
external of_float : Stdlib.Float.t -> number = "caml_js_from_float"
external to_float : number -> Stdlib.Float.t = "caml_js_to_float"

(** {2 String} *)

type string = [ `String ] js

external of_string : Stdlib.String.t -> string = "caml_jsstring_of_string"
external to_string : string -> Stdlib.String.t = "caml_string_of_jsstring"

(** {2 Nullable} *)

type 'cls nullable = [ `Nullable of 'cls ] js constraint 'cls = [> ]

external nullable : 'cls js -> 'cls nullable = "%identity"
val null : 'cls nullable
val is_null : 'cls nullable -> Stdlib.Bool.t
val nullable_of_option : ('a -> 'cls js) -> 'a option -> 'cls nullable
val nullable_to_option : ('cls js -> 'a) -> 'cls nullable -> 'a option

(** {2 Undefined} *)

type 'cls undefined = [ `Undefined of 'cls ] js constraint 'cls = [> ]

external defined : 'cls js -> 'cls nullable = "%identity"
val undefined : 'cls undefined
val is_undefined : 'cls nullable -> Stdlib.Bool.t
val undefined_of_option : ('a -> 'cls js) -> 'a option -> 'cls undefined
val undefined_to_option : ('cls js -> 'a) -> 'cls undefined -> 'a option

(** {2 Unit} *)

val of_unit : unit -> 'cls js
val to_unit : 'cls js -> unit

(** {2 Array} *)

type 'cls array = [ `Array of 'cls ] js constraint 'cls = [> ]

val of_array : ('a -> 'cls js) -> 'a Stdlib.Array.t -> 'cls array
val to_array : ('cls js -> 'a) -> 'cls array -> 'a Stdlib.Array.t

(** {2 Dict} *)

module Dict : sig
  type 'a t = [ `Dict of 'a ] js

  val of_any : (any -> 'a) -> any -> 'a t
  val to_any : ('a -> any) -> 'a t -> any
end

type 'cls dict = 'cls Dict.t

(** {2 Iterable} *)

type iterable = [ `Iterable ] js

(** {2 Promise} *)

module Promise : sig
  type 'a t = [ `Promise ] js

  val to_any : ('a -> any) -> 'a t -> any
  val of_any : (any -> 'a) -> any -> 'a t
end

type 'a promise = 'a Promise.t

(** {2 Constructor} *)

type 'cls constr = [ `Constr of 'cls ] js constraint 'cls = [> ]

(** {2 FFI} *)

module Ffi : sig
  type prop = Stdlib.String.t

  val unsafe_cast : 'cls -> 'a js -> 'cls js
  val constr : Stdlib.String.t -> [ `Constr of 'cls ] js
  val magic : 'this js -> 'that js
end

(** {2 Globals} *)

val global_this : object'
val global : Stdlib.String.t -> 'cls -> 'cls js

(** {2 Unsafe} *)

external any : 'a -> any = "%identity"
(** Unsafe direct runtime representation of any value. *)

external raw : Stdlib.String.t -> any = "caml_pure_js_expr"
(** Unsafe pure JavaScript expression. If the resulting value is not used, it
    will be discarded. *)
