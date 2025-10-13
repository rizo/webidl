(** External JavaScript interface for OCaml.

    This module provides bindings for standard JavaScript objects and external
    primitives that allow type-safe compile-time and runtime interoperability
    between JavaScript and OCaml.

    Start by exploring the standard JavaScript {!section:types} or learning
    about the {!section:bindings} API. *)

(** {1 Types}

    All standard JavaScript types are directly representable in OCaml without
    wrapping or any runtime conversions. This is achieved by providing
    semi-abstract types for global JavaScript objects types like
    {!section:number} and {!section:array}.

    When interacting with JavaScript APIs you can either use the specialized
    {!section:object} types for zero-cost access to values of that type, or you
    can write {!section:bindings} that convert OCaml values to JavaScript and
    vice-versa. *)

(** {2:object Object} *)

type +'a obj constraint 'a = [> ]
(** Typed JavaScript objects.

    The type parameter ['a] is used to differentiate between objects of
    different classes using polymorphic variants.

    For example, the JavaScript
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date}
     Date} class can be represented as: [[ `Date ] Js.obj]. *)

type any = [ `Any ] obj
(** JavaScript objects of an unknown type.

    The [any] type is used to represent arbitrary, opaque JavaScript values
    whose static type information is unknown. This type useful for interfacing
    with low-level JavaScript APIs.

    The {!type:any} values can be converted to and from OCaml values using the
    {!module:Encode} and {!module:Decode} modules. See {!section:bindings} for
    more details. *)

external get : 'a obj -> string -> 'v obj = "caml_js_get"
external set : 'a obj -> string -> 'v obj -> unit = "caml_js_set"
external del : 'a obj -> string -> unit = "caml_js_delete"

external obj : (string * any) Stdlib.Array.t -> 'a obj = "caml_js_object"
(** [obj [| (prop1, v1); ... |]] is [{prop1: v1, ... }]. *)

external obj_new : 'a obj -> any Stdlib.Array.t -> 'a obj = "caml_js_new"
(** [obj_new obj []] is [new obj(...args)]. *)

external typeof : 'a obj -> Stdlib.String.t = "caml_js_typeof"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof}
     typeof}. *)

external instanceof : 'a obj -> constr:'constr obj -> bool
  = "caml_js_instanceof"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/instanceof}
     instanceof}. *)

external equal : 'a obj -> 'a obj -> bool = "caml_js_equals"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Equality}
     Equality (==)}. *)

external strict_equal : 'a obj -> 'a obj -> bool = "caml_js_strict_equals"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality}
     Strict equality (===)}. *)

(** Conversion *)

external any : 'c obj -> any = "%identity"
external magic : 'a obj -> 'b obj = "%identity"

(** {2:string String} *)

external string : Stdlib.String.t -> [ `String ] obj = "caml_jsstring_of_string"
external ascii : Stdlib.String.t -> [ `String ] obj = "%identity"
external to_string : [ `String ] obj -> string = "caml_string_of_jsstring"

module Unicode : sig
  external utf16 : Stdlib.String.t -> Stdlib.String.t
    = "caml_jsstring_of_string"

  external utf8 : Stdlib.String.t -> Stdlib.String.t = "caml_string_of_jsstring"
end

(** {2:raw Raw JavaScript}

    The {!expr} and {!exec} primitives embed untyped JavaScript code into the
    compiled output.

    The textual representation of the code must be valid JavaScript, otherwise
    the compilation will fail.

    The provided JavaScript code must be represented as a static string literal.
    If the provided code string is computed dynamically, the evaluation will
    fallback to runtime and an error will be thrown (check the console for
    evaluation errors).

    {b Warning:} {!expr} and {!exec} are unsafe since no type-checking is
    performed on the embedded code. *)

external expr : Stdlib.String.t -> 'a obj = "caml_pure_js_expr"

external exec : Stdlib.String.t -> unit = "caml_js_expr"
(** Unsafe JavaScript statement.

    {[
      let () = Jx.exec "console.log('hello')"
    ]} *)

(** {1 Debug} *)

val debug : 'a -> unit
(** Print the runtime representation of a value using
    {{:https://developer.mozilla.org/en-US/docs/Web/API/console/debug_static}
     console.debug}.*)

val log : 'a -> unit
(** Print the runtime representation of a value using
    {{:https://developer.mozilla.org/en-US/docs/Web/API/console/log_static}
     console.log}.*)

external debugger : unit -> unit = "debugger"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/debugger}
     debugger}. *)

(** {2:types Types} *)

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
