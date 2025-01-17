open struct
  module E_jx = Jx.Encode
  module D_jx = Jx.Decode
end

module rec Window : sig
  type t = [ `Window ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Window} [Window]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val decode_uri : encoded_uri:string -> unit -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Window/decodeURI} \
     [decodeURI] on MDN}."]

  val decode_uri_component : encoded_uri_component:string -> unit -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Window/decodeURIComponent} \
     [decodeURIComponent] on MDN}."]

  val encode_uri : uri:string -> unit -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Window/encodeURI} \
     [encodeURI] on MDN}."]

  val encode_uri_component : uri_component:string -> unit -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Window/encodeURIComponent} \
     [encodeURIComponent] on MDN}."]

  val escape : value:string -> unit -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Window/escape} \
     [escape] on MDN}."]

  val unescape : value:string -> unit -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Window/unescape} \
     [unescape] on MDN}."]

  val eval : value:string -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Window/eval} \
     [eval] on MDN}."]
end = struct
  type t = [ `Window ] Jx.obj

  let t = Jx.expr "Window"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let decode_uri ~encoded_uri () =
    let encoded_uri = E_jx.string encoded_uri in
    D_jx.string (D_jx.meth t "decodeURI" [| encoded_uri |])

  let decode_uri_component ~encoded_uri_component () =
    let encoded_uri_component = E_jx.string encoded_uri_component in
    D_jx.string (D_jx.meth t "decodeURIComponent" [| encoded_uri_component |])

  let encode_uri ~uri () =
    let uri = E_jx.string uri in
    D_jx.string (D_jx.meth t "encodeURI" [| uri |])

  let encode_uri_component ~uri_component () =
    let uri_component = E_jx.string uri_component in
    D_jx.string (D_jx.meth t "encodeURIComponent" [| uri_component |])

  let escape ~value () =
    let value = E_jx.string value in
    D_jx.string (D_jx.meth t "escape" [| value |])

  let unescape ~value () =
    let value = E_jx.string value in
    D_jx.string (D_jx.meth t "unescape" [| value |])

  let eval ~value () =
    let value = E_jx.string value in
    D_jx.meth t "eval" [| value |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Window} [Window] \
   on MDN}."]

and Getter : sig
  type t = Jx.any

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end =
  Getter

and Setter : sig
  type t = Jx.any -> unit

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end =
  Setter

and Property_descriptor : sig
  type t [@@ocaml.doc "The type for the [PropertyDescriptor] dictionary."]

  val make :
    ?configurable:bool ->
    ?enumerable:bool ->
    ?value:Jx.any ->
    ?writable:bool option ->
    ?get:Getter.t option ->
    ?set:Setter.t option ->
    unit ->
    t

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val configurable : t -> bool option
  val enumerable : t -> bool option
  val value : t -> Jx.any option
  val writable : t -> bool option option
  val get : t -> Getter.t option option
  val set : t -> Setter.t option option
end = struct
  type t = Jx.any

  let make ?configurable ?enumerable ?value ?writable ?get ?set () =
    let configurable = (E_jx.nullable E_jx.bool) configurable in
    let enumerable = (E_jx.nullable E_jx.bool) enumerable in
    let value = (E_jx.nullable E_jx.obj) value in
    let writable = (E_jx.nullable (E_jx.nullable E_jx.bool)) writable in
    let get = (E_jx.nullable (E_jx.nullable Getter.to_any)) get in
    let set = (E_jx.nullable (E_jx.nullable Setter.to_any)) set in
    Jx.obj
      [|
        ("configurable", configurable);
        ("enumerable", enumerable);
        ("value", value);
        ("writable", writable);
        ("get", get);
        ("set", set);
      |]

  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let configurable this =
    (D_jx.nullable D_jx.bool) (Js_ffi.get this "configurable")

  let enumerable this = (D_jx.nullable D_jx.bool) (Js_ffi.get this "enumerable")
  let value this = (D_jx.nullable D_jx.obj) (Js_ffi.get this "value")

  let writable this =
    (D_jx.nullable (D_jx.nullable D_jx.bool)) (Js_ffi.get this "writable")

  let get this =
    (D_jx.nullable (D_jx.nullable Getter.of_any)) (Js_ffi.get this "get")

  let set this =
    (D_jx.nullable (D_jx.nullable Setter.of_any)) (Js_ffi.get this "set")
end

and Object : sig
  type t = [ `Object ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object} [Object]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?value:Jx.any -> unit -> t

  val assign : target:t -> sources:t array -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/assign} \
     [assign] on MDN}."]

  val create : proto:t -> ?props:Property_descriptor.t Jx.dict -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/create} \
     [create] on MDN}."]

  val define_properties :
    obj:t -> props:Property_descriptor.t Jx.dict -> unit -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/defineProperties} \
     [defineProperties] on MDN}."]

  val define_property :
    obj:t ->
    prop:[< `String | `Symbol ] Jx.obj ->
    descriptor:Property_descriptor.t ->
    unit ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/defineProperty} \
     [defineProperty] on MDN}."]

  val entries : obj:t -> unit -> Object.t array array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/entries} \
     [entries] on MDN}."]

  val freeze : obj:t -> unit -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/freeze} \
     [freeze] on MDN}."]

  val from_entries : iterable:Object.t array array -> unit -> t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/fromEntries} \
     [fromEntries] on MDN}."]

  val get_own_property_descriptor :
    obj:t ->
    prop:[< `String | `Symbol ] Jx.obj ->
    unit ->
    Property_descriptor.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/getOwnPropertyDescriptor} \
     [getOwnPropertyDescriptor] on MDN}."]

  val get_own_property_descriptors :
    obj:t -> unit -> Property_descriptor.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/getOwnPropertyDescriptors} \
     [getOwnPropertyDescriptors] on MDN}."]

  val get_own_property_names : obj:t -> unit -> string array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/getOwnPropertyNames} \
     [getOwnPropertyNames] on MDN}."]

  val get_own_property_symbols : obj:t -> unit -> [ `Symbol ] Jx.obj array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/getOwnPropertySymbols} \
     [getOwnPropertySymbols] on MDN}."]

  val get_prototype_of : obj:t -> unit -> t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/getPrototypeOf} \
     [getPrototypeOf] on MDN}."]

  val is : value1:t -> value2:t -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/is} [is] \
     on MDN}."]

  val is_extensible : obj:t -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/isExtensible} \
     [isExtensible] on MDN}."]

  val is_frozen : obj:t -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/isFrozen} \
     [isFrozen] on MDN}."]

  val is_sealed : obj:t -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/isSealed} \
     [isSealed] on MDN}."]

  val keys : obj:t -> unit -> string array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/keys} \
     [keys] on MDN}."]

  val prevent_extensions : obj:t -> unit -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/preventExtensions} \
     [preventExtensions] on MDN}."]

  val seal : obj:Jx.any -> unit -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/seal} \
     [seal] on MDN}."]

  val set_prototype_of : obj:t -> prototype:Jx.any -> unit -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/setPrototypeOf} \
     [setPrototypeOf] on MDN}."]

  val values : obj:t -> unit -> Jx.any array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/values} \
     [values] on MDN}."]

  val has_own_property : prop:[< `Symbol | `String ] Jx.obj -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/hasOwnProperty} \
     [hasOwnProperty] on MDN}."]

  val is_prototype_of : obj:t -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/isPrototypeOf} \
     [isPrototypeOf] on MDN}."]

  val property_is_enumerable : prop:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/propertyIsEnumerable} \
     [propertyIsEnumerable] on MDN}."]

  val to_locale_string :
    locales:[< `String | `Sequence ] Jx.obj -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/toString} \
     [toString] on MDN}."]

  val value_of : t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Object ] Jx.obj

  let t = Jx.expr "Object"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?value () =
    let value = (E_jx.undefined E_jx.obj) value in
    Jx.obj_new t [| value |]

  let assign ~target ~sources () =
    let target = to_any target in
    let sources = (E_jx.array to_any) sources in
    of_any (D_jx.meth t "assign" [| target; sources |])

  let create ~proto ?props () =
    let proto = to_any proto in
    let props = (E_jx.undefined (E_jx.dict Property_descriptor.to_any)) props in
    of_any (D_jx.meth t "create" [| proto; props |])

  let define_properties ~obj ~props () =
    let obj = to_any obj in
    let props = E_jx.dict Property_descriptor.to_any props in
    D_jx.unit (D_jx.meth t "defineProperties" [| obj; props |])

  let define_property ~obj ~prop ~descriptor () =
    let obj = to_any obj in
    let prop = E_jx.obj prop in
    let descriptor = Property_descriptor.to_any descriptor in
    D_jx.unit (D_jx.meth t "defineProperty" [| obj; prop; descriptor |])

  let entries ~obj () =
    let obj = to_any obj in
    (D_jx.array (D_jx.array of_any)) (D_jx.meth t "entries" [| obj |])

  let freeze ~obj () =
    let obj = to_any obj in
    D_jx.unit (D_jx.meth t "freeze" [| obj |])

  let from_entries ~iterable () =
    let iterable = (E_jx.array (E_jx.array to_any)) iterable in
    of_any (D_jx.meth t "fromEntries" [| iterable |])

  let get_own_property_descriptor ~obj ~prop () =
    let obj = to_any obj in
    let prop = E_jx.obj prop in
    (D_jx.nullable Property_descriptor.of_any)
      (D_jx.meth t "getOwnPropertyDescriptor" [| obj; prop |])

  let get_own_property_descriptors ~obj () =
    let obj = to_any obj in
    (D_jx.array Property_descriptor.of_any)
      (D_jx.meth t "getOwnPropertyDescriptors" [| obj |])

  let get_own_property_names ~obj () =
    let obj = to_any obj in
    (D_jx.array D_jx.string) (D_jx.meth t "getOwnPropertyNames" [| obj |])

  let get_own_property_symbols ~obj () =
    let obj = to_any obj in
    (D_jx.array D_jx.obj) (D_jx.meth t "getOwnPropertySymbols" [| obj |])

  let get_prototype_of ~obj () =
    let obj = to_any obj in
    (D_jx.nullable of_any) (D_jx.meth t "getPrototypeOf" [| obj |])

  let is ~value1 ~value2 () =
    let value1 = to_any value1 in
    let value2 = to_any value2 in
    D_jx.bool (D_jx.meth t "is" [| value1; value2 |])

  let is_extensible ~obj () =
    let obj = to_any obj in
    D_jx.bool (D_jx.meth t "isExtensible" [| obj |])

  let is_frozen ~obj () =
    let obj = to_any obj in
    D_jx.bool (D_jx.meth t "isFrozen" [| obj |])

  let is_sealed ~obj () =
    let obj = to_any obj in
    D_jx.bool (D_jx.meth t "isSealed" [| obj |])

  let keys ~obj () =
    let obj = to_any obj in
    (D_jx.array D_jx.string) (D_jx.meth t "keys" [| obj |])

  let prevent_extensions ~obj () =
    let obj = to_any obj in
    D_jx.unit (D_jx.meth t "preventExtensions" [| obj |])

  let seal ~obj () =
    let obj = E_jx.obj obj in
    D_jx.unit (D_jx.meth t "seal" [| obj |])

  let set_prototype_of ~obj ~prototype () =
    let obj = to_any obj in
    let prototype = E_jx.obj prototype in
    D_jx.unit (D_jx.meth t "setPrototypeOf" [| obj; prototype |])

  let values ~obj () =
    let obj = to_any obj in
    (D_jx.array D_jx.obj) (D_jx.meth t "values" [| obj |])

  let has_own_property ~prop this =
    let prop = E_jx.obj prop in
    D_jx.bool (D_jx.meth this "hasOwnProperty" [| prop |])

  let is_prototype_of ~obj this =
    let obj = to_any obj in
    D_jx.bool (D_jx.meth this "isPrototypeOf" [| obj |])

  let property_is_enumerable ~prop this =
    let prop = E_jx.string prop in
    D_jx.bool (D_jx.meth this "propertyIsEnumerable" [| prop |])

  let to_locale_string ~locales ?options this =
    let locales = E_jx.obj locales in
    let options = (E_jx.undefined E_jx.obj) options in
    D_jx.string (D_jx.meth this "toLocaleString" [| locales; options |])

  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let value_of this = of_any (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object} [Object] \
   on MDN}."]

and Function : sig
  type t = [ `Function ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Function} [Function]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val with_params_and_body : params:string array -> body:string -> unit -> t

  val apply : this_arg:t -> arg_array:Jx.any array -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/apply} \
     [apply] on MDN}."]

  val bind : this_arg:t -> args:Jx.any array -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/bind} \
     [bind] on MDN}."]

  val call : this_arg:t -> args:Jx.any array -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/call} \
     [call] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Function/toString} \
     [toString] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/length} \
     [length] on MDN}."]

  val name : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/name} \
     [name] on MDN}."]
end = struct
  type t = [ `Function ] Jx.obj

  let t = Jx.expr "Function"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let with_params_and_body ~params ~body () =
    let params = (E_jx.array E_jx.string) params in
    let body = E_jx.string body in
    Jx.obj_new t [| params; body |]

  let apply ~this_arg ~arg_array this =
    let this_arg = to_any this_arg in
    let arg_array = (E_jx.array Js.of_any) arg_array in
    Js_ffi.to_any (D_jx.meth this "apply" [| this_arg; arg_array |])

  let bind ~this_arg ~args this =
    let this_arg = to_any this_arg in
    let args = (E_jx.array Js.of_any) args in
    of_any (D_jx.meth this "bind" [| this_arg; args |])

  let call ~this_arg ~args this =
    let this_arg = to_any this_arg in
    let args = (E_jx.array Js.of_any) args in
    Js_ffi.to_any (D_jx.meth this "call" [| this_arg; args |])

  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let length this = D_jx.int (Js_ffi.get this "length")
  let name this = D_jx.string (Js_ffi.get this "name")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function} \
   [Function] on MDN}."]

and Boolean : sig
  type t = [ `Boolean ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Boolean} [Boolean]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?value:bool -> unit -> t

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Boolean/toString} \
     [toString] on MDN}."]

  val value_of : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Boolean/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Boolean ] Jx.obj

  let t = Jx.expr "Boolean"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?value () =
    let value = (E_jx.undefined E_jx.bool) value in
    Jx.obj_new t [| value |]

  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let value_of this = D_jx.bool (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Boolean} [Boolean] \
   on MDN}."]

and Symbol : sig
  type t = [ `Symbol ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol} [Symbol]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?description:string -> unit -> t

  val for' : key:string -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/for} \
     [for] on MDN}."]

  val key_for : sym:string -> unit -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/keyFor} \
     [keyFor] on MDN}."]

  val has_instance : bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/hasInstance} \
     [hasInstance] on MDN}."]

  val is_concat_spreadable : bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/isConcatSpreadable} \
     [isConcatSpreadable] on MDN}."]

  val iterator : Symbol.t array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/iterator} \
     [iterator] on MDN}."]

  val match' : string array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/match} \
     [match] on MDN}."]

  val replace : string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/replace} \
     [replace] on MDN}."]

  val search : int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/search} \
     [search] on MDN}."]

  val species : Function.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/species} \
     [species] on MDN}."]

  val split : string array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/split} \
     [split] on MDN}."]

  val to_primitive : Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/toPrimitive} \
     [toPrimitive] on MDN}."]

  val to_string_tag : string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/toStringTag} \
     [toStringTag] on MDN}."]

  val unscopables : Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/unscopables} \
     [unscopables] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/toString} \
     [toString] on MDN}."]

  val value_of : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Symbol ] Jx.obj

  let t = Jx.expr "Symbol"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?description () =
    let description = (E_jx.undefined E_jx.string) description in
    Jx.obj_new t [| description |]

  let for' ~key () =
    let key = E_jx.string key in
    of_any (D_jx.meth t "for" [| key |])

  let key_for ~sym () =
    let sym = E_jx.string sym in
    D_jx.string (D_jx.meth t "keyFor" [| sym |])

  let has_instance = D_jx.bool (Js_ffi.get t "hasInstance")
  let is_concat_spreadable = D_jx.bool (Js_ffi.get t "isConcatSpreadable")
  let iterator = (D_jx.array of_any) (Js_ffi.get t "iterator")
  let match' = (D_jx.array D_jx.string) (Js_ffi.get t "match")
  let replace = D_jx.string (Js_ffi.get t "replace")
  let search = D_jx.int (Js_ffi.get t "search")
  let species = Function.of_any (Js_ffi.get t "species")
  let split = (D_jx.array D_jx.string) (Js_ffi.get t "split")
  let to_primitive = Js.of_any (Js_ffi.get t "toPrimitive")
  let to_string_tag = D_jx.string (Js_ffi.get t "toStringTag")
  let unscopables = Js.of_any (Js_ffi.get t "unscopables")
  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let value_of this = Js.of_any (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol} [Symbol] \
   on MDN}."]

and Number : sig
  type t = [ `Number ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number} [Number]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?value:int -> unit -> t

  val is_finite : number:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/isFinite} \
     [isFinite] on MDN}."]

  val is_integer : number:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/isInteger} \
     [isInteger] on MDN}."]

  val is_na_n : number:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/isNaN} \
     [isNaN] on MDN}."]

  val is_safe_integer : number:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/isSafeInteger} \
     [isSafeInteger] on MDN}."]

  val parse_float : str:string -> unit -> float
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/parseFloat} \
     [parseFloat] on MDN}."]

  val parse_int : str:string -> radix:int -> unit -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/parseInt} \
     [parseInt] on MDN}."]

  val epsilon : float
  val max_safe_integer : int
  val max_value : float
  val min_safe_integer : int
  val min_value : float
  val nan : float
  val negative_infinity : float
  val positive_infinity : float

  val to_exponential : fraction_digits:int -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/toExponential} \
     [toExponential] on MDN}."]

  val to_fixed : fraction_digits:int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/toFixed} \
     [toFixed] on MDN}."]

  val to_locale_string :
    locales:[< `String | `Sequence ] Jx.obj -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_precision : precision:int -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/toPrecision} \
     [toPrecision] on MDN}."]

  val to_string : radix:int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/toString} \
     [toString] on MDN}."]

  val value_of : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Number ] Jx.obj

  let t = Jx.expr "Number"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?value () =
    let value = (E_jx.undefined E_jx.int) value in
    Jx.obj_new t [| value |]

  let is_finite ~number () =
    let number = Js.of_any number in
    D_jx.bool (D_jx.meth t "isFinite" [| number |])

  let is_integer ~number () =
    let number = Js.of_any number in
    D_jx.bool (D_jx.meth t "isInteger" [| number |])

  let is_na_n ~number () =
    let number = Js.of_any number in
    D_jx.bool (D_jx.meth t "isNaN" [| number |])

  let is_safe_integer ~number () =
    let number = Js.of_any number in
    D_jx.bool (D_jx.meth t "isSafeInteger" [| number |])

  let parse_float ~str () =
    let str = E_jx.string str in
    D_jx.float (D_jx.meth t "parseFloat" [| str |])

  let parse_int ~str ~radix () =
    let str = E_jx.string str in
    let radix = E_jx.int radix in
    D_jx.int (D_jx.meth t "parseInt" [| str; radix |])

  let epsilon = 2.22044604925e-16
  let max_safe_integer = 9007199254740991
  let max_value = 1.79769313486e+308
  let min_safe_integer = -9007199254740991
  let min_value = 4.94065645841e-324
  let nan = nan
  let negative_infinity = infinity
  let positive_infinity = infinity

  let to_exponential ~fraction_digits this =
    let fraction_digits = E_jx.int fraction_digits in
    D_jx.string (D_jx.meth this "toExponential" [| fraction_digits |])

  let to_fixed ~fraction_digits this =
    let fraction_digits = E_jx.int fraction_digits in
    D_jx.string (D_jx.meth this "toFixed" [| fraction_digits |])

  let to_locale_string ~locales ?options this =
    let locales = Js_ffi.to_any locales in
    let options = (E_jx.undefined Js.of_any) options in
    D_jx.string (D_jx.meth this "toLocaleString" [| locales; options |])

  let to_precision ~precision this =
    let precision = E_jx.int precision in
    D_jx.string (D_jx.meth this "toPrecision" [| precision |])

  let to_string ~radix this =
    let radix = E_jx.int radix in
    D_jx.string (D_jx.meth this "toString" [| radix |])

  let value_of this = Js.of_any (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number} [Number] \
   on MDN}."]

and Big_int : sig
  type t = [ `Big_int ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BigInt} [BigInt]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : value:[< `String | `Long | `Bool | `Big_int ] Jx.obj -> unit -> t

  val as_int_n : bits:int -> bigint:t -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/asIntN} \
     [asIntN] on MDN}."]

  val as_uint_n : bits:int -> bigint:t -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/asUintN} \
     [asUintN] on MDN}."]

  val to_locale_string :
    locales:[< `String | `Sequence ] Jx.obj -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BigInt/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_string : radix:int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/toString} \
     [toString] on MDN}."]

  val value_of : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Big_int ] Jx.obj

  let t = Jx.expr "BigInt"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ~value () =
    let value = Js_ffi.to_any value in
    Jx.obj_new t [| value |]

  let as_int_n ~bits ~bigint this =
    let bits = E_jx.int bits in
    let bigint = to_any bigint in
    D_jx.int (D_jx.meth this "asIntN" [| bits; bigint |])

  let as_uint_n ~bits ~bigint this =
    let bits = E_jx.int bits in
    let bigint = to_any bigint in
    D_jx.int (D_jx.meth this "asUintN" [| bits; bigint |])

  let to_locale_string ~locales ?options this =
    let locales = Js_ffi.to_any locales in
    let options = (E_jx.undefined Js.of_any) options in
    D_jx.string (D_jx.meth this "toLocaleString" [| locales; options |])

  let to_string ~radix this =
    let radix = E_jx.int radix in
    D_jx.string (D_jx.meth this "toString" [| radix |])

  let value_of this = Js.of_any (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt} [BigInt] \
   on MDN}."]

and Math : sig
  val e : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/E} [E] on \
     MDN}."]

  val ln10 : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/LN10} \
     [LN10] on MDN}."]

  val ln2 : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/LN2} [LN2] \
     on MDN}."]

  val log10_e : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/LOG10E} \
     [LOG10E] on MDN}."]

  val log2_e : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/LOG2E} \
     [LOG2E] on MDN}."]

  val pi : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/PI} [PI] on \
     MDN}."]

  val sqrt1_2 : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/SQRT1_2} \
     [SQRT1_2] on MDN}."]

  val sqrt2 : float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/SQRT2} \
     [SQRT2] on MDN}."]

  val abs : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/abs} [abs] \
     on MDN}."]

  val acos : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/acos} \
     [acos] on MDN}."]

  val acosh : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/acosh} \
     [acosh] on MDN}."]

  val asin : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/asin} \
     [asin] on MDN}."]

  val asinh : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/asinh} \
     [asinh] on MDN}."]

  val atan : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/atan} \
     [atan] on MDN}."]

  val atanh : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/atanh} \
     [atanh] on MDN}."]

  val atan2 : y:float -> x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/atan2} \
     [atan2] on MDN}."]

  val cbrt : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/cbrt} \
     [cbrt] on MDN}."]

  val ceil : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/ceil} \
     [ceil] on MDN}."]

  val clz32 : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/clz32} \
     [clz32] on MDN}."]

  val cos : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/cos} [cos] \
     on MDN}."]

  val cosh : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/cosh} \
     [cosh] on MDN}."]

  val exp : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/exp} [exp] \
     on MDN}."]

  val expm1 : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/expm1} \
     [expm1] on MDN}."]

  val floor : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/floor} \
     [floor] on MDN}."]

  val fround : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/fround} \
     [fround] on MDN}."]

  val hypot :
    value1:float -> value2:float -> values:float array -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/hypot} \
     [hypot] on MDN}."]

  val imul : x:float -> y:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/imul} \
     [imul] on MDN}."]

  val log : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/log} [log] \
     on MDN}."]

  val log1p : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/log1p} \
     [log1p] on MDN}."]

  val log10 : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/log10} \
     [log10] on MDN}."]

  val log2 : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/log2} \
     [log2] on MDN}."]

  val max : value1:float -> value2:float -> values:float array -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/max} [max] \
     on MDN}."]

  val min : value1:float -> value2:float -> values:float array -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/min} [min] \
     on MDN}."]

  val pow : x:float -> y:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/pow} [pow] \
     on MDN}."]

  val random : unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/random} \
     [random] on MDN}."]

  val round : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/round} \
     [round] on MDN}."]

  val sign : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/sign} \
     [sign] on MDN}."]

  val sin : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/sin} [sin] \
     on MDN}."]

  val sinh : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/sinh} \
     [sinh] on MDN}."]

  val sqrt : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/sqrt} \
     [sqrt] on MDN}."]

  val tan : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/tan} [tan] \
     on MDN}."]

  val tanh : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/tanh} \
     [tanh] on MDN}."]

  val trunc : x:float -> unit -> float
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Math/trunc} \
     [trunc] on MDN}."]
end = struct
  let t = D_jx.obj (Js_ffi.global "Math")
  let e = D_jx.float (Js_ffi.get t "E")
  let ln10 = D_jx.float (Js_ffi.get t "LN10")
  let ln2 = D_jx.float (Js_ffi.get t "LN2")
  let log10_e = D_jx.float (Js_ffi.get t "LOG10E")
  let log2_e = D_jx.float (Js_ffi.get t "LOG2E")
  let pi = D_jx.float (Js_ffi.get t "PI")
  let sqrt1_2 = D_jx.float (Js_ffi.get t "SQRT1_2")
  let sqrt2 = D_jx.float (Js_ffi.get t "SQRT2")

  let abs ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "abs" [| x |])

  let acos ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "acos" [| x |])

  let acosh ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "acosh" [| x |])

  let asin ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "asin" [| x |])

  let asinh ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "asinh" [| x |])

  let atan ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "atan" [| x |])

  let atanh ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "atanh" [| x |])

  let atan2 ~y ~x () =
    let y = E_jx.float y in
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "atan2" [| y; x |])

  let cbrt ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "cbrt" [| x |])

  let ceil ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "ceil" [| x |])

  let clz32 ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "clz32" [| x |])

  let cos ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "cos" [| x |])

  let cosh ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "cosh" [| x |])

  let exp ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "exp" [| x |])

  let expm1 ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "expm1" [| x |])

  let floor ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "floor" [| x |])

  let fround ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "fround" [| x |])

  let hypot ~value1 ~value2 ~values () =
    let value1 = E_jx.float value1 in
    let value2 = E_jx.float value2 in
    let values = (E_jx.array E_jx.float) values in
    D_jx.float (D_jx.meth t "hypot" [| value1; value2; values |])

  let imul ~x ~y () =
    let x = E_jx.float x in
    let y = E_jx.float y in
    D_jx.float (D_jx.meth t "imul" [| x; y |])

  let log ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "log" [| x |])

  let log1p ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "log1p" [| x |])

  let log10 ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "log10" [| x |])

  let log2 ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "log2" [| x |])

  let max ~value1 ~value2 ~values () =
    let value1 = E_jx.float value1 in
    let value2 = E_jx.float value2 in
    let values = (E_jx.array E_jx.float) values in
    D_jx.float (D_jx.meth t "max" [| value1; value2; values |])

  let min ~value1 ~value2 ~values () =
    let value1 = E_jx.float value1 in
    let value2 = E_jx.float value2 in
    let values = (E_jx.array E_jx.float) values in
    D_jx.float (D_jx.meth t "min" [| value1; value2; values |])

  let pow ~x ~y () =
    let x = E_jx.float x in
    let y = E_jx.float y in
    D_jx.float (D_jx.meth t "pow" [| x; y |])

  let random () = D_jx.float (D_jx.meth t "random" [||])

  let round ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "round" [| x |])

  let sign ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "sign" [| x |])

  let sin ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "sin" [| x |])

  let sinh ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "sinh" [| x |])

  let sqrt ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "sqrt" [| x |])

  let tan ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "tan" [| x |])

  let tanh ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "tanh" [| x |])

  let trunc ~x () =
    let x = E_jx.float x in
    D_jx.float (D_jx.meth t "trunc" [| x |])
end

and Date : sig
  type t = [ `Date ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date} [Date]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?value:[< `Long | `String | `Date ] Jx.obj -> unit -> t

  val with_year_and_month_and_date_and_hours_and_minutes_and_seconds_and_ms :
    year:int ->
    month:int ->
    ?date:int ->
    ?hours:int ->
    ?minutes:int ->
    ?seconds:int ->
    ?ms:int ->
    unit ->
    t

  val now : unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/now} [now] \
     on MDN}."]

  val parse : string:string -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/parse} \
     [parse] on MDN}."]

  val utc :
    year:int ->
    month:int ->
    ?date:int ->
    ?hours:int ->
    ?minutes:int ->
    ?seconds:int ->
    ?ms:int ->
    unit ->
    int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/UTC} [UTC] \
     on MDN}."]

  val get_date : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getDate} \
     [getDate] on MDN}."]

  val get_day : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getDay} \
     [getDay] on MDN}."]

  val get_full_year : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getFullYear} \
     [getFullYear] on MDN}."]

  val get_hours : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getHours} \
     [getHours] on MDN}."]

  val get_milliseconds : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getMilliseconds} \
     [getMilliseconds] on MDN}."]

  val get_minutes : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getMinutes} \
     [getMinutes] on MDN}."]

  val get_month : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getMonth} \
     [getMonth] on MDN}."]

  val get_seconds : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getSeconds} \
     [getSeconds] on MDN}."]

  val get_time : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getTime} \
     [getTime] on MDN}."]

  val get_timezone_offset : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getTimezoneOffset} \
     [getTimezoneOffset] on MDN}."]

  val get_utc_date : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCDate} \
     [getUTCDate] on MDN}."]

  val get_utc_day : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCDay} \
     [getUTCDay] on MDN}."]

  val get_utc_full_year : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCFullYear} \
     [getUTCFullYear] on MDN}."]

  val get_utc_hours : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCHours} \
     [getUTCHours] on MDN}."]

  val get_utc_milliseconds : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCMilliseconds} \
     [getUTCMilliseconds] on MDN}."]

  val get_utc_minutes : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCMinutes} \
     [getUTCMinutes] on MDN}."]

  val get_utc_month : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCMonth} \
     [getUTCMonth] on MDN}."]

  val get_utc_seconds : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/getUTCSeconds} \
     [getUTCSeconds] on MDN}."]

  val set_date : date:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setDate} \
     [setDate] on MDN}."]

  val set_full_year : year:int -> ?month:int -> ?date:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setFullYear} \
     [setFullYear] on MDN}."]

  val set_hours : hour:int -> ?min:int -> ?sec:int -> ?ms:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setHours} \
     [setHours] on MDN}."]

  val set_milliseconds : ms:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setMilliseconds} \
     [setMilliseconds] on MDN}."]

  val set_minutes : min:int -> ?sec:int -> ?ms:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setMinutes} \
     [setMinutes] on MDN}."]

  val set_month : month:int -> ?date:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setMonth} \
     [setMonth] on MDN}."]

  val set_seconds : sec:int -> ?ms:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setSeconds} \
     [setSeconds] on MDN}."]

  val set_time : time:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setTime} \
     [setTime] on MDN}."]

  val set_utc_date : date:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCDate} \
     [setUTCDate] on MDN}."]

  val set_utc_full_year : year:int -> ?month:int -> ?date:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCFullYear} \
     [setUTCFullYear] on MDN}."]

  val set_utc_hours : hour:int -> ?min:int -> ?sec:int -> ?ms:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCHours} \
     [setUTCHours] on MDN}."]

  val set_utc_milliseconds : ms:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCMilliseconds} \
     [setUTCMilliseconds] on MDN}."]

  val set_utc_minutes : min:int -> ?sec:int -> ?ms:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCMinutes} \
     [setUTCMinutes] on MDN}."]

  val set_utc_month : month:int -> ?date:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCMonth} \
     [setUTCMonth] on MDN}."]

  val set_utc_seconds : sec:int -> ?ms:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/setUTCSeconds} \
     [setUTCSeconds] on MDN}."]

  val to_date_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toDateString} \
     [toDateString] on MDN}."]

  val to_iso_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toISOString} \
     [toISOString] on MDN}."]

  val to_json : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/toJSON} \
     [toJSON] on MDN}."]

  val to_locale_date_string : ?locales:string -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toLocaleDateString} \
     [toLocaleDateString] on MDN}."]

  val to_locale_string : ?locales:string -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_locale_time_string : ?locales:string -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toLocaleTimeString} \
     [toLocaleTimeString] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/toString} \
     [toString] on MDN}."]

  val to_time_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toTimeString} \
     [toTimeString] on MDN}."]

  val to_utc_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toUTCString} \
     [toUTCString] on MDN}."]

  val value_of : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Date ] Jx.obj

  let t = D_jx.obj (Jx.expr "Date")
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?value () =
    let value = (E_jx.undefined Js_ffi.to_any) value in
    Jx.obj_new t [| value |]

  let with_year_and_month_and_date_and_hours_and_minutes_and_seconds_and_ms
      ~year ~month ?date ?hours ?minutes ?seconds ?ms () =
    let year = E_jx.int year in
    let month = E_jx.int month in
    let date = (E_jx.undefined E_jx.int) date in
    let hours = (E_jx.undefined E_jx.int) hours in
    let minutes = (E_jx.undefined E_jx.int) minutes in
    let seconds = (E_jx.undefined E_jx.int) seconds in
    let ms = (E_jx.undefined E_jx.int) ms in
    Jx.obj_new t [| year; month; date; hours; minutes; seconds; ms |]

  let now () = of_any (D_jx.meth t "now" [||])

  let parse ~string () =
    let string = E_jx.string string in
    of_any (D_jx.meth t "parse" [| string |])

  let utc ~year ~month ?date ?hours ?minutes ?seconds ?ms () =
    let year = E_jx.int year in
    let month = E_jx.int month in
    let date = (E_jx.undefined E_jx.int) date in
    let hours = (E_jx.undefined E_jx.int) hours in
    let minutes = (E_jx.undefined E_jx.int) minutes in
    let seconds = (E_jx.undefined E_jx.int) seconds in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int
      (D_jx.meth t "UTC" [| year; month; date; hours; minutes; seconds; ms |])

  let get_date this = D_jx.int (D_jx.meth this "getDate" [||])
  let get_day this = D_jx.int (D_jx.meth this "getDay" [||])
  let get_full_year this = D_jx.int (D_jx.meth this "getFullYear" [||])
  let get_hours this = D_jx.int (D_jx.meth this "getHours" [||])
  let get_milliseconds this = D_jx.int (D_jx.meth this "getMilliseconds" [||])
  let get_minutes this = D_jx.int (D_jx.meth this "getMinutes" [||])
  let get_month this = D_jx.int (D_jx.meth this "getMonth" [||])
  let get_seconds this = D_jx.int (D_jx.meth this "getSeconds" [||])
  let get_time this = Js.of_any (D_jx.meth this "getTime" [||])

  let get_timezone_offset this =
    D_jx.int (D_jx.meth this "getTimezoneOffset" [||])

  let get_utc_date this = D_jx.int (D_jx.meth this "getUTCDate" [||])
  let get_utc_day this = D_jx.int (D_jx.meth this "getUTCDay" [||])
  let get_utc_full_year this = D_jx.int (D_jx.meth this "getUTCFullYear" [||])
  let get_utc_hours this = D_jx.int (D_jx.meth this "getUTCHours" [||])

  let get_utc_milliseconds this =
    D_jx.int (D_jx.meth this "getUTCMilliseconds" [||])

  let get_utc_minutes this = D_jx.int (D_jx.meth this "getUTCMinutes" [||])
  let get_utc_month this = D_jx.int (D_jx.meth this "getUTCMonth" [||])
  let get_utc_seconds this = D_jx.int (D_jx.meth this "getUTCSeconds" [||])

  let set_date ~date this =
    let date = E_jx.int date in
    D_jx.int (D_jx.meth this "setDate" [| date |])

  let set_full_year ~year ?month ?date this =
    let year = E_jx.int year in
    let month = (E_jx.undefined E_jx.int) month in
    let date = (E_jx.undefined E_jx.int) date in
    D_jx.int (D_jx.meth this "setFullYear" [| year; month; date |])

  let set_hours ~hour ?min ?sec ?ms this =
    let hour = E_jx.int hour in
    let min = (E_jx.undefined E_jx.int) min in
    let sec = (E_jx.undefined E_jx.int) sec in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int (D_jx.meth this "setHours" [| hour; min; sec; ms |])

  let set_milliseconds ~ms this =
    let ms = E_jx.int ms in
    D_jx.int (D_jx.meth this "setMilliseconds" [| ms |])

  let set_minutes ~min ?sec ?ms this =
    let min = E_jx.int min in
    let sec = (E_jx.undefined E_jx.int) sec in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int (D_jx.meth this "setMinutes" [| min; sec; ms |])

  let set_month ~month ?date this =
    let month = E_jx.int month in
    let date = (E_jx.undefined E_jx.int) date in
    D_jx.int (D_jx.meth this "setMonth" [| month; date |])

  let set_seconds ~sec ?ms this =
    let sec = E_jx.int sec in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int (D_jx.meth this "setSeconds" [| sec; ms |])

  let set_time ~time this =
    let time = E_jx.int time in
    D_jx.int (D_jx.meth this "setTime" [| time |])

  let set_utc_date ~date this =
    let date = E_jx.int date in
    D_jx.int (D_jx.meth this "setUTCDate" [| date |])

  let set_utc_full_year ~year ?month ?date this =
    let year = E_jx.int year in
    let month = (E_jx.undefined E_jx.int) month in
    let date = (E_jx.undefined E_jx.int) date in
    D_jx.int (D_jx.meth this "setUTCFullYear" [| year; month; date |])

  let set_utc_hours ~hour ?min ?sec ?ms this =
    let hour = E_jx.int hour in
    let min = (E_jx.undefined E_jx.int) min in
    let sec = (E_jx.undefined E_jx.int) sec in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int (D_jx.meth this "setUTCHours" [| hour; min; sec; ms |])

  let set_utc_milliseconds ~ms this =
    let ms = E_jx.int ms in
    D_jx.int (D_jx.meth this "setUTCMilliseconds" [| ms |])

  let set_utc_minutes ~min ?sec ?ms this =
    let min = E_jx.int min in
    let sec = (E_jx.undefined E_jx.int) sec in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int (D_jx.meth this "setUTCMinutes" [| min; sec; ms |])

  let set_utc_month ~month ?date this =
    let month = E_jx.int month in
    let date = (E_jx.undefined E_jx.int) date in
    D_jx.int (D_jx.meth this "setUTCMonth" [| month; date |])

  let set_utc_seconds ~sec ?ms this =
    let sec = E_jx.int sec in
    let ms = (E_jx.undefined E_jx.int) ms in
    D_jx.int (D_jx.meth this "setUTCSeconds" [| sec; ms |])

  let to_date_string this = D_jx.string (D_jx.meth this "toDateString" [||])
  let to_iso_string this = D_jx.string (D_jx.meth this "toISOString" [||])
  let to_json this = D_jx.string (D_jx.meth this "toJSON" [||])

  let to_locale_date_string ?locales ?options this =
    let locales = (E_jx.undefined E_jx.string) locales in
    let options = (E_jx.undefined Js_ffi.to_any) options in
    D_jx.string (D_jx.meth this "toLocaleDateString" [| locales; options |])

  let to_locale_string ?locales ?options this =
    let locales = (E_jx.undefined E_jx.string) locales in
    let options = (E_jx.undefined Js_ffi.to_any) options in
    D_jx.string (D_jx.meth this "toLocaleString" [| locales; options |])

  let to_locale_time_string ?locales ?options this =
    let locales = (E_jx.undefined E_jx.string) locales in
    let options = (E_jx.undefined Js_ffi.to_any) options in
    D_jx.string (D_jx.meth this "toLocaleTimeString" [| locales; options |])

  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let to_time_string this = D_jx.string (D_jx.meth this "toTimeString" [||])
  let to_utc_string this = D_jx.string (D_jx.meth this "toUTCString" [||])
  let value_of this = D_jx.int (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date} [Date] on \
   MDN}."]

and String : sig
  type t = [ `String ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String} [String]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : value:Jx.any -> unit -> t

  val from_char_code : code_units:string array -> unit -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/fromCharCode} \
     [fromCharCode] on MDN}."]

  val from_code_point : code_points:string array -> unit -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/fromCodePoint} \
     [fromCodePoint] on MDN}."]

  val raw : template:string -> substitutions:string array -> unit -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/raw} \
     [raw] on MDN}."]

  val char_at : pos:int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/charAt} \
     [charAt] on MDN}."]

  val char_code_at : pos:int -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/charCodeAt} \
     [charCodeAt] on MDN}."]

  val code_point_at : pos:int -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/codePointAt} \
     [codePointAt] on MDN}."]

  val concat : strings:string array -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/concat} \
     [concat] on MDN}."]

  val ends_with : search_string:string -> ?end_position:int -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/endsWith} \
     [endsWith] on MDN}."]

  val includes : search_string:string -> ?position:int -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/includes} \
     [includes] on MDN}."]

  val index_of : search_string:string -> ?position:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/indexOf} \
     [indexOf] on MDN}."]

  val last_index_of : search_string:string -> ?position:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/lastIndexOf} \
     [lastIndexOf] on MDN}."]

  val locale_compare :
    that:Jx.any -> ?locales:string -> ?options:Jx.any -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/localeCompare} \
     [localeCompare] on MDN}."]

  val match' : regexp:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/match} \
     [match] on MDN}."]

  val normalize : ?form:string -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/normalize} \
     [normalize] on MDN}."]

  val pad_end : max_length:int -> fill_string:string -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/padEnd} \
     [padEnd] on MDN}."]

  val pad_start : max_length:int -> fill_string:string -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/padStart} \
     [padStart] on MDN}."]

  val repeat : count:int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/repeat} \
     [repeat] on MDN}."]

  val replace : search_value:Jx.any -> replace_value:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/replace} \
     [replace] on MDN}."]

  val search : regexp:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/search} \
     [search] on MDN}."]

  val slice : start:int -> end':int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/slice} \
     [slice] on MDN}."]

  val split : separator:string -> limit:int -> t -> string array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/split} \
     [split] on MDN}."]

  val starts_with : search_string:string -> ?position:int -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/startsWith} \
     [startsWith] on MDN}."]

  val substring : start:int -> end':int -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/substring} \
     [substring] on MDN}."]

  val to_locale_lower_case : ?locales:string -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/toLocaleLowerCase} \
     [toLocaleLowerCase] on MDN}."]

  val to_locale_upper_case : ?locales:string -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/toLocaleUpperCase} \
     [toLocaleUpperCase] on MDN}."]

  val to_lower_case : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/toLowerCase} \
     [toLowerCase] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/toString} \
     [toString] on MDN}."]

  val to_upper_case : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/toUpperCase} \
     [toUpperCase] on MDN}."]

  val trim : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/trim} \
     [trim] on MDN}."]

  val value_of : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `String ] Jx.obj

  let t = Jx.expr "String"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ~value () =
    let value = Js.of_any value in
    Jx.obj_new t [| value |]

  let from_char_code ~code_units () =
    let code_units = (E_jx.array E_jx.string) code_units in
    D_jx.string (D_jx.meth t "fromCharCode" [| code_units |])

  let from_code_point ~code_points () =
    let code_points = (E_jx.array E_jx.string) code_points in
    D_jx.string (D_jx.meth t "fromCodePoint" [| code_points |])

  let raw ~template ~substitutions () =
    let template = E_jx.string template in
    let substitutions = (E_jx.array E_jx.string) substitutions in
    D_jx.string (D_jx.meth t "raw" [| template; substitutions |])

  let char_at ~pos this =
    let pos = E_jx.int pos in
    D_jx.string (D_jx.meth this "charAt" [| pos |])

  let char_code_at ~pos this =
    let pos = E_jx.int pos in
    D_jx.string (D_jx.meth this "charCodeAt" [| pos |])

  let code_point_at ~pos this =
    let pos = E_jx.int pos in
    D_jx.string (D_jx.meth this "codePointAt" [| pos |])

  let concat ~strings this =
    let strings = (E_jx.array E_jx.string) strings in
    D_jx.string (D_jx.meth this "concat" [| strings |])

  let ends_with ~search_string ?end_position this =
    let search_string = E_jx.string search_string in
    let end_position = (E_jx.undefined E_jx.int) end_position in
    D_jx.bool (D_jx.meth this "endsWith" [| search_string; end_position |])

  let includes ~search_string ?position this =
    let search_string = E_jx.string search_string in
    let position = (E_jx.undefined E_jx.int) position in
    D_jx.bool (D_jx.meth this "includes" [| search_string; position |])

  let index_of ~search_string ?position this =
    let search_string = E_jx.string search_string in
    let position = (E_jx.undefined E_jx.int) position in
    D_jx.int (D_jx.meth this "indexOf" [| search_string; position |])

  let last_index_of ~search_string ?position this =
    let search_string = E_jx.string search_string in
    let position = (E_jx.undefined E_jx.int) position in
    D_jx.int (D_jx.meth this "lastIndexOf" [| search_string; position |])

  let locale_compare ~that ?locales ?options this =
    let that = Js_ffi.to_any that in
    let locales = (E_jx.undefined E_jx.string) locales in
    let options = (E_jx.undefined Js_ffi.to_any) options in
    D_jx.int (D_jx.meth this "localeCompare" [| that; locales; options |])

  let match' ~regexp this =
    let regexp = Js_ffi.to_any regexp in
    Js.of_any (D_jx.meth this "match" [| regexp |])

  let normalize ?form this =
    let form = (E_jx.undefined E_jx.string) form in
    D_jx.string (D_jx.meth this "normalize" [| form |])

  let pad_end ~max_length ~fill_string this =
    let max_length = E_jx.int max_length in
    let fill_string = E_jx.string fill_string in
    D_jx.string (D_jx.meth this "padEnd" [| max_length; fill_string |])

  let pad_start ~max_length ~fill_string this =
    let max_length = E_jx.int max_length in
    let fill_string = E_jx.string fill_string in
    D_jx.string (D_jx.meth this "padStart" [| max_length; fill_string |])

  let repeat ~count this =
    let count = E_jx.int count in
    D_jx.string (D_jx.meth this "repeat" [| count |])

  let replace ~search_value ~replace_value this =
    let search_value = Js_ffi.to_any search_value in
    let replace_value = Js_ffi.to_any replace_value in
    D_jx.string (D_jx.meth this "replace" [| search_value; replace_value |])

  let search ~regexp this =
    let regexp = Js_ffi.to_any regexp in
    Js.of_any (D_jx.meth this "search" [| regexp |])

  let slice ~start ~end' this =
    let start = E_jx.int start in
    let end' = E_jx.int end' in
    D_jx.string (D_jx.meth this "slice" [| start; end' |])

  let split ~separator ~limit this =
    let separator = E_jx.string separator in
    let limit = E_jx.int limit in
    (D_jx.array D_jx.string) (D_jx.meth this "split" [| separator; limit |])

  let starts_with ~search_string ?position this =
    let search_string = E_jx.string search_string in
    let position = (E_jx.undefined E_jx.int) position in
    D_jx.bool (D_jx.meth this "startsWith" [| search_string; position |])

  let substring ~start ~end' this =
    let start = E_jx.int start in
    let end' = E_jx.int end' in
    D_jx.string (D_jx.meth this "substring" [| start; end' |])

  let to_locale_lower_case ?locales this =
    let locales = (E_jx.undefined E_jx.string) locales in
    D_jx.string (D_jx.meth this "toLocaleLowerCase" [| locales |])

  let to_locale_upper_case ?locales this =
    let locales = (E_jx.undefined E_jx.string) locales in
    D_jx.string (D_jx.meth this "toLocaleUpperCase" [| locales |])

  let to_lower_case this = D_jx.string (D_jx.meth this "toLowerCase" [||])
  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let to_upper_case this = D_jx.string (D_jx.meth this "toUpperCase" [||])
  let trim this = D_jx.string (D_jx.meth this "trim" [||])
  let value_of this = Js.of_any (D_jx.meth this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String} [String] \
   on MDN}."]

and Reg_exp : sig
  type t = [ `Reg_exp ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/RegExp} [RegExp]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val with_pattern_and_flags :
    pattern:[< `String | `Reg_exp ] Jx.obj -> ?flags:string -> unit -> t

  val exec : string:string -> t -> string array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/exec} \
     [exec] on MDN}."]

  val flags : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/flags} \
     [flags] on MDN}."]

  val global : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/global} \
     [global] on MDN}."]

  val ignore_case : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/RegExp/ignoreCase} \
     [ignoreCase] on MDN}."]

  val multiline : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/RegExp/multiline} \
     [multiline] on MDN}."]

  val source : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/source} \
     [source] on MDN}."]

  val sticky : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/sticky} \
     [sticky] on MDN}."]

  val test : s:string -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/test} \
     [test] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/toString} \
     [toString] on MDN}."]

  val unicode : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/unicode} \
     [unicode] on MDN}."]

  val set_unicode : t -> bool -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp/unicode} \
     [unicode] on MDN}."]
end = struct
  type t = [ `Reg_exp ] Jx.obj

  let t = Jx.expr "RegExp"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let with_pattern_and_flags ~pattern ?flags () =
    let pattern = Js_ffi.to_any pattern in
    let flags = (E_jx.undefined E_jx.string) flags in
    Jx.obj_new t [| pattern; flags |]

  let exec ~string this =
    let string = E_jx.string string in
    (D_jx.array D_jx.string) (D_jx.meth this "exec" [| string |])

  let flags this = D_jx.string (Js_ffi.get this "flags")
  let global this = D_jx.bool (Js_ffi.get this "global")
  let ignore_case this = D_jx.bool (Js_ffi.get this "ignoreCase")
  let multiline this = D_jx.bool (Js_ffi.get this "multiline")
  let source this = D_jx.string (Js_ffi.get this "source")
  let sticky this = D_jx.bool (Js_ffi.get this "sticky")

  let test ~s this =
    let s = E_jx.string s in
    D_jx.bool (D_jx.meth this "test" [| s |])

  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let unicode this = D_jx.bool (Js_ffi.get this "unicode")
  let set_unicode this x = Js_ffi.set this "unicode" (E_jx.bool x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp} [RegExp] \
   on MDN}."]

and Array : sig
  type t = [ `Array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array} [Array]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : len:int -> unit -> t
  val make : args:Jx.any array -> unit -> t

  val from : items:Jx.any -> ?mapfn:Jx.any -> ?this_arg:Jx.any -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/from} \
     [from] on MDN}."]

  val is_array : arg:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/isArray} \
     [isArray] on MDN}."]

  val of' : items:Jx.any array -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/of} [of] \
     on MDN}."]

  val concat : arguments:Jx.any array -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/concat} \
     [concat] on MDN}."]

  val copy_within : target:int -> ?start:int -> ?end':int -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/copyWithin} \
     [copyWithin] on MDN}."]

  val entries : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/entries} \
     [entries] on MDN}."]

  val every : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/every} \
     [every] on MDN}."]

  val fill : value:Jx.any -> ?start:int -> ?end':int -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/fill} \
     [fill] on MDN}."]

  val filter : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/filter} \
     [filter] on MDN}."]

  val find : predicate:Jx.any -> ?this_arg:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/find} \
     [find] on MDN}."]

  val find_index : predicate:Jx.any -> ?this_arg:Jx.any -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/findIndex} \
     [findIndex] on MDN}."]

  val for_each : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/forEach} \
     [forEach] on MDN}."]

  val includes : search_element:Jx.any -> from_index:int -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/includes} \
     [includes] on MDN}."]

  val index_of : search_element:Jx.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/indexOf} \
     [indexOf] on MDN}."]

  val join : separator:string -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/join} \
     [join] on MDN}."]

  val keys : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/keys} \
     [keys] on MDN}."]

  val last_index_of : search_element:Jx.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/lastIndexOf} \
     [lastIndexOf] on MDN}."]

  val map : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/map} [map] \
     on MDN}."]

  val pop : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/pop} [pop] \
     on MDN}."]

  val push : items:Jx.any array -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/push} \
     [push] on MDN}."]

  val reduce : callbackfn:Jx.any -> ?initial_value:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/reduce} \
     [reduce] on MDN}."]

  val reduce_right : callbackfn:Jx.any -> ?initial_value:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/reduceRight} \
     [reduceRight] on MDN}."]

  val reverse : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/reverse} \
     [reverse] on MDN}."]

  val shift : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/shift} \
     [shift] on MDN}."]

  val slice : start:int -> end':int -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/slice} \
     [slice] on MDN}."]

  val some : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/some} \
     [some] on MDN}."]

  val sort : comparefn:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/sort} \
     [sort] on MDN}."]

  val splice : start:int -> delete_count:int -> items:Jx.any array -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/splice} \
     [splice] on MDN}."]

  val to_locale_time_string : ?locales:string -> ?options:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/toLocaleTimeString} \
     [toLocaleTimeString] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/toString} \
     [toString] on MDN}."]

  val unshift : items:Jx.any array -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/unshift} \
     [unshift] on MDN}."]

  val values : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/values} \
     [values] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/length} \
     [length] on MDN}."]
end = struct
  type t = [ `Array ] Jx.obj

  let t = Jx.expr "Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~len () =
    let len = E_jx.int len in
    Jx.obj_new t [| len |]

  let make ~args () =
    let args = (E_jx.array Js.of_any) args in
    Jx.obj_new t [| args |]

  let from ~items ?mapfn ?this_arg () =
    let items = Js.of_any items in
    let mapfn = (E_jx.undefined Js_ffi.to_any) mapfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    of_any (D_jx.meth t "from" [| items; mapfn; this_arg |])

  let is_array ~arg () =
    let arg = Js.of_any arg in
    D_jx.bool (D_jx.meth t "isArray" [| arg |])

  let of' ~items () =
    let items = (E_jx.array Js.of_any) items in
    of_any (D_jx.meth t "of" [| items |])

  let concat ~arguments this =
    let arguments = (E_jx.array Js.of_any) arguments in
    of_any (D_jx.meth this "concat" [| arguments |])

  let copy_within ~target ?start ?end' this =
    let target = E_jx.int target in
    let start = (E_jx.undefined E_jx.int) start in
    let end' = (E_jx.undefined E_jx.int) end' in
    Js.of_any (D_jx.meth this "copyWithin" [| target; start; end' |])

  let entries this = Js.of_any (D_jx.meth this "entries" [||])

  let every ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.bool (D_jx.meth this "every" [| callbackfn; this_arg |])

  let fill ~value ?start ?end' this =
    let value = Js_ffi.to_any value in
    let start = (E_jx.undefined E_jx.int) start in
    let end' = (E_jx.undefined E_jx.int) end' in
    Js.of_any (D_jx.meth this "fill" [| value; start; end' |])

  let filter ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    of_any (D_jx.meth this "filter" [| callbackfn; this_arg |])

  let find ~predicate ?this_arg this =
    let predicate = Js_ffi.to_any predicate in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.unit (D_jx.meth this "find" [| predicate; this_arg |])

  let find_index ~predicate ?this_arg this =
    let predicate = Js_ffi.to_any predicate in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.int (D_jx.meth this "findIndex" [| predicate; this_arg |])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.unit (D_jx.meth this "forEach" [| callbackfn; this_arg |])

  let includes ~search_element ~from_index this =
    let search_element = Js.of_any search_element in
    let from_index = E_jx.int from_index in
    D_jx.bool (D_jx.meth this "includes" [| search_element; from_index |])

  let index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (E_jx.undefined E_jx.int) from_index in
    D_jx.int (D_jx.meth this "indexOf" [| search_element; from_index |])

  let join ~separator this =
    let separator = E_jx.string separator in
    D_jx.string (D_jx.meth this "join" [| separator |])

  let keys this = Js.of_any (D_jx.meth this "keys" [||])

  let last_index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (E_jx.undefined E_jx.int) from_index in
    D_jx.int (D_jx.meth this "lastIndexOf" [| search_element; from_index |])

  let map ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    of_any (D_jx.meth this "map" [| callbackfn; this_arg |])

  let pop this = Js.of_any (D_jx.meth this "pop" [||])

  let push ~items this =
    let items = (E_jx.array Js.of_any) items in
    D_jx.int (D_jx.meth this "push" [| items |])

  let reduce ~callbackfn ?initial_value this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let initial_value = (E_jx.undefined Js.of_any) initial_value in
    Js.of_any (D_jx.meth this "reduce" [| callbackfn; initial_value |])

  let reduce_right ~callbackfn ?initial_value this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let initial_value = (E_jx.undefined Js.of_any) initial_value in
    Js.of_any (D_jx.meth this "reduceRight" [| callbackfn; initial_value |])

  let reverse this = Js.of_any (D_jx.meth this "reverse" [||])
  let shift this = Js_ffi.to_any (D_jx.meth this "shift" [||])

  let slice ~start ~end' this =
    let start = E_jx.int start in
    let end' = E_jx.int end' in
    of_any (D_jx.meth this "slice" [| start; end' |])

  let some ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.bool (D_jx.meth this "some" [| callbackfn; this_arg |])

  let sort ~comparefn this =
    let comparefn = Js_ffi.to_any comparefn in
    D_jx.unit (D_jx.meth this "sort" [| comparefn |])

  let splice ~start ~delete_count ~items this =
    let start = E_jx.int start in
    let delete_count = E_jx.int delete_count in
    let items = (E_jx.array Js.of_any) items in
    of_any (D_jx.meth this "splice" [| start; delete_count; items |])

  let to_locale_time_string ?locales ?options this =
    let locales = (E_jx.undefined E_jx.string) locales in
    let options = (E_jx.undefined Js_ffi.to_any) options in
    D_jx.string (D_jx.meth this "toLocaleTimeString" [| locales; options |])

  let to_string this = D_jx.string (D_jx.meth this "toString" [||])

  let unshift ~items this =
    let items = (E_jx.array Js.of_any) items in
    D_jx.int (D_jx.meth this "unshift" [| items |])

  let values this = Js.of_any (D_jx.meth this "values" [||])
  let length this = D_jx.int (Js_ffi.get this "length")
  let set_length this x = Js_ffi.set this "length" (E_jx.int x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array} [Array] on \
   MDN}."]

and Typed_array : sig
  type t = [ `Typed_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray} \
     [TypedArray]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val from :
    source:Jx.any -> ?mapfn:Jx.any -> ?this_arg:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/from} \
     [from] on MDN}."]

  val of' : items:Jx.any array -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/of} \
     [of] on MDN}."]

  val buffer : t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/buffer} \
     [buffer] on MDN}."]

  val set_buffer : t -> Jx.any -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/buffer} \
     [buffer] on MDN}."]

  val byte_length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/byteLength} \
     [byteLength] on MDN}."]

  val set_byte_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/byteLength} \
     [byteLength] on MDN}."]

  val byte_offset : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/byteOffset} \
     [byteOffset] on MDN}."]

  val set_byte_offset : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/byteOffset} \
     [byteOffset] on MDN}."]

  val copy_within : target:Jx.any -> start:int -> ?end':int -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/copyWithin} \
     [copyWithin] on MDN}."]

  val entries : t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/entries} \
     [entries] on MDN}."]

  val every : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/every} \
     [every] on MDN}."]

  val fill : value:Jx.any -> ?start:int -> ?end':int -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/fill} \
     [fill] on MDN}."]

  val filter : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/filter} \
     [filter] on MDN}."]

  val find : predicate:Jx.any -> ?this_arg:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/find} \
     [find] on MDN}."]

  val find_index : predicate:Jx.any -> ?this_arg:Jx.any -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/findIndex} \
     [findIndex] on MDN}."]

  val for_each : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/forEach} \
     [forEach] on MDN}."]

  val includes : search_element:Jx.any -> from_index:int -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/includes} \
     [includes] on MDN}."]

  val index_of : search_element:Jx.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/indexOf} \
     [indexOf] on MDN}."]

  val join : separator:string -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/join} \
     [join] on MDN}."]

  val keys : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/keys} \
     [keys] on MDN}."]

  val last_index_of : search_element:Jx.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/lastIndexOf} \
     [lastIndexOf] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/length} \
     [length] on MDN}."]

  val map : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/map} \
     [map] on MDN}."]

  val reduce : callbackfn:Jx.any -> ?initial_value:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/reduce} \
     [reduce] on MDN}."]

  val reduce_right : callbackfn:Jx.any -> ?initial_value:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/reduceRight} \
     [reduceRight] on MDN}."]

  val reverse : t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/reverse} \
     [reverse] on MDN}."]

  val set : array:Array.t -> ?offset:int -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/set} \
     [set] on MDN}."]

  val set : typed_array:Jx.any -> ?offset:int -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/set} \
     [set] on MDN}."]

  val slice : start:int -> end':int -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/slice} \
     [slice] on MDN}."]

  val some : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/some} \
     [some] on MDN}."]

  val sort : comparefn:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/sort} \
     [sort] on MDN}."]

  val subarray : ?begin':int -> ?end':int -> t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/subarray} \
     [subarray] on MDN}."]

  val to_locale_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/toString} \
     [toString] on MDN}."]

  val values : t -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/values} \
     [values] on MDN}."]

  val bytes_per_element : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/BYTES_PER_ELEMENT} \
     [BYTES_PER_ELEMENT] on MDN}."]

  val set_bytes_per_element : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/BYTES_PER_ELEMENT} \
     [BYTES_PER_ELEMENT] on MDN}."]
end = struct
  type t = [ `Typed_array ] Jx.obj

  let t = Jx.expr "TypedArray"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let from ~source ?mapfn ?this_arg () =
    let source = Js_ffi.to_any source in
    let mapfn = (E_jx.undefined Js_ffi.to_any) mapfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    Js.of_any (D_jx.meth t "from" [| source; mapfn; this_arg |])

  let of' ~items () =
    let items = (E_jx.array Js.of_any) items in
    Js.of_any (D_jx.meth t "of" [| items |])

  let buffer this = Js.of_any (Js_ffi.get this "buffer")
  let set_buffer this x = Js_ffi.set this "buffer" (Js_ffi.to_any x)
  let byte_length this = D_jx.int (Js_ffi.get this "byteLength")
  let set_byte_length this x = Js_ffi.set this "byteLength" (E_jx.int x)
  let byte_offset this = D_jx.int (Js_ffi.get this "byteOffset")
  let set_byte_offset this x = Js_ffi.set this "byteOffset" (E_jx.int x)

  let copy_within ~target ~start ?end' this =
    let target = Js_ffi.to_any target in
    let start = E_jx.int start in
    let end' = (E_jx.undefined E_jx.int) end' in
    Js.of_any (D_jx.meth this "copyWithin" [| target; start; end' |])

  let entries this = Js.of_any (D_jx.meth this "entries" [||])

  let every ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.bool (D_jx.meth this "every" [| callbackfn; this_arg |])

  let fill ~value ?start ?end' this =
    let value = Js_ffi.to_any value in
    let start = (E_jx.undefined E_jx.int) start in
    let end' = (E_jx.undefined E_jx.int) end' in
    Js.of_any (D_jx.meth this "fill" [| value; start; end' |])

  let filter ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    Js.of_any (D_jx.meth this "filter" [| callbackfn; this_arg |])

  let find ~predicate ?this_arg this =
    let predicate = Js_ffi.to_any predicate in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.unit (D_jx.meth this "find" [| predicate; this_arg |])

  let find_index ~predicate ?this_arg this =
    let predicate = Js_ffi.to_any predicate in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.int (D_jx.meth this "findIndex" [| predicate; this_arg |])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.unit (D_jx.meth this "forEach" [| callbackfn; this_arg |])

  let includes ~search_element ~from_index this =
    let search_element = Js.of_any search_element in
    let from_index = E_jx.int from_index in
    D_jx.bool (D_jx.meth this "includes" [| search_element; from_index |])

  let index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (E_jx.undefined E_jx.int) from_index in
    D_jx.int (D_jx.meth this "indexOf" [| search_element; from_index |])

  let join ~separator this =
    let separator = E_jx.string separator in
    D_jx.string (D_jx.meth this "join" [| separator |])

  let keys this = Js.of_any (D_jx.meth this "keys" [||])

  let last_index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (E_jx.undefined E_jx.int) from_index in
    D_jx.int (D_jx.meth this "lastIndexOf" [| search_element; from_index |])

  let length this = D_jx.int (Js_ffi.get this "length")
  let set_length this x = Js_ffi.set this "length" (E_jx.int x)

  let map ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    Js.of_any (D_jx.meth this "map" [| callbackfn; this_arg |])

  let reduce ~callbackfn ?initial_value this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let initial_value = (E_jx.undefined Js.of_any) initial_value in
    Js.of_any (D_jx.meth this "reduce" [| callbackfn; initial_value |])

  let reduce_right ~callbackfn ?initial_value this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let initial_value = (E_jx.undefined Js.of_any) initial_value in
    Js.of_any (D_jx.meth this "reduceRight" [| callbackfn; initial_value |])

  let reverse this = Js.of_any (D_jx.meth this "reverse" [||])

  let set ~array ?offset this =
    let array = Array.to_any array in
    let offset = (E_jx.undefined E_jx.int) offset in
    D_jx.unit (D_jx.meth this "set" [| array; offset |])

  let set ~typed_array ?offset this =
    let typed_array = Js_ffi.to_any typed_array in
    let offset = (E_jx.undefined E_jx.int) offset in
    D_jx.unit (D_jx.meth this "set" [| typed_array; offset |])

  let slice ~start ~end' this =
    let start = E_jx.int start in
    let end' = E_jx.int end' in
    Js.of_any (D_jx.meth this "slice" [| start; end' |])

  let some ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.bool (D_jx.meth this "some" [| callbackfn; this_arg |])

  let sort ~comparefn this =
    let comparefn = Js_ffi.to_any comparefn in
    D_jx.unit (D_jx.meth this "sort" [| comparefn |])

  let subarray ?begin' ?end' this =
    let begin' = (E_jx.undefined E_jx.int) begin' in
    let end' = (E_jx.undefined E_jx.int) end' in
    Js.of_any (D_jx.meth this "subarray" [| begin'; end' |])

  let to_locale_string this = D_jx.string (D_jx.meth this "toLocaleString" [||])
  let to_string this = D_jx.string (D_jx.meth this "toString" [||])
  let values this = Js.of_any (D_jx.meth this "values" [||])
  let bytes_per_element this = D_jx.int (Js_ffi.get this "BYTES_PER_ELEMENT")

  let set_bytes_per_element this x =
    Js_ffi.set this "BYTES_PER_ELEMENT" (E_jx.int x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray} \
   [TypedArray] on MDN}."]

and Int8_array : sig
  type t = [ `Int8_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Int8Array} [Int8Array]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Int8_array ] Jx.obj

  let t = Jx.expr "Int8Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Int8Array} \
   [Int8Array] on MDN}."]

and Uint8_array : sig
  type t = [ `Uint8_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint8Array} \
     [Uint8Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint8_array ] Jx.obj

  let t = Jx.expr "Uint8Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint8Array} \
   [Uint8Array] on MDN}."]

and Uint8_clamped_array : sig
  type t = [ `Uint8_clamped_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint8ClampedArray} \
     [Uint8ClampedArray]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint8_clamped_array ] Jx.obj

  let t = Jx.expr "Uint8ClampedArray"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint8ClampedArray} \
   [Uint8ClampedArray] on MDN}."]

and Int16_array : sig
  type t = [ `Int16_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Int16Array} \
     [Int16Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Int16_array ] Jx.obj

  let t = Jx.expr "Int16Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Int16Array} \
   [Int16Array] on MDN}."]

and Uint16_array : sig
  type t = [ `Uint16_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint16Array} \
     [Uint16Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint16_array ] Jx.obj

  let t = Jx.expr "Uint16Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint16Array} \
   [Uint16Array] on MDN}."]

and Int32_array : sig
  type t = [ `Int32_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Int32Array} \
     [Int32Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Int32_array ] Jx.obj

  let t = Jx.expr "Int32Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Int32Array} \
   [Int32Array] on MDN}."]

and Uint32_array : sig
  type t = [ `Uint32_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint32Array} \
     [Uint32Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint32_array ] Jx.obj

  let t = Jx.expr "Uint32Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint32Array} \
   [Uint32Array] on MDN}."]

and Float32_array : sig
  type t = [ `Float32_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Float32Array} \
     [Float32Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Float32_array ] Jx.obj

  let t = Jx.expr "Float32Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Float32Array} \
   [Float32Array] on MDN}."]

and Float64_array : sig
  type t = [ `Float64_array ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Float64Array} \
     [Float64Array]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : unit -> t
  val make : arg_list:Jx.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Jx.any -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Float64_array ] Jx.obj

  let t = Jx.expr "Float64Array"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let make () = Jx.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (E_jx.array Js.of_any) arg_list in
    Jx.obj_new t [| arg_list |]

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Jx.obj_new t [| array |]

  let make ~obj () =
    let obj = Js_ffi.to_any obj in
    Jx.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Float64Array} \
   [Float64Array] on MDN}."]

and Map : sig
  type t = [ `Map ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Map} [Map]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?iterable:Jx.any -> unit -> t

  val clear : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/clear} \
     [clear] on MDN}."]

  val delete : key:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/delete} \
     [delete] on MDN}."]

  val entries : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/entries} \
     [entries] on MDN}."]

  val for_each : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/forEach} \
     [forEach] on MDN}."]

  val get : key:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/get} [get] \
     on MDN}."]

  val has : key:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/has} [has] \
     on MDN}."]

  val keys : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/keys} [keys] \
     on MDN}."]

  val set : key:Jx.any -> value:Jx.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/set} [set] \
     on MDN}."]

  val size : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/size} [size] \
     on MDN}."]

  val set_size : t -> int -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/size} [size] \
     on MDN}."]

  val values : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/values} \
     [values] on MDN}."]
end = struct
  type t = [ `Map ] Jx.obj

  let t = Jx.expr "Map"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?iterable () =
    let iterable = (E_jx.undefined Js_ffi.to_any) iterable in
    Jx.obj_new t [| iterable |]

  let clear this = D_jx.unit (D_jx.meth this "clear" [||])

  let delete ~key this =
    let key = Js.of_any key in
    D_jx.bool (D_jx.meth this "delete" [| key |])

  let entries this = Js.of_any (D_jx.meth this "entries" [||])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.unit (D_jx.meth this "forEach" [| callbackfn; this_arg |])

  let get ~key this =
    let key = Js.of_any key in
    D_jx.unit (D_jx.meth this "get" [| key |])

  let has ~key this =
    let key = Js.of_any key in
    D_jx.bool (D_jx.meth this "has" [| key |])

  let keys this = Js.of_any (D_jx.meth this "keys" [||])

  let set ~key ~value this =
    let key = Js.of_any key in
    let value = Js.of_any value in
    of_any (D_jx.meth this "set" [| key; value |])

  let size this = D_jx.int (Js_ffi.get this "size")
  let set_size this x = Js_ffi.set this "size" (E_jx.int x)
  let values this = Js.of_any (D_jx.meth this "values" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map} [Map] on MDN}."]

and Set : sig
  type t = [ `Set ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Set} [Set]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?input:Iterator.t -> unit -> t

  val add : value:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/add} [add] \
     on MDN}."]

  val clear : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/clear} \
     [clear] on MDN}."]

  val delete : value:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/delete} \
     [delete] on MDN}."]

  val entries : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/entries} \
     [entries] on MDN}."]

  val for_each : callbackfn:Jx.any -> ?this_arg:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/forEach} \
     [forEach] on MDN}."]

  val has : value:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/has} [has] \
     on MDN}."]

  val keys : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/keys} [keys] \
     on MDN}."]

  val size : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/size} [size] \
     on MDN}."]

  val set_size : t -> int -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/size} [size] \
     on MDN}."]

  val values : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/values} \
     [values] on MDN}."]
end = struct
  type t = [ `Set ] Jx.obj

  let t = Jx.expr "Set"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?input () =
    let input = (E_jx.undefined Iterator.to_any) input in
    Jx.obj_new t [| input |]

  let add ~value this =
    let value = Js.of_any value in
    Js.of_any (D_jx.meth this "add" [| value |])

  let clear this = D_jx.unit (D_jx.meth this "clear" [||])

  let delete ~value this =
    let value = Js.of_any value in
    D_jx.bool (D_jx.meth this "delete" [| value |])

  let entries this = Js.of_any (D_jx.meth this "entries" [||])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js_ffi.to_any callbackfn in
    let this_arg = (E_jx.undefined Js.of_any) this_arg in
    D_jx.unit (D_jx.meth this "forEach" [| callbackfn; this_arg |])

  let has ~value this =
    let value = Js.of_any value in
    D_jx.bool (D_jx.meth this "has" [| value |])

  let keys this = Js.of_any (D_jx.meth this "keys" [||])
  let size this = D_jx.int (Js_ffi.get this "size")
  let set_size this x = Js_ffi.set this "size" (E_jx.int x)
  let values this = Js.of_any (D_jx.meth this "values" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set} [Set] on MDN}."]

and Weak_map : sig
  type t = [ `Weak_map ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WeakMap} [WeakMap]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?iterable:Jx.any -> unit -> t

  val delete : key:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/delete} \
     [delete] on MDN}."]

  val get : key:Jx.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/get} \
     [get] on MDN}."]

  val has : key:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/has} \
     [has] on MDN}."]

  val set : key:Jx.any -> value:Jx.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/set} \
     [set] on MDN}."]
end = struct
  type t = [ `Weak_map ] Jx.obj

  let t = Jx.expr "WeakMap"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?iterable () =
    let iterable = (E_jx.undefined Js_ffi.to_any) iterable in
    Jx.obj_new t [| iterable |]

  let delete ~key this =
    let key = Js.of_any key in
    D_jx.bool (D_jx.meth this "delete" [| key |])

  let get ~key this =
    let key = Js.of_any key in
    D_jx.unit (D_jx.meth this "get" [| key |])

  let has ~key this =
    let key = Js.of_any key in
    D_jx.bool (D_jx.meth this "has" [| key |])

  let set ~key ~value this =
    let key = Js.of_any key in
    let value = Js.of_any value in
    of_any (D_jx.meth this "set" [| key; value |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap} [WeakMap] \
   on MDN}."]

and Weak_set : sig
  type t = [ `Weak_set ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WeakSet} [WeakSet]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : ?iterable:Jx.any -> unit -> t

  val add : value:Jx.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet/add} \
     [add] on MDN}."]

  val delete : value:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet/delete} \
     [delete] on MDN}."]

  val has : value:Jx.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet/has} \
     [has] on MDN}."]
end = struct
  type t = [ `Weak_set ] Jx.obj

  let t = Jx.expr "WeakSet"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ?iterable () =
    let iterable = (E_jx.undefined Js_ffi.to_any) iterable in
    Jx.obj_new t [| iterable |]

  let add ~value this =
    let value = Js.of_any value in
    of_any (D_jx.meth this "add" [| value |])

  let delete ~value this =
    let value = Js.of_any value in
    D_jx.bool (D_jx.meth this "delete" [| value |])

  let has ~value this =
    let value = Js.of_any value in
    D_jx.bool (D_jx.meth this "has" [| value |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet} [WeakSet] \
   on MDN}."]

and Array_buffer : sig
  type t = [ `Array_buffer ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer} \
     [ArrayBuffer]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : length:int -> unit -> t

  val is_view : arg:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer/isView} \
     [isView] on MDN}."]

  val byte_length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer/byteLength} \
     [byteLength] on MDN}."]

  val set_byte_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer/byteLength} \
     [byteLength] on MDN}."]
end = struct
  type t = [ `Array_buffer ] Jx.obj

  let t = Jx.expr "ArrayBuffer"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let is_view ~arg () =
    let arg = Js.of_any arg in
    D_jx.bool (D_jx.meth t "isView" [| arg |])

  let byte_length this = D_jx.int (Js_ffi.get this "byteLength")
  let set_byte_length this x = Js_ffi.set this "byteLength" (E_jx.int x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer} \
   [ArrayBuffer] on MDN}."]

and Shared_array_buffer : sig
  type t = [ `Shared_array_buffer ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer} \
     [SharedArrayBuffer]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : length:int -> unit -> t

  val byte_length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer/byteLength} \
     [byteLength] on MDN}."]

  val set_byte_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer/byteLength} \
     [byteLength] on MDN}."]

  val slice : start:int -> end':int -> t -> t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer/slice} \
     [slice] on MDN}."]
end = struct
  type t = [ `Shared_array_buffer ] Jx.obj

  let t = Jx.expr "SharedArrayBuffer"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ~length () =
    let length = E_jx.int length in
    Jx.obj_new t [| length |]

  let byte_length this = D_jx.int (Js_ffi.get this "byteLength")
  let set_byte_length this x = Js_ffi.set this "byteLength" (E_jx.int x)

  let slice ~start ~end' this =
    let start = E_jx.int start in
    let end' = E_jx.int end' in
    of_any (D_jx.meth this "slice" [| start; end' |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer} \
   [SharedArrayBuffer] on MDN}."]

and Data_view : sig
  type t = [ `Data_view ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView} [DataView]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Jx.any -> ?byte_offset:int -> ?byte_length:int -> unit -> t

  val buffer : t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DataView/buffer} \
     [buffer] on MDN}."]

  val set_buffer : t -> Jx.any -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DataView/buffer} \
     [buffer] on MDN}."]

  val byte_length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/byteLength} \
     [byteLength] on MDN}."]

  val set_byte_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/byteLength} \
     [byteLength] on MDN}."]

  val byte_offset : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/byteOffset} \
     [byteOffset] on MDN}."]

  val set_byte_offset : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/byteOffset} \
     [byteOffset] on MDN}."]

  val get_float32 : byte_offset:float -> ?little_endian:bool -> t -> float
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/getFloat32} \
     [getFloat32] on MDN}."]

  val get_float64 : byte_offset:float -> ?little_endian:bool -> t -> float
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/getFloat64} \
     [getFloat64] on MDN}."]

  val get_int16 : byte_offset:int -> ?little_endian:bool -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/getInt16} \
     [getInt16] on MDN}."]

  val get_int32 : byte_offset:int -> ?little_endian:bool -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/getInt32} \
     [getInt32] on MDN}."]

  val get_uint16 : byte_offset:int -> ?little_endian:bool -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/getUint16} \
     [getUint16] on MDN}."]

  val get_uint32 : byte_offset:int -> ?little_endian:bool -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/getUint32} \
     [getUint32] on MDN}."]

  val set_float32 :
    byte_offset:float -> value:float -> ?little_endian:bool -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/setFloat32} \
     [setFloat32] on MDN}."]

  val set_float64 :
    byte_offset:float -> value:float -> ?little_endian:bool -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/setFloat64} \
     [setFloat64] on MDN}."]

  val set_int16 :
    byte_offset:int -> value:int -> ?little_endian:bool -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/setInt16} \
     [setInt16] on MDN}."]

  val set_int32 :
    byte_offset:int -> value:int -> ?little_endian:bool -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/setInt32} \
     [setInt32] on MDN}."]

  val set_uint16 :
    byte_offset:int -> value:int -> ?little_endian:bool -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/setUint16} \
     [setUint16] on MDN}."]

  val set_uint32 :
    byte_offset:int -> value:int -> ?little_endian:bool -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView/setUint32} \
     [setUint32] on MDN}."]
end = struct
  type t = [ `Data_view ] Jx.obj

  let t = Jx.expr "DataView"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js_ffi.to_any buffer in
    let byte_offset = (E_jx.undefined E_jx.int) byte_offset in
    let byte_length = (E_jx.undefined E_jx.int) byte_length in
    Jx.obj_new t [| buffer; byte_offset; byte_length |]

  let buffer this = Js.of_any (Js_ffi.get this "buffer")
  let set_buffer this x = Js_ffi.set this "buffer" (Js_ffi.to_any x)
  let byte_length this = D_jx.int (Js_ffi.get this "byteLength")
  let set_byte_length this x = Js_ffi.set this "byteLength" (E_jx.int x)
  let byte_offset this = D_jx.int (Js_ffi.get this "byteOffset")
  let set_byte_offset this x = Js_ffi.set this "byteOffset" (E_jx.int x)

  let get_float32 ~byte_offset ?little_endian this =
    let byte_offset = E_jx.float byte_offset in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.float (D_jx.meth this "getFloat32" [| byte_offset; little_endian |])

  let get_float64 ~byte_offset ?little_endian this =
    let byte_offset = E_jx.float byte_offset in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.float (D_jx.meth this "getFloat64" [| byte_offset; little_endian |])

  let get_int16 ~byte_offset ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.int (D_jx.meth this "getInt16" [| byte_offset; little_endian |])

  let get_int32 ~byte_offset ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.int (D_jx.meth this "getInt32" [| byte_offset; little_endian |])

  let get_uint16 ~byte_offset ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.int (D_jx.meth this "getUint16" [| byte_offset; little_endian |])

  let get_uint32 ~byte_offset ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.int (D_jx.meth this "getUint32" [| byte_offset; little_endian |])

  let set_float32 ~byte_offset ~value ?little_endian this =
    let byte_offset = E_jx.float byte_offset in
    let value = E_jx.float value in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.unit
      (D_jx.meth this "setFloat32" [| byte_offset; value; little_endian |])

  let set_float64 ~byte_offset ~value ?little_endian this =
    let byte_offset = E_jx.float byte_offset in
    let value = E_jx.float value in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.unit
      (D_jx.meth this "setFloat64" [| byte_offset; value; little_endian |])

  let set_int16 ~byte_offset ~value ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let value = E_jx.int value in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.unit (D_jx.meth this "setInt16" [| byte_offset; value; little_endian |])

  let set_int32 ~byte_offset ~value ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let value = E_jx.int value in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.unit (D_jx.meth this "setInt32" [| byte_offset; value; little_endian |])

  let set_uint16 ~byte_offset ~value ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let value = E_jx.int value in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.unit
      (D_jx.meth this "setUint16" [| byte_offset; value; little_endian |])

  let set_uint32 ~byte_offset ~value ?little_endian this =
    let byte_offset = E_jx.int byte_offset in
    let value = E_jx.int value in
    let little_endian = (E_jx.undefined E_jx.bool) little_endian in
    D_jx.unit
      (D_jx.meth this "setUint32" [| byte_offset; value; little_endian |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DataView} \
   [DataView] on MDN}."]

and Json : sig
  type t = [ `Json ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/JSON} [JSON]} interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val parse : text:string -> ?reviver:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/JSON/parse} \
     [parse] on MDN}."]

  val stringify :
    value:Jx.any -> ?replacer:Jx.any -> ?space:Jx.any -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/JSON/stringify} \
     [stringify] on MDN}."]
end = struct
  type t = [ `Json ] Jx.obj

  let t = Jx.expr "JSON"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let parse ~text ?reviver () =
    let text = E_jx.string text in
    let reviver = (E_jx.undefined E_jx.obj) reviver in
    D_jx.obj (D_jx.meth t "parse" [| text; reviver |])

  let stringify ~value ?replacer ?space this =
    let value = E_jx.obj value in
    let replacer = (E_jx.undefined E_jx.obj) replacer in
    let space = (E_jx.undefined E_jx.obj) space in
    D_jx.string (D_jx.meth this "stringify" [| value; replacer; space |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/JSON} [JSON] on \
   MDN}."]

and Iterator : sig
  type t = [ `Iterator ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Iterator} [Iterator]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Iterator ] Jx.obj

  let t = Jx.expr "Iterator"
  let to_any = E_jx.obj
  let of_any = D_jx.obj
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Iterator} \
   [Iterator] on MDN}."]

and Promise : sig
  type t = [ `Promise ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Promise} [Promise]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val make : executor:Jx.any -> unit -> t

  val all : iterable:Jx.any -> unit -> Jx.any Jx.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/all} \
     [all] on MDN}."]

  val race : iterable:Jx.any -> unit -> Jx.any Jx.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/race} \
     [race] on MDN}."]

  val reject : r:Jx.any -> unit -> Jx.any Jx.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/reject} \
     [reject] on MDN}."]

  val resolve : x:Jx.any -> unit -> Jx.any Jx.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/resolve} \
     [resolve] on MDN}."]

  val catch : on_rejected:Jx.any -> t -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/catch} \
     [catch] on MDN}."]

  val then' : on_fulfilled:Jx.any -> on_reject:Jx.any -> t -> Jx.any Jx.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/then} \
     [then] on MDN}."]
end = struct
  type t = [ `Promise ] Jx.obj

  let t = Jx.expr "Promise"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let make ~executor () =
    let executor = Js_ffi.to_any executor in
    Jx.obj_new t [| executor |]

  let all ~iterable () =
    let iterable = Js_ffi.to_any iterable in
    D_jx.meth t "all" [| iterable |]

  let race ~iterable () =
    let iterable = Js_ffi.to_any iterable in
    D_jx.meth t "race" [| iterable |]

  let reject ~r () =
    let r = Js_ffi.to_any r in
    D_jx.meth t "reject" [| r |]

  let resolve ~x () =
    let x = Js_ffi.to_any x in
    D_jx.meth t "resolve" [| x |]

  let catch ~on_rejected this =
    let on_rejected = Js_ffi.to_any on_rejected in
    Js.of_any (D_jx.meth this "catch" [| on_rejected |])

  let then' ~on_fulfilled ~on_reject this =
    let on_fulfilled = Js_ffi.to_any on_fulfilled in
    let on_reject = Js_ffi.to_any on_reject in
    D_jx.meth this "then" [| on_fulfilled; on_reject |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise} [Promise] \
   on MDN}."]

and Reflect : sig
  type t = [ `Reflect ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect} [Reflect]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val apply :
    target:Jx.any ->
    this_argument:Jx.any ->
    argument_list:Jx.any array ->
    unit ->
    Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/apply} \
     [apply] on MDN}."]

  val define_property :
    target:Jx.any ->
    property_key:string ->
    argument_list:Jx.any array ->
    unit ->
    Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/defineProperty} \
     [defineProperty] on MDN}."]

  val delete_property : target:Jx.any -> property_key:string -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/deleteProperty} \
     [deleteProperty] on MDN}."]

  val get :
    target:Jx.any -> property_key:string -> ?reciever:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/get} \
     [get] on MDN}."]

  val get_own_property_descriptor :
    target:Jx.any -> property_key:string -> unit -> Property_descriptor.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/getOwnPropertyDescriptor} \
     [getOwnPropertyDescriptor] on MDN}."]

  val get_prototype_of : target:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/getPrototypeOf} \
     [getPrototypeOf] on MDN}."]

  val has : target:Jx.any -> property_key:string -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/has} \
     [has] on MDN}."]

  val is_extensible : target:Jx.any -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/isExtensible} \
     [isExtensible] on MDN}."]

  val own_keys : target:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/ownKeys} \
     [ownKeys] on MDN}."]

  val prevent_extensions : target:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/preventExtensions} \
     [preventExtensions] on MDN}."]

  val set :
    target:Jx.any ->
    property_key:string ->
    v:Jx.any ->
    ?reciever:Jx.any ->
    unit ->
    Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/set} \
     [set] on MDN}."]

  val set_prototype_of : target:Jx.any -> proto:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/setPrototypeOf} \
     [setPrototypeOf] on MDN}."]
end = struct
  type t = [ `Reflect ] Jx.obj

  let t = Jx.expr "Reflect"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let apply ~target ~this_argument ~argument_list () =
    let target = Js_ffi.to_any target in
    let this_argument = Js.of_any this_argument in
    let argument_list = (E_jx.array Js.of_any) argument_list in
    Js.of_any (D_jx.meth t "apply" [| target; this_argument; argument_list |])

  let define_property ~target ~property_key ~argument_list () =
    let target = Js_ffi.to_any target in
    let property_key = E_jx.string property_key in
    let argument_list = (E_jx.array Js.of_any) argument_list in
    Js.of_any
      (D_jx.meth t "defineProperty" [| target; property_key; argument_list |])

  let delete_property ~target ~property_key () =
    let target = Js_ffi.to_any target in
    let property_key = E_jx.string property_key in
    Js.of_any (D_jx.meth t "deleteProperty" [| target; property_key |])

  let get ~target ~property_key ?reciever () =
    let target = Js_ffi.to_any target in
    let property_key = E_jx.string property_key in
    let reciever = (E_jx.undefined Js_ffi.to_any) reciever in
    Js.of_any (D_jx.meth t "get" [| target; property_key; reciever |])

  let get_own_property_descriptor ~target ~property_key () =
    let target = Js_ffi.to_any target in
    let property_key = E_jx.string property_key in
    Property_descriptor.of_any
      (D_jx.meth t "getOwnPropertyDescriptor" [| target; property_key |])

  let get_prototype_of ~target () =
    let target = Js_ffi.to_any target in
    Js.of_any (D_jx.meth t "getPrototypeOf" [| target |])

  let has ~target ~property_key () =
    let target = Js_ffi.to_any target in
    let property_key = E_jx.string property_key in
    D_jx.bool (D_jx.meth t "has" [| target; property_key |])

  let is_extensible ~target () =
    let target = Js_ffi.to_any target in
    D_jx.bool (D_jx.meth t "isExtensible" [| target |])

  let own_keys ~target () =
    let target = Js_ffi.to_any target in
    Js.of_any (D_jx.meth t "ownKeys" [| target |])

  let prevent_extensions ~target () =
    let target = Js_ffi.to_any target in
    Js.of_any (D_jx.meth t "preventExtensions" [| target |])

  let set ~target ~property_key ~v ?reciever () =
    let target = Js_ffi.to_any target in
    let property_key = E_jx.string property_key in
    let v = Js.of_any v in
    let reciever = (E_jx.undefined Js_ffi.to_any) reciever in
    Js.of_any (D_jx.meth t "set" [| target; property_key; v; reciever |])

  let set_prototype_of ~target ~proto () =
    let target = Js_ffi.to_any target in
    let proto = Js_ffi.to_any proto in
    Js.of_any (D_jx.meth t "setPrototypeOf" [| target; proto |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect} [Reflect] \
   on MDN}."]

and Proxy : sig
  type t = [ `Proxy ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Proxy} [Proxy]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val with_target_and_handler : target:Jx.any -> handler:Jx.any -> unit -> t

  val revocable : target:Jx.any -> handler:Jx.any -> unit -> Jx.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Proxy/revocable} \
     [revocable] on MDN}."]
end = struct
  type t = [ `Proxy ] Jx.obj

  let t = Jx.expr "Proxy"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let with_target_and_handler ~target ~handler () =
    let target = Js_ffi.to_any target in
    let handler = Js_ffi.to_any handler in
    Jx.obj_new t [| target; handler |]

  let revocable ~target ~handler () =
    let target = Js_ffi.to_any target in
    let handler = Js_ffi.to_any handler in
    Js.of_any (D_jx.meth t "revocable" [| target; handler |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Proxy} [Proxy] on \
   MDN}."]

and Intl : sig
  val collator : Collator.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Intl/Collator} \
     [Collator] on MDN}."]

  val date_time_format : Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Intl/DateTimeFormat} \
     [DateTimeFormat] on MDN}."]

  val number_format : Jx.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Intl/NumberFormat} \
     [NumberFormat] on MDN}."]

  val get_canonical_locales : locales:string array -> unit -> string array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Intl/getCanonicalLocales} \
     [getCanonicalLocales] on MDN}."]
end = struct
  let t = Js_ffi.global "Intl"
  let collator = Collator.of_any (Js_ffi.get t "Collator")
  let date_time_format = Js.of_any (Js_ffi.get t "DateTimeFormat")
  let number_format = Js.of_any (Js_ffi.get t "NumberFormat")

  let get_canonical_locales ~locales () =
    let locales = (E_jx.array E_jx.string) locales in
    (D_jx.array D_jx.string) (D_jx.meth t "getCanonicalLocales" [| locales |])
end

and Collator : sig
  type t = [ `Collator ] Jx.obj
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Collator} [Collator]} \
     interface."]

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val with_locales_and_options :
    ?locales:[< `String | `Sequence ] Jx.obj ->
    ?options:Collator_init.t ->
    unit ->
    t

  val supported_locales_of :
    locales:[< `String | `Sequence ] Jx.obj ->
    ?options:Supported_locales_options.t ->
    unit ->
    string array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Collator/supportedLocalesOf} \
     [supportedLocalesOf] on MDN}."]

  val compare : string1:string -> string2:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Collator/compare} \
     [compare] on MDN}."]

  val resolved_options : t -> Collator_options.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Collator/resolvedOptions} \
     [resolvedOptions] on MDN}."]
end = struct
  type t = [ `Collator ] Jx.obj

  let t = Jx.expr "Collator"
  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let with_locales_and_options ?locales ?options () =
    let locales = (E_jx.undefined E_jx.obj) locales in
    let options = (E_jx.undefined Collator_init.to_any) options in
    Jx.obj_new t [| locales; options |]

  let supported_locales_of ~locales ?options () =
    let locales = E_jx.obj locales in
    let options = (E_jx.undefined Supported_locales_options.to_any) options in
    (D_jx.array D_jx.string)
      (D_jx.meth t "supportedLocalesOf" [| locales; options |])

  let compare ~string1 ~string2 this =
    let string1 = E_jx.string string1 in
    let string2 = E_jx.string string2 in
    D_jx.bool (D_jx.meth this "compare" [| string1; string2 |])

  let resolved_options this =
    Collator_options.of_any (D_jx.meth this "resolvedOptions" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Collator} \
   [Collator] on MDN}."]

and Collator_options : sig
  type t [@@ocaml.doc "The type for the [CollatorOptions] dictionary."]

  val make :
    ?locale:string ->
    ?usage:Collator_usage.t ->
    ?sensitivity:Collator_sensitivity.t ->
    ?ignore_punctuation:bool ->
    ?collation:string ->
    ?numeric:bool ->
    ?case_first:Collator_case.t ->
    unit ->
    t

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val locale : t -> string option
  val usage : t -> Collator_usage.t option
  val sensitivity : t -> Collator_sensitivity.t option
  val ignore_punctuation : t -> bool option
  val collation : t -> string option
  val numeric : t -> bool option
  val case_first : t -> Collator_case.t option
end = struct
  type t = Jx.any

  let make ?locale ?usage ?sensitivity ?ignore_punctuation ?collation ?numeric
      ?case_first () =
    let locale = (E_jx.nullable E_jx.string) locale in
    let usage = (E_jx.nullable Collator_usage.to_any) usage in
    let sensitivity = (E_jx.nullable Collator_sensitivity.to_any) sensitivity in
    let ignore_punctuation = (E_jx.nullable E_jx.bool) ignore_punctuation in
    let collation = (E_jx.nullable E_jx.string) collation in
    let numeric = (E_jx.nullable E_jx.bool) numeric in
    let case_first = (E_jx.nullable Collator_case.to_any) case_first in
    Jx.obj
      [|
        ("locale", locale);
        ("usage", usage);
        ("sensitivity", sensitivity);
        ("ignorePunctuation", ignore_punctuation);
        ("collation", collation);
        ("numeric", numeric);
        ("caseFirst", case_first);
      |]

  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let locale this = (D_jx.nullable D_jx.string) (Js_ffi.get this "locale")

  let usage this =
    (D_jx.nullable Collator_usage.of_any) (Js_ffi.get this "usage")

  let sensitivity this =
    (D_jx.nullable Collator_sensitivity.of_any) (Js_ffi.get this "sensitivity")

  let ignore_punctuation this =
    (D_jx.nullable D_jx.bool) (Js_ffi.get this "ignorePunctuation")

  let collation this = (D_jx.nullable D_jx.string) (Js_ffi.get this "collation")
  let numeric this = (D_jx.nullable D_jx.bool) (Js_ffi.get this "numeric")

  let case_first this =
    (D_jx.nullable Collator_case.of_any) (Js_ffi.get this "caseFirst")
end

and Collator_sensitivity : sig
  type t

  val to_string : t -> string
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val base : t [@@ocaml.doc "The [base] enum value."]

  val accent : t [@@ocaml.doc "The [accent] enum value."]

  val case : t [@@ocaml.doc "The [case] enum value."]

  val variant : t [@@ocaml.doc "The [variant] enum value."]
end = struct
  type t = Jx.any

  let to_string = D_jx.string
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let base = E_jx.string "base"
  let accent = E_jx.string "accent"
  let case = E_jx.string "case"
  let variant = E_jx.string "variant"
end

and Collator_case : sig
  type t

  val to_string : t -> string
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val upper : t [@@ocaml.doc "The [upper] enum value."]

  val lowe : t [@@ocaml.doc "The [lowe] enum value."]

  val false' : t [@@ocaml.doc "The [false] enum value."]
end = struct
  type t = Jx.any

  let to_string = D_jx.string
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let upper = E_jx.string "upper"
  let lowe = E_jx.string "lowe"
  let false' = E_jx.string "false"
end

and Collator_locale_matcher : sig
  type t

  val to_string : t -> string
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val lookup : t [@@ocaml.doc "The [lookup] enum value."]

  val best_fit : t [@@ocaml.doc "The [best fit] enum value."]
end = struct
  type t = Jx.any

  let to_string = D_jx.string
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let lookup = E_jx.string "lookup"
  let best_fit = E_jx.string "best fit"
end

and Collator_usage : sig
  type t

  val to_string : t -> string
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val sort : t [@@ocaml.doc "The [sort] enum value."]

  val search : t [@@ocaml.doc "The [search] enum value."]
end = struct
  type t = Jx.any

  let to_string = D_jx.string
  let to_any = E_jx.obj
  let of_any = D_jx.obj
  let sort = E_jx.string "sort"
  let search = E_jx.string "search"
end

and Collator_init : sig
  type t [@@ocaml.doc "The type for the [CollatorInit] dictionary."]

  val make :
    ?usage:Collator_usage.t ->
    ?locale_matcher:Collator_locale_matcher.t ->
    ?collation:string ->
    ?numeric:bool ->
    ?case_first:Collator_case.t ->
    ?sensitivity:Collator_sensitivity.t ->
    ?ignore_punctuation:bool ->
    unit ->
    t

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val usage : t -> Collator_usage.t option
  val locale_matcher : t -> Collator_locale_matcher.t option
  val collation : t -> string option
  val numeric : t -> bool option
  val case_first : t -> Collator_case.t option
  val sensitivity : t -> Collator_sensitivity.t option
  val ignore_punctuation : t -> bool option
end = struct
  type t = Jx.any

  let make ?usage ?locale_matcher ?collation ?numeric ?case_first ?sensitivity
      ?ignore_punctuation () =
    let usage = (E_jx.nullable Collator_usage.to_any) usage in
    let locale_matcher =
      (E_jx.nullable Collator_locale_matcher.to_any) locale_matcher
    in
    let collation = (E_jx.nullable E_jx.string) collation in
    let numeric = (E_jx.nullable E_jx.bool) numeric in
    let case_first = (E_jx.nullable Collator_case.to_any) case_first in
    let sensitivity = (E_jx.nullable Collator_sensitivity.to_any) sensitivity in
    let ignore_punctuation = (E_jx.nullable E_jx.bool) ignore_punctuation in
    Jx.obj
      [|
        ("usage", usage);
        ("localeMatcher", locale_matcher);
        ("collation", collation);
        ("numeric", numeric);
        ("caseFirst", case_first);
        ("sensitivity", sensitivity);
        ("ignorePunctuation", ignore_punctuation);
      |]

  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let usage this =
    (D_jx.nullable Collator_usage.of_any) (Js_ffi.get this "usage")

  let locale_matcher this =
    (D_jx.nullable Collator_locale_matcher.of_any)
      (Js_ffi.get this "localeMatcher")

  let collation this = (D_jx.nullable D_jx.string) (Js_ffi.get this "collation")
  let numeric this = (D_jx.nullable D_jx.bool) (Js_ffi.get this "numeric")

  let case_first this =
    (D_jx.nullable Collator_case.of_any) (Js_ffi.get this "caseFirst")

  let sensitivity this =
    (D_jx.nullable Collator_sensitivity.of_any) (Js_ffi.get this "sensitivity")

  let ignore_punctuation this =
    (D_jx.nullable D_jx.bool) (Js_ffi.get this "ignorePunctuation")
end

and Supported_locales_options : sig
  type t [@@ocaml.doc "The type for the [SupportedLocalesOptions] dictionary."]

  val make : ?locale_matcher:Collator_locale_matcher.t -> unit -> t
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val locale_matcher : t -> Collator_locale_matcher.t option
end = struct
  type t = Jx.any

  let make ?locale_matcher () =
    let locale_matcher =
      (E_jx.nullable Collator_locale_matcher.to_any) locale_matcher
    in
    Jx.obj [| ("localeMatcher", locale_matcher) |]

  let to_any = E_jx.obj
  let of_any = D_jx.obj

  let locale_matcher this =
    (D_jx.nullable Collator_locale_matcher.of_any)
      (Js_ffi.get this "localeMatcher")
end
