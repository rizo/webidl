(* Object *)

type +'a obj constraint 'a = [> ]
type any = [ `Any ] obj

external any : 'c obj -> any = "%identity"
external magic : 'a obj -> 'b obj = "%identity"
external get : 'c obj -> Stdlib.String.t -> 'v obj = "caml_js_get"
external set : 'c obj -> Stdlib.String.t -> 'v obj -> unit = "caml_js_set"
external del : 'c obj -> Stdlib.String.t -> unit = "caml_js_delete"

external obj : (Stdlib.String.t * any) Stdlib.Array.t -> 'a obj
  = "caml_js_object"

external obj_new : 'c obj -> any Stdlib.Array.t -> 'a obj = "caml_js_new"
external equal : 'c obj -> 'c obj -> bool = "caml_js_equals"
external strict_equal : 'c obj -> 'c obj -> bool = "caml_js_strict_equals"
external typeof : 'c obj -> Stdlib.String.t = "caml_js_typeof"

external instanceof : 'c obj -> constr:'constr obj -> bool
  = "caml_js_instanceof"

external expr : Stdlib.String.t -> 'c obj = "caml_pure_js_expr"
external exec : Stdlib.String.t -> unit = "caml_js_expr"

external meth : 'a obj -> Stdlib.String.t -> any Stdlib.Array.t -> 'ret obj
  = "caml_js_meth_call"

external string : Stdlib.String.t -> [ `String ] obj = "caml_jsstring_of_string"
external to_string : [ `String ] obj -> string = "caml_string_of_jsstring"
external ascii : Stdlib.String.t -> [ `String ] obj = "%identity"

module Unicode = struct
  external utf16 : Stdlib.String.t -> Stdlib.String.t
    = "caml_jsstring_of_string"

  external utf8 : Stdlib.String.t -> Stdlib.String.t = "caml_string_of_jsstring"
end

(** Debug *)

let debug x = ignore (meth (expr "console") "debug" [| (Obj.magic x : any) |])
let log x = ignore (meth (expr "console") "log" [| (Obj.magic x : any) |])

external debugger : unit -> unit = "debugger"

(* Types *)

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
