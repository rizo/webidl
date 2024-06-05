(** A thin bridge between the JS and ML worlds. *)

type any
(** An opaque JavaScript value. *)

(** {2 bool} *)

external any_of_bool : bool -> any = "caml_js_from_bool"
external bool_of_any : any -> bool = "caml_js_to_bool"

(** {2 int} *)

external any_of_int : int -> any = "%identity"
external int_of_any : any -> int = "%identity"

(** {2 float} *)

external any_of_float : float -> any = "caml_js_from_float"
external float_of_any : any -> float = "caml_js_to_float"

(** {2 string} *)

external any_of_string : string -> any = "caml_jsstring_of_string"
external string_of_any : any -> string = "caml_string_of_jsstring"

(* {3 char} *)

val any_of_char : char -> any
val char_of_any : any -> char

(** {2 array} *)

external any_of_array : any array -> any = "caml_js_from_array"
external array_of_any : any -> any array = "caml_js_to_array"

(** {2 nullable} *)

val null : any
val is_null : any -> bool
val nullable_of_option : any option -> any
val option_of_nullable : any -> any option

(** {2 undefined} *)

val undefined : any
val is_undefined : any -> bool
val is_defined : any -> bool
val undefined_of_option : any option -> any
val option_of_undefined : any -> any option

(** {2 unit} *)

val any_of_unit : unit -> any
val unit_of_any : any -> unit

(** {2 tuple} *)

val any_of_t2 : any * any -> any
val t2_of_any : any -> any * any
val any_of_t3 : any * any * any -> any
val t3_of_any : any -> any * any * any
val any_of_t4 : any * any * any * any -> any
val t4_of_any : any -> any * any * any * any
val any_of_t5 : any * any * any * any * any -> any
val t5_of_any : any -> any * any * any * any * any

(** {2 fun} *)

external fun_call : any -> any array -> any = "caml_js_fun_call"
(** [fun_call f args] is [f(...args)]. [f] is assumed to represent a JavaScript
    function. *)

external any_of_fun : int -> (any -> _) -> any = "caml_js_wrap_callback_strict"
(** [any_of_fun arity f] is the JavaScript representation of the OCaml function
    [f] with the given [arity]. *)

external meth_call : any -> string -> any array -> any = "caml_js_meth_call"
(** [meth_call obj prop args] is [obj.prop(...args)]. *)

(** {2 obj} *)

external get : any -> string -> any = "caml_js_get"
(** [get obj prop] is [obj[prop]]. *)

external set : any -> string -> any -> unit = "caml_js_set"
(** [set obj prop v] is [obj[prop] = v]. *)

external del : any -> string -> unit = "caml_js_delete"
(** [del obj prop] is [delete obj[prop]]. *)

external obj : (string * any) array -> any = "caml_js_object"
(** [obj [(prop1, v1); ...]] is [{prop1: v1, ... }]. *)

external obj_new : any -> any array -> any = "caml_js_new"
(** [obj_new obj args] is [new obj(...args)]. *)

val global_this : any
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis}
      globalThis}. *)

val global : string -> any
(** [global prop] is [get global_this prop], that is, [globalThis[prop]]. *)

(** {2 equal} *)

external equal : any -> any -> bool = "caml_js_equals"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Equality}
      Equality (==)}. *)

external strict_equal : any -> any -> bool = "caml_js_strict_equals"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality}
      Strict equality (===)}. *)

(** {2 type} *)

external typeof : any -> string = "caml_js_typeof"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof}
      typeof}. *)

external instanceof : any -> constr:any -> bool = "caml_js_instanceof"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/instanceof}
      instanceof}. *)

(** {2 debug} *)

val debug : 'a -> unit
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/API/console/debug_static}
      console.debug}.*)

external debugger : unit -> unit = "debugger"
(** See
    {{:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/debugger}
      debugger}. *)

(** {2 unsafe} *)

external any : 'a -> any = "%identity"
(** Unsafe direct runtime representation of any value. *)

external raw : string -> any = "caml_pure_js_expr"
(** Unsafe pure JavaScript expression. If the resulting value is not used, it
    will be discarded. *)
