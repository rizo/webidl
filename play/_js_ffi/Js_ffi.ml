module Ffi = struct
  type +'a js
  type any = [ `Any ] js
  type prop = Stdlib.String.t

  external any : _ js -> any = "%identity"
  external bool_of_js : [ `Bool ] js -> Stdlib.Bool.t = "caml_js_to_bool"
  external js_of_bool : Stdlib.Bool.t -> [ `Bool ] js = "caml_js_from_bool"

  external js_of_float : Stdlib.Float.t -> [> `Number ] js
    = "caml_js_from_float"

  external float_of_js : [> `Number ] js -> Stdlib.Float.t = "caml_js_to_float"
  external js_of_int : Stdlib.Int.t -> [> `Number ] js = "%identity"
  external int_of_js : [> `Number ] js -> Stdlib.Int.t = "%identity"
  external js_of_string : Stdlib.String.t -> [> `String ] js = "%identity"
  external string_of_js : [> `String ] js -> Stdlib.String.t = "%identity"
  external get : 'obj js -> prop -> 'value js = "caml_js_get"
  external set : 'obj js -> prop -> 'value js -> unit = "caml_js_set"
  external del : 'obj js -> prop -> unit = "caml_js_delete"
  external obj : (string * any) array -> 'obj js = "caml_js_object"
  external obj_new : 'cls js -> any Stdlib.Array.t -> 'obj js = "caml_js_new"

  external meth_call : 'obj js -> prop -> any Stdlib.Array.t -> 'return js
    = "caml_js_meth_call"

  external fun_call : [ `Function ] js -> any Stdlib.Array.t -> 'return js
    = "caml_js_fun_call"

  external js_of_fun : int -> (_ -> _) -> [ `Function ] js
    = "caml_js_wrap_callback_strict"
end

module Array = struct
  type 'kind t = [ `Array of 'kind ] Ffi.js
end

module Console = struct
  external log : 'a -> unit = "stdweb_console_log"
end
