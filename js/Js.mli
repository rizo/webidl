type +'kind t constraint 'kind = [> ]
type +'kind js = 'kind t

(** {2 Any} *)

module Any : sig
  type t = [ `Any ] js

  val of_bool : Stdlib.Bool.t -> t
  val of_int : Stdlib.Int.t -> t
  val of_float : Stdlib.Float.t -> t
  val of_string : Stdlib.String.t -> t
  val of_array : ('a -> t) -> 'a Stdlib.Array.t -> t
  val nullable_of_option : ('a -> t) -> 'a option -> t
  val undefined_of_option : ('a -> t) -> 'a option -> t
  val to_bool : t -> Stdlib.Bool.t
  val to_int : t -> Stdlib.Int.t
  val to_float : t -> Stdlib.Float.t
  val to_string : t -> Stdlib.String.t
  val to_array : (t -> 'a) -> t -> 'a Stdlib.Array.t
  val nullable_to_option : (t -> 'a) -> t -> 'a option
  val undefined_to_option : (t -> 'a) -> t -> 'a option
end

type any = Any.t

val to_any : 'kind js -> any
val of_any : any -> 'kind js

(** {2 Unit} *)

val of_unit : unit -> 'kind js
val to_unit : 'kind js -> unit

(** {2 Int} *)

module Int : sig
  type t = [ `Int ] js
end

type int = Int.t

val of_int : Stdlib.Int.t -> int
val to_int : int -> Stdlib.Int.t

(** {2 Float} *)

module Float : sig
  type t = [ `Float ] js
end

type float = Float.t

val of_float : Stdlib.Float.t -> [> `Float ] js
val to_float : float -> Stdlib.Float.t

(** {2 String} *)

module String : sig
  type t = [ `String ] js
end

type string = String.t

val of_string : Stdlib.String.t -> [> `String ] js
val to_string : string -> Stdlib.String.t

(** {2 Bool} *)

module Bool : sig
  type t = [ `Bool ] js
end

type bool = Bool.t

val of_bool : Stdlib.Bool.t -> [> `Bool ] js
val to_bool : bool -> Stdlib.Bool.t
val true' : bool
val false' : bool

(** {2 Array} *)

module Array : sig
  type 'kind t = [ `Array of 'kind ] js constraint 'kind = [> ]
end

type 'kind array = 'kind Array.t

val of_array : ('a -> 'kind js) -> 'a Stdlib.Array.t -> 'kind array
val to_array : ('kind js -> 'a) -> 'kind array -> 'a Stdlib.Array.t

(** {2 Iterable} *)

module Iterable : sig
  type 'kind t = [ `Iterable of 'kind ] js constraint 'kind = [> ]
end

type 'kind iterable = 'kind Iterable.t

(** {2 Nullable} *)

module Nullable : sig
  type 'kind t = [ `Nullable of 'kind ] js constraint 'kind = [> ]

  external make : 'kind js -> 'kind t = "%identity"
  val of_option : ('a -> 'kind js) -> 'a option -> 'kind t
  val to_any : 'kind t -> any
end

type 'kind nullable = 'kind Nullable.t

val null : 'kind nullable

(** {2 Undefined} *)

module Undefined : sig
  type 'kind t = [ `Undefined of 'kind ] js constraint 'kind = [> ]

  external make : 'kind js -> 'kind t = "%identity"
  val of_option : ('a -> 'kind js) -> 'a option -> 'kind t
  val to_any : 'kind t -> any
end

type 'kind undefined = 'kind Undefined.t

val undefined : 'kind undefined

(** {2 Object} *)

module Obj : sig
  type t = [ `Obj ] js

  val empty : unit -> t
end

type obj = Obj.t

(** {2 Constructor} *)

type 'kind constr = [ `Constr of 'kind ] js

(** {2 FFI} *)

module Ffi : sig
  type prop = Stdlib.String.t

  (* val unsafe_cast : 'a js -> 'b js *)
  val constr : Stdlib.String.t -> [ `Constr of 'kind ] js
  val magic : 'this js -> 'that js
  external get : 'obj js -> prop -> 'value js = "caml_js_get"
  external set : 'obj js -> prop -> 'value js -> unit = "caml_js_set"
  external del : 'obj js -> prop -> unit = "caml_js_delete"
  external obj : (prop * any) Stdlib.Array.t -> 'obj js = "caml_js_object"

  external obj_new : [ `Constr of 'kind ] js -> any Stdlib.Array.t -> 'obj js
    = "caml_js_new"

  external meth_call : 'obj js -> prop -> any Stdlib.Array.t -> 'return js
    = "caml_js_meth_call"

  external fun_call : [ `Function ] js -> any Stdlib.Array.t -> 'return js
    = "caml_js_fun_call"

  external js_of_fun : Stdlib.Int.t -> (_ -> _) -> [ `Function ] js
    = "caml_js_wrap_callback_strict"
end
