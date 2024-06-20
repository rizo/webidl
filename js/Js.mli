type +'cls t constraint 'cls = [> ]
type +'cls js = 'cls t

(** {2 Equality} *)

external equal : 'a js -> 'a js -> bool = "caml_js_equals"
external strict_equal : 'a js -> 'a js -> bool = "caml_js_strict_equals"

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

(** {2 Class} *)

type 'a class' = [ `Class of 'a ] js constraint 'a = [> ]

(** {2 Function} *)

type function' = [ `Function ] js
type fun' = function'

external of_fun : int -> (_ -> _) -> function' = "caml_js_wrap_callback_strict"
external fun_call : function' -> any array -> any = "caml_js_fun_call"

(** {2 Object} *)

type object' = [ `Object ] js
type obj = object'

external get : 'obj js -> string -> 'a js = "caml_js_get"
external set : 'obj js -> string -> 'a js -> unit = "caml_js_set"
external del : 'obj js -> string -> unit = "caml_js_delete"
external obj : (string * any) array -> object' = "caml_js_object"
external obj_new : 'a class' -> any array -> 'a js = "caml_js_new"

external meth_call : 'obj js -> string -> any array -> 'a js
  = "caml_js_meth_call"

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

type 'a nullable = [ `Nullable of 'a ] js constraint 'a = [> ]

external nullable : 'cls js -> 'cls nullable = "%identity"
val null : 'cls nullable
val is_null : 'cls nullable -> Stdlib.Bool.t
val nullable_of_option : ('a -> 'cls js) -> 'a option -> 'cls nullable
val nullable_to_option : ('cls js -> 'a) -> 'cls nullable -> 'a option

(** {2 Undefined} *)

type 'cls undefined = [ `Undefined of 'cls ] js constraint 'cls = [> ]

external defined : 'cls js -> 'cls undefined = "%identity"
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

type 'a dict = [ `Dict of 'a ] js

(** {2 Iterable} *)

type iterable = [ `Iterable ] js

(** {2 Promise} *)

type 'a promise = [ `Promise of 'a ] js

(* module Encode : sig
     val bool : Stdlib.Bool.t -> bool
     val nullable : ('a -> 'a js) -> 'a option -> 'a nullable
   end *)

(** {2 Global} *)

val global_this : object'
(** The [globalThis] value. *)

val global : Stdlib.String.t -> 'a js
(* Lookup a global value. *)

(** {2 Unsafe} *)

external any : 'a -> any = "%identity"
(** Unsafe direct runtime representation of any value. *)

external magic : 'a js -> 'b js = "%identity"
(* Unsafe conversion of javascript values. *)

external raw : Stdlib.String.t -> 'a js = "caml_pure_js_expr"
(** Unsafe pure JavaScript expression. If the resulting value is not used, it
    will be discarded. *)

(** {2 Encode} *)

type 'a encoder = 'a -> any
(** The type for encoders of JavaScript values. *)

module Encode : sig
  val any : 'a encoder
  val bool : Stdlib.Bool.t encoder
  val int : Stdlib.Int.t encoder
  val float : Stdlib.Float.t encoder
  val string : Stdlib.String.t encoder
  val nullable : 'a encoder -> 'a option encoder
  val undefined : 'a encoder -> 'a option encoder
  val array : 'a encoder -> 'a Stdlib.Array.t encoder
  val unit : unit encoder
  val dict : 'a encoder -> (Stdlib.String.t * 'a) Stdlib.Array.t encoder
  val obj : (Stdlib.String.t * any) Stdlib.Array.t encoder
  val fun0 : (unit -> 'r) encoder
  val fun1 : ('a -> 'r) encoder
  val fun2 : ('a -> 'b -> 'r) encoder
  val fun3 : ('a -> 'b -> 'c -> 'r) encoder
  val fun4 : ('a -> 'b -> 'c -> 'd -> 'r) encoder
  val fun5 : ('a -> 'b -> 'c -> 'd -> 'e -> 'r) encoder
  val fun6 : ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'r) encoder
  val fun7 : ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'g -> 'r) encoder
  val fun8 : ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'g -> 'h -> 'r) encoder
  val fun9 : ('a -> 'b -> 'c -> 'd -> 'e -> 'f -> 'g -> 'h -> 'i -> 'r) encoder
end

(** {2 Decode} *)

type 'a decoder = any -> 'a

module Decode : sig
  (** {[
        let module D = Js.Decode in
        let state = Js.global "state" in
        let is_mounted = D.field "is_mounted" D.bool state in
        Js.debug state
      ]} *)

  val any : 'a decoder
  val bool : Stdlib.Bool.t decoder
  val int : Stdlib.Int.t decoder
  val float : Stdlib.Float.t decoder
  val string : Stdlib.String.t decoder
  val nullable : 'a decoder -> 'a option decoder
  val undefined : 'a decoder -> 'a option decoder
  val array : 'a decoder -> 'a Stdlib.Array.t decoder
  val unit : unit decoder
  val obj : (string * any) list decoder
  val dict : 'a decoder -> (string * 'a) list decoder
  val field : Stdlib.String.t -> 'a decoder -> 'a decoder
  val fun0 : return:'r decoder -> (unit -> 'r) decoder
  val fun1 : return:'r decoder -> 'a encoder -> ('a -> 'r) decoder

  val fun2 :
    return:'r decoder -> 'a encoder -> 'b encoder -> ('a * 'b -> 'r) decoder

  val fun3 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    ('a * 'b * 'c -> 'r) decoder

  val fun4 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    'd encoder ->
    ('a * 'b * 'c * 'd -> 'r) decoder

  val fun5 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    'd encoder ->
    'e encoder ->
    ('a * 'b * 'c * 'd * 'e -> 'r) decoder

  val fun6 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    'd encoder ->
    'e encoder ->
    'f encoder ->
    ('a * 'b * 'c * 'd * 'e * 'f -> 'r) decoder

  val fun7 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    'd encoder ->
    'e encoder ->
    'f encoder ->
    'g encoder ->
    ('a * 'b * 'c * 'd * 'e * 'f * 'g -> 'r) decoder

  val fun8 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    'd encoder ->
    'e encoder ->
    'f encoder ->
    'g encoder ->
    'h encoder ->
    ('a * 'b * 'c * 'd * 'e * 'f * 'g * 'h -> 'r) decoder

  val fun9 :
    return:'r decoder ->
    'a encoder ->
    'b encoder ->
    'c encoder ->
    'd encoder ->
    'e encoder ->
    'f encoder ->
    'g encoder ->
    'h encoder ->
    'i encoder ->
    ('a * 'b * 'c * 'd * 'e * 'f * 'g * 'h * 'i -> 'r) decoder
end

(* --- *)

(* {2 FFI} *)

(* module Ffi : sig *)
(* type prop = Stdlib.String.t *)

(* val unsafe_cast : 'cls -> 'a js -> 'cls js *)
(* val constr : Stdlib.String.t -> [ `Constr of 'cls ] js *)
(* val magic : 'this js -> 'that js *)
(* end *)
