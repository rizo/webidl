module rec Window : sig
  type t = [ `Window ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Window} [Window]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

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

  val eval : value:string -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Window/eval} \
     [eval] on MDN}."]
end = struct
  type t = [ `Window ] Js.t

  let t = Js.raw "Window"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let decode_uri ~encoded_uri () =
    let encoded_uri = Js.Any.of_string encoded_uri in
    Js.Any.to_string (Js.meth_call t "decodeURI" [| encoded_uri |])

  let decode_uri_component ~encoded_uri_component () =
    let encoded_uri_component = Js.Any.of_string encoded_uri_component in
    Js.Any.to_string
      (Js.meth_call t "decodeURIComponent" [| encoded_uri_component |])

  let encode_uri ~uri () =
    let uri = Js.Any.of_string uri in
    Js.Any.to_string (Js.meth_call t "encodeURI" [| uri |])

  let encode_uri_component ~uri_component () =
    let uri_component = Js.Any.of_string uri_component in
    Js.Any.to_string (Js.meth_call t "encodeURIComponent" [| uri_component |])

  let escape ~value () =
    let value = Js.Any.of_string value in
    Js.Any.to_string (Js.meth_call t "escape" [| value |])

  let unescape ~value () =
    let value = Js.Any.of_string value in
    Js.Any.to_string (Js.meth_call t "unescape" [| value |])

  let eval ~value () =
    let value = Js.Any.of_string value in
    Js.of_any (Js.meth_call t "eval" [| value |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Window} [Window] \
   on MDN}."]

and Getter : sig
  type t = Js.any

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Getter

and Setter : sig
  type t = Js.any -> unit

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Setter

and Property_descriptor : sig
  type t [@@ocaml.doc "The type for the [PropertyDescriptor] dictionary."]

  val make :
    ?configurable:bool ->
    ?enumerable:bool ->
    ?value:Js.any ->
    ?writable:bool option ->
    ?get:Getter.t option ->
    ?set:Setter.t option ->
    unit ->
    t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val configurable : t -> bool option
  val enumerable : t -> bool option
  val value : t -> Js.any option
  val writable : t -> bool option option
  val get : t -> Getter.t option option
  val set : t -> Setter.t option option
end = struct
  type t = Js.any

  let make ?configurable ?enumerable ?value ?writable ?get ?set () =
    let configurable =
      (Js.Any.nullable_of_option Js.Any.of_bool) configurable
    in
    let enumerable = (Js.Any.nullable_of_option Js.Any.of_bool) enumerable in
    let value = (Js.Any.nullable_of_option Js.of_any) value in
    let writable =
      (Js.Any.nullable_of_option (Js.Any.nullable_of_option Js.Any.of_bool))
        writable
    in
    let get =
      (Js.Any.nullable_of_option (Js.Any.nullable_of_option Getter.to_any)) get
    in
    let set =
      (Js.Any.nullable_of_option (Js.Any.nullable_of_option Setter.to_any)) set
    in
    Js.obj
      [|
        ("configurable", configurable);
        ("enumerable", enumerable);
        ("value", value);
        ("writable", writable);
        ("get", get);
        ("set", set);
      |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let configurable this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "configurable")

  let enumerable this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "enumerable")

  let value this = (Js.Any.nullable_to_option Js.to_any) (Js.get this "value")

  let writable this =
    (Js.Any.nullable_to_option (Js.Any.nullable_to_option Js.Any.to_bool))
      (Js.get this "writable")

  let get this =
    (Js.Any.nullable_to_option (Js.Any.nullable_to_option Getter.of_any))
      (Js.get this "get")

  let set this =
    (Js.Any.nullable_to_option (Js.Any.nullable_to_option Setter.of_any))
      (Js.get this "set")
end

and Object : sig
  type t = [ `Object ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object} [Object]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?value:Js.any -> unit -> t

  val assign : target:t -> sources:t array -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/assign} \
     [assign] on MDN}."]

  val create : proto:t -> ?props:Property_descriptor.t Js.dict -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/create} \
     [create] on MDN}."]

  val define_properties :
    obj:t -> props:Property_descriptor.t Js.dict -> unit -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/defineProperties} \
     [defineProperties] on MDN}."]

  val define_property :
    obj:t ->
    prop:[< `String | `Symbol ] Js.t ->
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
    prop:[< `String | `Symbol ] Js.t ->
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

  val get_own_property_symbols : obj:t -> unit -> Js.symbol array
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

  val seal : obj:Js.object' -> unit -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/seal} \
     [seal] on MDN}."]

  val set_prototype_of : obj:t -> prototype:Js.object' -> unit -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Object/setPrototypeOf} \
     [setPrototypeOf] on MDN}."]

  val values : obj:t -> unit -> Js.any array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object/values} \
     [values] on MDN}."]

  val has_own_property : prop:[< `Symbol | `String ] Js.t -> t -> bool
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
    locales:[< `String | `Sequence ] Js.t -> ?options:Js.any -> t -> string
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
  type t = [ `Object ] Js.t

  let t = Js.raw "Object"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?value () =
    let value = (Js.Any.undefined_of_option Js.of_any) value in
    Js.obj_new t [| value |]

  let assign ~target ~sources () =
    let target = to_any target in
    let sources = (Js.Any.of_array to_any) sources in
    of_any (Js.meth_call t "assign" [| target; sources |])

  let create ~proto ?props () =
    let proto = to_any proto in
    let props =
      (Js.Any.undefined_of_option (Js.Dict.to_any Property_descriptor.to_any))
        props
    in
    of_any (Js.meth_call t "create" [| proto; props |])

  let define_properties ~obj ~props () =
    let obj = to_any obj in
    let props = (Js.Dict.to_any Property_descriptor.to_any) props in
    Js.to_unit (Js.meth_call t "defineProperties" [| obj; props |])

  let define_property ~obj ~prop ~descriptor () =
    let obj = to_any obj in
    let prop = Js.to_any prop in
    let descriptor = Property_descriptor.to_any descriptor in
    Js.to_unit (Js.meth_call t "defineProperty" [| obj; prop; descriptor |])

  let entries ~obj () =
    let obj = to_any obj in
    (Js.Any.to_array (Js.Any.to_array of_any))
      (Js.meth_call t "entries" [| obj |])

  let freeze ~obj () =
    let obj = to_any obj in
    Js.to_unit (Js.meth_call t "freeze" [| obj |])

  let from_entries ~iterable () =
    let iterable = (Js.Any.of_array (Js.Any.of_array to_any)) iterable in
    of_any (Js.meth_call t "fromEntries" [| iterable |])

  let get_own_property_descriptor ~obj ~prop () =
    let obj = to_any obj in
    let prop = Js.to_any prop in
    (Js.Any.nullable_to_option Property_descriptor.of_any)
      (Js.meth_call t "getOwnPropertyDescriptor" [| obj; prop |])

  let get_own_property_descriptors ~obj () =
    let obj = to_any obj in
    (Js.Any.to_array Property_descriptor.of_any)
      (Js.meth_call t "getOwnPropertyDescriptors" [| obj |])

  let get_own_property_names ~obj () =
    let obj = to_any obj in
    (Js.Any.to_array Js.Any.to_string)
      (Js.meth_call t "getOwnPropertyNames" [| obj |])

  let get_own_property_symbols ~obj () =
    let obj = to_any obj in
    (Js.Any.to_array Js.of_any)
      (Js.meth_call t "getOwnPropertySymbols" [| obj |])

  let get_prototype_of ~obj () =
    let obj = to_any obj in
    (Js.Any.nullable_to_option of_any)
      (Js.meth_call t "getPrototypeOf" [| obj |])

  let is ~value1 ~value2 () =
    let value1 = to_any value1 in
    let value2 = to_any value2 in
    Js.Any.to_bool (Js.meth_call t "is" [| value1; value2 |])

  let is_extensible ~obj () =
    let obj = to_any obj in
    Js.Any.to_bool (Js.meth_call t "isExtensible" [| obj |])

  let is_frozen ~obj () =
    let obj = to_any obj in
    Js.Any.to_bool (Js.meth_call t "isFrozen" [| obj |])

  let is_sealed ~obj () =
    let obj = to_any obj in
    Js.Any.to_bool (Js.meth_call t "isSealed" [| obj |])

  let keys ~obj () =
    let obj = to_any obj in
    (Js.Any.to_array Js.Any.to_string) (Js.meth_call t "keys" [| obj |])

  let prevent_extensions ~obj () =
    let obj = to_any obj in
    Js.to_unit (Js.meth_call t "preventExtensions" [| obj |])

  let seal ~obj () =
    let obj = Js.to_any obj in
    Js.to_unit (Js.meth_call t "seal" [| obj |])

  let set_prototype_of ~obj ~prototype () =
    let obj = to_any obj in
    let prototype = Js.to_any prototype in
    Js.to_unit (Js.meth_call t "setPrototypeOf" [| obj; prototype |])

  let values ~obj () =
    let obj = to_any obj in
    (Js.Any.to_array Js.to_any) (Js.meth_call t "values" [| obj |])

  let has_own_property ~prop this =
    let prop = Js.to_any prop in
    Js.Any.to_bool (Js.meth_call this "hasOwnProperty" [| prop |])

  let is_prototype_of ~obj this =
    let obj = to_any obj in
    Js.Any.to_bool (Js.meth_call this "isPrototypeOf" [| obj |])

  let property_is_enumerable ~prop this =
    let prop = Js.Any.of_string prop in
    Js.Any.to_bool (Js.meth_call this "propertyIsEnumerable" [| prop |])

  let to_locale_string ~locales ?options this =
    let locales = Js.to_any locales in
    let options = (Js.Any.undefined_of_option Js.of_any) options in
    Js.Any.to_string (Js.meth_call this "toLocaleString" [| locales; options |])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])
  let value_of this = of_any (Js.meth_call this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Object} [Object] \
   on MDN}."]

and Function : sig
  type t = [ `Function ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Function} [Function]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val with_params_and_body : params:string array -> body:string -> unit -> t

  val apply : this_arg:t -> arg_array:Js.any array -> t -> Js.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/apply} \
     [apply] on MDN}."]

  val bind : this_arg:t -> args:Js.any array -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function/bind} \
     [bind] on MDN}."]

  val call : this_arg:t -> args:Js.any array -> t -> Js.any
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
  type t = [ `Function ] Js.t

  let t = Js.raw "Function"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let with_params_and_body ~params ~body () =
    let params = (Js.Any.of_array Js.Any.of_string) params in
    let body = Js.Any.of_string body in
    Js.obj_new t [| params; body |]

  let apply ~this_arg ~arg_array this =
    let this_arg = to_any this_arg in
    let arg_array = (Js.Any.of_array Js.of_any) arg_array in
    Js.to_any (Js.meth_call this "apply" [| this_arg; arg_array |])

  let bind ~this_arg ~args this =
    let this_arg = to_any this_arg in
    let args = (Js.Any.of_array Js.of_any) args in
    of_any (Js.meth_call this "bind" [| this_arg; args |])

  let call ~this_arg ~args this =
    let this_arg = to_any this_arg in
    let args = (Js.Any.of_array Js.of_any) args in
    Js.to_any (Js.meth_call this "call" [| this_arg; args |])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])
  let length this = Js.Any.to_int (Js.get this "length")
  let name this = Js.Any.to_string (Js.get this "name")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Function} \
   [Function] on MDN}."]

and Boolean : sig
  type t = [ `Boolean ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Boolean} [Boolean]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
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
  type t = [ `Boolean ] Js.t

  let t = Js.raw "Boolean"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?value () =
    let value = (Js.Any.undefined_of_option Js.Any.of_bool) value in
    Js.obj_new t [| value |]

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])
  let value_of this = Js.Any.to_bool (Js.meth_call this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Boolean} [Boolean] \
   on MDN}."]

and Symbol : sig
  type t = [ `Symbol ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol} [Symbol]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
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

  val to_primitive : Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/toPrimitive} \
     [toPrimitive] on MDN}."]

  val to_string_tag : string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/toStringTag} \
     [toStringTag] on MDN}."]

  val unscopables : Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Symbol/unscopables} \
     [unscopables] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/toString} \
     [toString] on MDN}."]

  val value_of : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Symbol ] Js.t

  let t = Js.raw "Symbol"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?description () =
    let description =
      (Js.Any.undefined_of_option Js.Any.of_string) description
    in
    Js.obj_new t [| description |]

  let for' ~key () =
    let key = Js.Any.of_string key in
    of_any (Js.meth_call t "for" [| key |])

  let key_for ~sym () =
    let sym = Js.Any.of_string sym in
    Js.Any.to_string (Js.meth_call t "keyFor" [| sym |])

  let has_instance = Js.Any.to_bool (Js.get t "hasInstance")
  let is_concat_spreadable = Js.Any.to_bool (Js.get t "isConcatSpreadable")
  let iterator = (Js.Any.to_array of_any) (Js.get t "iterator")
  let match' = (Js.Any.to_array Js.Any.to_string) (Js.get t "match")
  let replace = Js.Any.to_string (Js.get t "replace")
  let search = Js.Any.to_int (Js.get t "search")
  let species = Function.of_any (Js.get t "species")
  let split = (Js.Any.to_array Js.Any.to_string) (Js.get t "split")
  let to_primitive = Js.of_any (Js.get t "toPrimitive")
  let to_string_tag = Js.Any.to_string (Js.get t "toStringTag")
  let unscopables = Js.of_any (Js.get t "unscopables")
  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])
  let value_of this = Js.of_any (Js.meth_call this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Symbol} [Symbol] \
   on MDN}."]

and Number : sig
  type t = [ `Number ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number} [Number]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?value:int -> unit -> t

  val is_finite : number:Js.any -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/isFinite} \
     [isFinite] on MDN}."]

  val is_integer : number:Js.any -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Number/isInteger} \
     [isInteger] on MDN}."]

  val is_na_n : number:Js.any -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/isNaN} \
     [isNaN] on MDN}."]

  val is_safe_integer : number:Js.any -> unit -> bool
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
    locales:[< `String | `Sequence ] Js.t -> ?options:Js.any -> t -> string
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

  val value_of : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Number ] Js.t

  let t = Js.raw "Number"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?value () =
    let value = (Js.Any.undefined_of_option Js.Any.of_int) value in
    Js.obj_new t [| value |]

  let is_finite ~number () =
    let number = Js.of_any number in
    Js.Any.to_bool (Js.meth_call t "isFinite" [| number |])

  let is_integer ~number () =
    let number = Js.of_any number in
    Js.Any.to_bool (Js.meth_call t "isInteger" [| number |])

  let is_na_n ~number () =
    let number = Js.of_any number in
    Js.Any.to_bool (Js.meth_call t "isNaN" [| number |])

  let is_safe_integer ~number () =
    let number = Js.of_any number in
    Js.Any.to_bool (Js.meth_call t "isSafeInteger" [| number |])

  let parse_float ~str () =
    let str = Js.Any.of_string str in
    Js.Any.to_float (Js.meth_call t "parseFloat" [| str |])

  let parse_int ~str ~radix () =
    let str = Js.Any.of_string str in
    let radix = Js.Any.of_int radix in
    Js.Any.to_int (Js.meth_call t "parseInt" [| str; radix |])

  let epsilon = 2.22044604925e-16
  let max_safe_integer = 9007199254740991
  let max_value = 1.79769313486e+308
  let min_safe_integer = -9007199254740991
  let min_value = 4.94065645841e-324
  let nan = nan
  let negative_infinity = infinity
  let positive_infinity = infinity

  let to_exponential ~fraction_digits this =
    let fraction_digits = Js.Any.of_int fraction_digits in
    Js.Any.to_string (Js.meth_call this "toExponential" [| fraction_digits |])

  let to_fixed ~fraction_digits this =
    let fraction_digits = Js.Any.of_int fraction_digits in
    Js.Any.to_string (Js.meth_call this "toFixed" [| fraction_digits |])

  let to_locale_string ~locales ?options this =
    let locales = Js.to_any locales in
    let options = (Js.Any.undefined_of_option Js.of_any) options in
    Js.Any.to_string (Js.meth_call this "toLocaleString" [| locales; options |])

  let to_precision ~precision this =
    let precision = Js.Any.of_int precision in
    Js.Any.to_string (Js.meth_call this "toPrecision" [| precision |])

  let to_string ~radix this =
    let radix = Js.Any.of_int radix in
    Js.Any.to_string (Js.meth_call this "toString" [| radix |])

  let value_of this = Js.of_any (Js.meth_call this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Number} [Number] \
   on MDN}."]

and Big_int : sig
  type t = [ `Big_int ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BigInt} [BigInt]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : value:[< `String | `Long | `Bool | `Big_int ] Js.t -> unit -> t

  val as_int_n : bits:int -> bigint:t -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/asIntN} \
     [asIntN] on MDN}."]

  val as_uint_n : bits:int -> bigint:t -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/asUintN} \
     [asUintN] on MDN}."]

  val to_locale_string :
    locales:[< `String | `Sequence ] Js.t -> ?options:Js.any -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BigInt/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_string : radix:int -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/toString} \
     [toString] on MDN}."]

  val value_of : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BigInt/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `Big_int ] Js.t

  let t = Js.raw "BigInt"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ~value () =
    let value = Js.to_any value in
    Js.obj_new t [| value |]

  let as_int_n ~bits ~bigint this =
    let bits = Js.Any.of_int bits in
    let bigint = to_any bigint in
    Js.Any.to_int (Js.meth_call this "asIntN" [| bits; bigint |])

  let as_uint_n ~bits ~bigint this =
    let bits = Js.Any.of_int bits in
    let bigint = to_any bigint in
    Js.Any.to_int (Js.meth_call this "asUintN" [| bits; bigint |])

  let to_locale_string ~locales ?options this =
    let locales = Js.to_any locales in
    let options = (Js.Any.undefined_of_option Js.of_any) options in
    Js.Any.to_string (Js.meth_call this "toLocaleString" [| locales; options |])

  let to_string ~radix this =
    let radix = Js.Any.of_int radix in
    Js.Any.to_string (Js.meth_call this "toString" [| radix |])

  let value_of this = Js.of_any (Js.meth_call this "valueOf" [||])
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
  let t = Js.global "Math" `Object
  let e = Js.Any.to_float (Js.get t "E")
  let ln10 = Js.Any.to_float (Js.get t "LN10")
  let ln2 = Js.Any.to_float (Js.get t "LN2")
  let log10_e = Js.Any.to_float (Js.get t "LOG10E")
  let log2_e = Js.Any.to_float (Js.get t "LOG2E")
  let pi = Js.Any.to_float (Js.get t "PI")
  let sqrt1_2 = Js.Any.to_float (Js.get t "SQRT1_2")
  let sqrt2 = Js.Any.to_float (Js.get t "SQRT2")

  let abs ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "abs" [| x |])

  let acos ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "acos" [| x |])

  let acosh ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "acosh" [| x |])

  let asin ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "asin" [| x |])

  let asinh ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "asinh" [| x |])

  let atan ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "atan" [| x |])

  let atanh ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "atanh" [| x |])

  let atan2 ~y ~x () =
    let y = Js.Any.of_float y in
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "atan2" [| y; x |])

  let cbrt ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "cbrt" [| x |])

  let ceil ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "ceil" [| x |])

  let clz32 ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "clz32" [| x |])

  let cos ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "cos" [| x |])

  let cosh ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "cosh" [| x |])

  let exp ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "exp" [| x |])

  let expm1 ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "expm1" [| x |])

  let floor ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "floor" [| x |])

  let fround ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "fround" [| x |])

  let hypot ~value1 ~value2 ~values () =
    let value1 = Js.Any.of_float value1 in
    let value2 = Js.Any.of_float value2 in
    let values = (Js.Any.of_array Js.Any.of_float) values in
    Js.Any.to_float (Js.meth_call t "hypot" [| value1; value2; values |])

  let imul ~x ~y () =
    let x = Js.Any.of_float x in
    let y = Js.Any.of_float y in
    Js.Any.to_float (Js.meth_call t "imul" [| x; y |])

  let log ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "log" [| x |])

  let log1p ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "log1p" [| x |])

  let log10 ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "log10" [| x |])

  let log2 ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "log2" [| x |])

  let max ~value1 ~value2 ~values () =
    let value1 = Js.Any.of_float value1 in
    let value2 = Js.Any.of_float value2 in
    let values = (Js.Any.of_array Js.Any.of_float) values in
    Js.Any.to_float (Js.meth_call t "max" [| value1; value2; values |])

  let min ~value1 ~value2 ~values () =
    let value1 = Js.Any.of_float value1 in
    let value2 = Js.Any.of_float value2 in
    let values = (Js.Any.of_array Js.Any.of_float) values in
    Js.Any.to_float (Js.meth_call t "min" [| value1; value2; values |])

  let pow ~x ~y () =
    let x = Js.Any.of_float x in
    let y = Js.Any.of_float y in
    Js.Any.to_float (Js.meth_call t "pow" [| x; y |])

  let random () = Js.Any.to_float (Js.meth_call t "random" [||])

  let round ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "round" [| x |])

  let sign ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "sign" [| x |])

  let sin ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "sin" [| x |])

  let sinh ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "sinh" [| x |])

  let sqrt ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "sqrt" [| x |])

  let tan ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "tan" [| x |])

  let tanh ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "tanh" [| x |])

  let trunc ~x () =
    let x = Js.Any.of_float x in
    Js.Any.to_float (Js.meth_call t "trunc" [| x |])
end

and Date : sig
  type t = [ `Date ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date} [Date]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?value:[< `Long | `String | `Date ] Js.t -> unit -> t

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

  val get_time : t -> Js.object'
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

  val to_locale_date_string :
    ?locales:string -> ?options:Js.object' -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toLocaleDateString} \
     [toLocaleDateString] on MDN}."]

  val to_locale_string : ?locales:string -> ?options:Js.object' -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Date/toLocaleString} \
     [toLocaleString] on MDN}."]

  val to_locale_time_string :
    ?locales:string -> ?options:Js.object' -> t -> string
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
  type t = [ `Date ] Js.t

  let t = Js.raw "Date"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?value () =
    let value = (Js.Any.undefined_of_option Js.to_any) value in
    Js.obj_new t [| value |]

  let with_year_and_month_and_date_and_hours_and_minutes_and_seconds_and_ms
      ~year ~month ?date ?hours ?minutes ?seconds ?ms () =
    let year = Js.Any.of_int year in
    let month = Js.Any.of_int month in
    let date = (Js.Any.undefined_of_option Js.Any.of_int) date in
    let hours = (Js.Any.undefined_of_option Js.Any.of_int) hours in
    let minutes = (Js.Any.undefined_of_option Js.Any.of_int) minutes in
    let seconds = (Js.Any.undefined_of_option Js.Any.of_int) seconds in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.obj_new t [| year; month; date; hours; minutes; seconds; ms |]

  let now () = of_any (Js.meth_call t "now" [||])

  let parse ~string () =
    let string = Js.Any.of_string string in
    of_any (Js.meth_call t "parse" [| string |])

  let utc ~year ~month ?date ?hours ?minutes ?seconds ?ms () =
    let year = Js.Any.of_int year in
    let month = Js.Any.of_int month in
    let date = (Js.Any.undefined_of_option Js.Any.of_int) date in
    let hours = (Js.Any.undefined_of_option Js.Any.of_int) hours in
    let minutes = (Js.Any.undefined_of_option Js.Any.of_int) minutes in
    let seconds = (Js.Any.undefined_of_option Js.Any.of_int) seconds in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int
      (Js.meth_call t "UTC" [| year; month; date; hours; minutes; seconds; ms |])

  let get_date this = Js.Any.to_int (Js.meth_call this "getDate" [||])
  let get_day this = Js.Any.to_int (Js.meth_call this "getDay" [||])
  let get_full_year this = Js.Any.to_int (Js.meth_call this "getFullYear" [||])
  let get_hours this = Js.Any.to_int (Js.meth_call this "getHours" [||])

  let get_milliseconds this =
    Js.Any.to_int (Js.meth_call this "getMilliseconds" [||])

  let get_minutes this = Js.Any.to_int (Js.meth_call this "getMinutes" [||])
  let get_month this = Js.Any.to_int (Js.meth_call this "getMonth" [||])
  let get_seconds this = Js.Any.to_int (Js.meth_call this "getSeconds" [||])
  let get_time this = Js.of_any (Js.meth_call this "getTime" [||])

  let get_timezone_offset this =
    Js.Any.to_int (Js.meth_call this "getTimezoneOffset" [||])

  let get_utc_date this = Js.Any.to_int (Js.meth_call this "getUTCDate" [||])
  let get_utc_day this = Js.Any.to_int (Js.meth_call this "getUTCDay" [||])

  let get_utc_full_year this =
    Js.Any.to_int (Js.meth_call this "getUTCFullYear" [||])

  let get_utc_hours this = Js.Any.to_int (Js.meth_call this "getUTCHours" [||])

  let get_utc_milliseconds this =
    Js.Any.to_int (Js.meth_call this "getUTCMilliseconds" [||])

  let get_utc_minutes this =
    Js.Any.to_int (Js.meth_call this "getUTCMinutes" [||])

  let get_utc_month this = Js.Any.to_int (Js.meth_call this "getUTCMonth" [||])

  let get_utc_seconds this =
    Js.Any.to_int (Js.meth_call this "getUTCSeconds" [||])

  let set_date ~date this =
    let date = Js.Any.of_int date in
    Js.Any.to_int (Js.meth_call this "setDate" [| date |])

  let set_full_year ~year ?month ?date this =
    let year = Js.Any.of_int year in
    let month = (Js.Any.undefined_of_option Js.Any.of_int) month in
    let date = (Js.Any.undefined_of_option Js.Any.of_int) date in
    Js.Any.to_int (Js.meth_call this "setFullYear" [| year; month; date |])

  let set_hours ~hour ?min ?sec ?ms this =
    let hour = Js.Any.of_int hour in
    let min = (Js.Any.undefined_of_option Js.Any.of_int) min in
    let sec = (Js.Any.undefined_of_option Js.Any.of_int) sec in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int (Js.meth_call this "setHours" [| hour; min; sec; ms |])

  let set_milliseconds ~ms this =
    let ms = Js.Any.of_int ms in
    Js.Any.to_int (Js.meth_call this "setMilliseconds" [| ms |])

  let set_minutes ~min ?sec ?ms this =
    let min = Js.Any.of_int min in
    let sec = (Js.Any.undefined_of_option Js.Any.of_int) sec in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int (Js.meth_call this "setMinutes" [| min; sec; ms |])

  let set_month ~month ?date this =
    let month = Js.Any.of_int month in
    let date = (Js.Any.undefined_of_option Js.Any.of_int) date in
    Js.Any.to_int (Js.meth_call this "setMonth" [| month; date |])

  let set_seconds ~sec ?ms this =
    let sec = Js.Any.of_int sec in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int (Js.meth_call this "setSeconds" [| sec; ms |])

  let set_time ~time this =
    let time = Js.Any.of_int time in
    Js.Any.to_int (Js.meth_call this "setTime" [| time |])

  let set_utc_date ~date this =
    let date = Js.Any.of_int date in
    Js.Any.to_int (Js.meth_call this "setUTCDate" [| date |])

  let set_utc_full_year ~year ?month ?date this =
    let year = Js.Any.of_int year in
    let month = (Js.Any.undefined_of_option Js.Any.of_int) month in
    let date = (Js.Any.undefined_of_option Js.Any.of_int) date in
    Js.Any.to_int (Js.meth_call this "setUTCFullYear" [| year; month; date |])

  let set_utc_hours ~hour ?min ?sec ?ms this =
    let hour = Js.Any.of_int hour in
    let min = (Js.Any.undefined_of_option Js.Any.of_int) min in
    let sec = (Js.Any.undefined_of_option Js.Any.of_int) sec in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int (Js.meth_call this "setUTCHours" [| hour; min; sec; ms |])

  let set_utc_milliseconds ~ms this =
    let ms = Js.Any.of_int ms in
    Js.Any.to_int (Js.meth_call this "setUTCMilliseconds" [| ms |])

  let set_utc_minutes ~min ?sec ?ms this =
    let min = Js.Any.of_int min in
    let sec = (Js.Any.undefined_of_option Js.Any.of_int) sec in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int (Js.meth_call this "setUTCMinutes" [| min; sec; ms |])

  let set_utc_month ~month ?date this =
    let month = Js.Any.of_int month in
    let date = (Js.Any.undefined_of_option Js.Any.of_int) date in
    Js.Any.to_int (Js.meth_call this "setUTCMonth" [| month; date |])

  let set_utc_seconds ~sec ?ms this =
    let sec = Js.Any.of_int sec in
    let ms = (Js.Any.undefined_of_option Js.Any.of_int) ms in
    Js.Any.to_int (Js.meth_call this "setUTCSeconds" [| sec; ms |])

  let to_date_string this =
    Js.Any.to_string (Js.meth_call this "toDateString" [||])

  let to_iso_string this =
    Js.Any.to_string (Js.meth_call this "toISOString" [||])

  let to_json this = Js.Any.to_string (Js.meth_call this "toJSON" [||])

  let to_locale_date_string ?locales ?options this =
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.Any.to_string
      (Js.meth_call this "toLocaleDateString" [| locales; options |])

  let to_locale_string ?locales ?options this =
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.Any.to_string (Js.meth_call this "toLocaleString" [| locales; options |])

  let to_locale_time_string ?locales ?options this =
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.Any.to_string
      (Js.meth_call this "toLocaleTimeString" [| locales; options |])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])

  let to_time_string this =
    Js.Any.to_string (Js.meth_call this "toTimeString" [||])

  let to_utc_string this =
    Js.Any.to_string (Js.meth_call this "toUTCString" [||])

  let value_of this = Js.Any.to_int (Js.meth_call this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Date} [Date] on \
   MDN}."]

and String : sig
  type t = [ `String ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String} [String]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : value:Js.any -> unit -> t

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
    that:Js.object' -> ?locales:string -> ?options:Js.object' -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/String/localeCompare} \
     [localeCompare] on MDN}."]

  val match' : regexp:Js.object' -> t -> Js.object'
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

  val replace :
    search_value:Js.object' -> replace_value:Js.object' -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/replace} \
     [replace] on MDN}."]

  val search : regexp:Js.object' -> t -> Js.object'
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

  val value_of : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String/valueOf} \
     [valueOf] on MDN}."]
end = struct
  type t = [ `String ] Js.t

  let t = Js.raw "String"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ~value () =
    let value = Js.of_any value in
    Js.obj_new t [| value |]

  let from_char_code ~code_units () =
    let code_units = (Js.Any.of_array Js.Any.of_string) code_units in
    Js.Any.to_string (Js.meth_call t "fromCharCode" [| code_units |])

  let from_code_point ~code_points () =
    let code_points = (Js.Any.of_array Js.Any.of_string) code_points in
    Js.Any.to_string (Js.meth_call t "fromCodePoint" [| code_points |])

  let raw ~template ~substitutions () =
    let template = Js.Any.of_string template in
    let substitutions = (Js.Any.of_array Js.Any.of_string) substitutions in
    Js.Any.to_string (Js.meth_call t "raw" [| template; substitutions |])

  let char_at ~pos this =
    let pos = Js.Any.of_int pos in
    Js.Any.to_string (Js.meth_call this "charAt" [| pos |])

  let char_code_at ~pos this =
    let pos = Js.Any.of_int pos in
    Js.Any.to_string (Js.meth_call this "charCodeAt" [| pos |])

  let code_point_at ~pos this =
    let pos = Js.Any.of_int pos in
    Js.Any.to_string (Js.meth_call this "codePointAt" [| pos |])

  let concat ~strings this =
    let strings = (Js.Any.of_array Js.Any.of_string) strings in
    Js.Any.to_string (Js.meth_call this "concat" [| strings |])

  let ends_with ~search_string ?end_position this =
    let search_string = Js.Any.of_string search_string in
    let end_position =
      (Js.Any.undefined_of_option Js.Any.of_int) end_position
    in
    Js.Any.to_bool
      (Js.meth_call this "endsWith" [| search_string; end_position |])

  let includes ~search_string ?position this =
    let search_string = Js.Any.of_string search_string in
    let position = (Js.Any.undefined_of_option Js.Any.of_int) position in
    Js.Any.to_bool (Js.meth_call this "includes" [| search_string; position |])

  let index_of ~search_string ?position this =
    let search_string = Js.Any.of_string search_string in
    let position = (Js.Any.undefined_of_option Js.Any.of_int) position in
    Js.Any.to_int (Js.meth_call this "indexOf" [| search_string; position |])

  let last_index_of ~search_string ?position this =
    let search_string = Js.Any.of_string search_string in
    let position = (Js.Any.undefined_of_option Js.Any.of_int) position in
    Js.Any.to_int (Js.meth_call this "lastIndexOf" [| search_string; position |])

  let locale_compare ~that ?locales ?options this =
    let that = Js.to_any that in
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.Any.to_int
      (Js.meth_call this "localeCompare" [| that; locales; options |])

  let match' ~regexp this =
    let regexp = Js.to_any regexp in
    Js.of_any (Js.meth_call this "match" [| regexp |])

  let normalize ?form this =
    let form = (Js.Any.undefined_of_option Js.Any.of_string) form in
    Js.Any.to_string (Js.meth_call this "normalize" [| form |])

  let pad_end ~max_length ~fill_string this =
    let max_length = Js.Any.of_int max_length in
    let fill_string = Js.Any.of_string fill_string in
    Js.Any.to_string (Js.meth_call this "padEnd" [| max_length; fill_string |])

  let pad_start ~max_length ~fill_string this =
    let max_length = Js.Any.of_int max_length in
    let fill_string = Js.Any.of_string fill_string in
    Js.Any.to_string (Js.meth_call this "padStart" [| max_length; fill_string |])

  let repeat ~count this =
    let count = Js.Any.of_int count in
    Js.Any.to_string (Js.meth_call this "repeat" [| count |])

  let replace ~search_value ~replace_value this =
    let search_value = Js.to_any search_value in
    let replace_value = Js.to_any replace_value in
    Js.Any.to_string
      (Js.meth_call this "replace" [| search_value; replace_value |])

  let search ~regexp this =
    let regexp = Js.to_any regexp in
    Js.of_any (Js.meth_call this "search" [| regexp |])

  let slice ~start ~end' this =
    let start = Js.Any.of_int start in
    let end' = Js.Any.of_int end' in
    Js.Any.to_string (Js.meth_call this "slice" [| start; end' |])

  let split ~separator ~limit this =
    let separator = Js.Any.of_string separator in
    let limit = Js.Any.of_int limit in
    (Js.Any.to_array Js.Any.to_string)
      (Js.meth_call this "split" [| separator; limit |])

  let starts_with ~search_string ?position this =
    let search_string = Js.Any.of_string search_string in
    let position = (Js.Any.undefined_of_option Js.Any.of_int) position in
    Js.Any.to_bool (Js.meth_call this "startsWith" [| search_string; position |])

  let substring ~start ~end' this =
    let start = Js.Any.of_int start in
    let end' = Js.Any.of_int end' in
    Js.Any.to_string (Js.meth_call this "substring" [| start; end' |])

  let to_locale_lower_case ?locales this =
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    Js.Any.to_string (Js.meth_call this "toLocaleLowerCase" [| locales |])

  let to_locale_upper_case ?locales this =
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    Js.Any.to_string (Js.meth_call this "toLocaleUpperCase" [| locales |])

  let to_lower_case this =
    Js.Any.to_string (Js.meth_call this "toLowerCase" [||])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])

  let to_upper_case this =
    Js.Any.to_string (Js.meth_call this "toUpperCase" [||])

  let trim this = Js.Any.to_string (Js.meth_call this "trim" [||])
  let value_of this = Js.of_any (Js.meth_call this "valueOf" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/String} [String] \
   on MDN}."]

and Reg_exp : sig
  type t = [ `Reg_exp ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/RegExp} [RegExp]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val with_pattern_and_flags :
    pattern:[< `String | `Reg_exp ] Js.t -> ?flags:string -> unit -> t

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
  type t = [ `Reg_exp ] Js.t

  let t = Js.raw "RegExp"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let with_pattern_and_flags ~pattern ?flags () =
    let pattern = Js.to_any pattern in
    let flags = (Js.Any.undefined_of_option Js.Any.of_string) flags in
    Js.obj_new t [| pattern; flags |]

  let exec ~string this =
    let string = Js.Any.of_string string in
    (Js.Any.to_array Js.Any.to_string) (Js.meth_call this "exec" [| string |])

  let flags this = Js.Any.to_string (Js.get this "flags")
  let global this = Js.Any.to_bool (Js.get this "global")
  let ignore_case this = Js.Any.to_bool (Js.get this "ignoreCase")
  let multiline this = Js.Any.to_bool (Js.get this "multiline")
  let source this = Js.Any.to_string (Js.get this "source")
  let sticky this = Js.Any.to_bool (Js.get this "sticky")

  let test ~s this =
    let s = Js.Any.of_string s in
    Js.Any.to_bool (Js.meth_call this "test" [| s |])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])
  let unicode this = Js.Any.to_bool (Js.get this "unicode")
  let set_unicode this x = Js.set this "unicode" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/RegExp} [RegExp] \
   on MDN}."]

and Array : sig
  type t = [ `Array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array} [Array]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : len:int -> unit -> t
  val make : args:Js.any array -> unit -> t

  val from : items:Js.any -> ?mapfn:Js.object' -> ?this_arg:Js.any -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/from} \
     [from] on MDN}."]

  val is_array : arg:Js.any -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/isArray} \
     [isArray] on MDN}."]

  val of' : items:Js.any array -> unit -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/of} [of] \
     on MDN}."]

  val concat : arguments:Js.any array -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/concat} \
     [concat] on MDN}."]

  val copy_within : target:int -> ?start:int -> ?end':int -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/copyWithin} \
     [copyWithin] on MDN}."]

  val entries : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/entries} \
     [entries] on MDN}."]

  val every : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/every} \
     [every] on MDN}."]

  val fill : value:Js.object' -> ?start:int -> ?end':int -> t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/fill} \
     [fill] on MDN}."]

  val filter : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/filter} \
     [filter] on MDN}."]

  val find : predicate:Js.object' -> ?this_arg:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/find} \
     [find] on MDN}."]

  val find_index : predicate:Js.object' -> ?this_arg:Js.any -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/findIndex} \
     [findIndex] on MDN}."]

  val for_each : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/forEach} \
     [forEach] on MDN}."]

  val includes : search_element:Js.any -> from_index:int -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/includes} \
     [includes] on MDN}."]

  val index_of : search_element:Js.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/indexOf} \
     [indexOf] on MDN}."]

  val join : separator:string -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/join} \
     [join] on MDN}."]

  val keys : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/keys} \
     [keys] on MDN}."]

  val last_index_of : search_element:Js.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/lastIndexOf} \
     [lastIndexOf] on MDN}."]

  val map : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/map} [map] \
     on MDN}."]

  val pop : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/pop} [pop] \
     on MDN}."]

  val push : items:Js.any array -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/push} \
     [push] on MDN}."]

  val reduce : callbackfn:Js.object' -> ?initial_value:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/reduce} \
     [reduce] on MDN}."]

  val reduce_right :
    callbackfn:Js.object' -> ?initial_value:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/reduceRight} \
     [reduceRight] on MDN}."]

  val reverse : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/reverse} \
     [reverse] on MDN}."]

  val shift : t -> Js.any
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/shift} \
     [shift] on MDN}."]

  val slice : start:int -> end':int -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/slice} \
     [slice] on MDN}."]

  val some : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/some} \
     [some] on MDN}."]

  val sort : comparefn:Js.object' -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/sort} \
     [sort] on MDN}."]

  val splice : start:int -> delete_count:int -> items:Js.any array -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/splice} \
     [splice] on MDN}."]

  val to_locale_time_string :
    ?locales:string -> ?options:Js.object' -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Array/toLocaleTimeString} \
     [toLocaleTimeString] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/toString} \
     [toString] on MDN}."]

  val unshift : items:Js.any array -> t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array/unshift} \
     [unshift] on MDN}."]

  val values : t -> Js.object'
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
  type t = [ `Array ] Js.t

  let t = Js.raw "Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~len () =
    let len = Js.Any.of_int len in
    Js.obj_new t [| len |]

  let make ~args () =
    let args = (Js.Any.of_array Js.of_any) args in
    Js.obj_new t [| args |]

  let from ~items ?mapfn ?this_arg () =
    let items = Js.of_any items in
    let mapfn = (Js.Any.undefined_of_option Js.to_any) mapfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    of_any (Js.meth_call t "from" [| items; mapfn; this_arg |])

  let is_array ~arg () =
    let arg = Js.of_any arg in
    Js.Any.to_bool (Js.meth_call t "isArray" [| arg |])

  let of' ~items () =
    let items = (Js.Any.of_array Js.of_any) items in
    of_any (Js.meth_call t "of" [| items |])

  let concat ~arguments this =
    let arguments = (Js.Any.of_array Js.of_any) arguments in
    of_any (Js.meth_call this "concat" [| arguments |])

  let copy_within ~target ?start ?end' this =
    let target = Js.Any.of_int target in
    let start = (Js.Any.undefined_of_option Js.Any.of_int) start in
    let end' = (Js.Any.undefined_of_option Js.Any.of_int) end' in
    Js.of_any (Js.meth_call this "copyWithin" [| target; start; end' |])

  let entries this = Js.of_any (Js.meth_call this "entries" [||])

  let every ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.Any.to_bool (Js.meth_call this "every" [| callbackfn; this_arg |])

  let fill ~value ?start ?end' this =
    let value = Js.to_any value in
    let start = (Js.Any.undefined_of_option Js.Any.of_int) start in
    let end' = (Js.Any.undefined_of_option Js.Any.of_int) end' in
    Js.of_any (Js.meth_call this "fill" [| value; start; end' |])

  let filter ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    of_any (Js.meth_call this "filter" [| callbackfn; this_arg |])

  let find ~predicate ?this_arg this =
    let predicate = Js.to_any predicate in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.to_unit (Js.meth_call this "find" [| predicate; this_arg |])

  let find_index ~predicate ?this_arg this =
    let predicate = Js.to_any predicate in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.Any.to_int (Js.meth_call this "findIndex" [| predicate; this_arg |])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.to_unit (Js.meth_call this "forEach" [| callbackfn; this_arg |])

  let includes ~search_element ~from_index this =
    let search_element = Js.of_any search_element in
    let from_index = Js.Any.of_int from_index in
    Js.Any.to_bool
      (Js.meth_call this "includes" [| search_element; from_index |])

  let index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (Js.Any.undefined_of_option Js.Any.of_int) from_index in
    Js.Any.to_int (Js.meth_call this "indexOf" [| search_element; from_index |])

  let join ~separator this =
    let separator = Js.Any.of_string separator in
    Js.Any.to_string (Js.meth_call this "join" [| separator |])

  let keys this = Js.of_any (Js.meth_call this "keys" [||])

  let last_index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (Js.Any.undefined_of_option Js.Any.of_int) from_index in
    Js.Any.to_int
      (Js.meth_call this "lastIndexOf" [| search_element; from_index |])

  let map ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    of_any (Js.meth_call this "map" [| callbackfn; this_arg |])

  let pop this = Js.of_any (Js.meth_call this "pop" [||])

  let push ~items this =
    let items = (Js.Any.of_array Js.of_any) items in
    Js.Any.to_int (Js.meth_call this "push" [| items |])

  let reduce ~callbackfn ?initial_value this =
    let callbackfn = Js.to_any callbackfn in
    let initial_value = (Js.Any.undefined_of_option Js.of_any) initial_value in
    Js.of_any (Js.meth_call this "reduce" [| callbackfn; initial_value |])

  let reduce_right ~callbackfn ?initial_value this =
    let callbackfn = Js.to_any callbackfn in
    let initial_value = (Js.Any.undefined_of_option Js.of_any) initial_value in
    Js.of_any (Js.meth_call this "reduceRight" [| callbackfn; initial_value |])

  let reverse this = Js.of_any (Js.meth_call this "reverse" [||])
  let shift this = Js.to_any (Js.meth_call this "shift" [||])

  let slice ~start ~end' this =
    let start = Js.Any.of_int start in
    let end' = Js.Any.of_int end' in
    of_any (Js.meth_call this "slice" [| start; end' |])

  let some ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.Any.to_bool (Js.meth_call this "some" [| callbackfn; this_arg |])

  let sort ~comparefn this =
    let comparefn = Js.to_any comparefn in
    Js.to_unit (Js.meth_call this "sort" [| comparefn |])

  let splice ~start ~delete_count ~items this =
    let start = Js.Any.of_int start in
    let delete_count = Js.Any.of_int delete_count in
    let items = (Js.Any.of_array Js.of_any) items in
    of_any (Js.meth_call this "splice" [| start; delete_count; items |])

  let to_locale_time_string ?locales ?options this =
    let locales = (Js.Any.undefined_of_option Js.Any.of_string) locales in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.Any.to_string
      (Js.meth_call this "toLocaleTimeString" [| locales; options |])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])

  let unshift ~items this =
    let items = (Js.Any.of_array Js.of_any) items in
    Js.Any.to_int (Js.meth_call this "unshift" [| items |])

  let values this = Js.of_any (Js.meth_call this "values" [||])
  let length this = Js.Any.to_int (Js.get this "length")
  let set_length this x = Js.set this "length" (Js.Any.of_int x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Array} [Array] on \
   MDN}."]

and Typed_array : sig
  type t = [ `Typed_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray} \
     [TypedArray]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val from :
    source:Js.object' ->
    ?mapfn:Js.object' ->
    ?this_arg:Js.any ->
    unit ->
    Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/from} \
     [from] on MDN}."]

  val of' : items:Js.any array -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/of} \
     [of] on MDN}."]

  val buffer : t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/buffer} \
     [buffer] on MDN}."]

  val set_buffer : t -> Js.object' -> unit
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

  val copy_within :
    target:Js.object' -> start:int -> ?end':int -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/copyWithin} \
     [copyWithin] on MDN}."]

  val entries : t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/entries} \
     [entries] on MDN}."]

  val every : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/every} \
     [every] on MDN}."]

  val fill : value:Js.object' -> ?start:int -> ?end':int -> t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/fill} \
     [fill] on MDN}."]

  val filter : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/filter} \
     [filter] on MDN}."]

  val find : predicate:Js.object' -> ?this_arg:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/find} \
     [find] on MDN}."]

  val find_index : predicate:Js.object' -> ?this_arg:Js.any -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/findIndex} \
     [findIndex] on MDN}."]

  val for_each : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/forEach} \
     [forEach] on MDN}."]

  val includes : search_element:Js.any -> from_index:int -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/includes} \
     [includes] on MDN}."]

  val index_of : search_element:Js.any -> ?from_index:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/indexOf} \
     [indexOf] on MDN}."]

  val join : separator:string -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/join} \
     [join] on MDN}."]

  val keys : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/keys} \
     [keys] on MDN}."]

  val last_index_of : search_element:Js.any -> ?from_index:int -> t -> int
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

  val map : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/map} \
     [map] on MDN}."]

  val reduce : callbackfn:Js.object' -> ?initial_value:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/reduce} \
     [reduce] on MDN}."]

  val reduce_right :
    callbackfn:Js.object' -> ?initial_value:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/reduceRight} \
     [reduceRight] on MDN}."]

  val reverse : t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/reverse} \
     [reverse] on MDN}."]

  val set : array:Array.t -> ?offset:int -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/set} \
     [set] on MDN}."]

  val set : typed_array:Js.object' -> ?offset:int -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/set} \
     [set] on MDN}."]

  val slice : start:int -> end':int -> t -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/slice} \
     [slice] on MDN}."]

  val some : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/some} \
     [some] on MDN}."]

  val sort : comparefn:Js.object' -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray/sort} \
     [sort] on MDN}."]

  val subarray : ?begin':int -> ?end':int -> t -> Js.object'
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

  val values : t -> Js.object'
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
  type t = [ `Typed_array ] Js.t

  let t = Js.raw "TypedArray"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let from ~source ?mapfn ?this_arg () =
    let source = Js.to_any source in
    let mapfn = (Js.Any.undefined_of_option Js.to_any) mapfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.of_any (Js.meth_call t "from" [| source; mapfn; this_arg |])

  let of' ~items () =
    let items = (Js.Any.of_array Js.of_any) items in
    Js.of_any (Js.meth_call t "of" [| items |])

  let buffer this = Js.of_any (Js.get this "buffer")
  let set_buffer this x = Js.set this "buffer" (Js.to_any x)
  let byte_length this = Js.Any.to_int (Js.get this "byteLength")
  let set_byte_length this x = Js.set this "byteLength" (Js.Any.of_int x)
  let byte_offset this = Js.Any.to_int (Js.get this "byteOffset")
  let set_byte_offset this x = Js.set this "byteOffset" (Js.Any.of_int x)

  let copy_within ~target ~start ?end' this =
    let target = Js.to_any target in
    let start = Js.Any.of_int start in
    let end' = (Js.Any.undefined_of_option Js.Any.of_int) end' in
    Js.of_any (Js.meth_call this "copyWithin" [| target; start; end' |])

  let entries this = Js.of_any (Js.meth_call this "entries" [||])

  let every ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.Any.to_bool (Js.meth_call this "every" [| callbackfn; this_arg |])

  let fill ~value ?start ?end' this =
    let value = Js.to_any value in
    let start = (Js.Any.undefined_of_option Js.Any.of_int) start in
    let end' = (Js.Any.undefined_of_option Js.Any.of_int) end' in
    Js.of_any (Js.meth_call this "fill" [| value; start; end' |])

  let filter ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.of_any (Js.meth_call this "filter" [| callbackfn; this_arg |])

  let find ~predicate ?this_arg this =
    let predicate = Js.to_any predicate in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.to_unit (Js.meth_call this "find" [| predicate; this_arg |])

  let find_index ~predicate ?this_arg this =
    let predicate = Js.to_any predicate in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.Any.to_int (Js.meth_call this "findIndex" [| predicate; this_arg |])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.to_unit (Js.meth_call this "forEach" [| callbackfn; this_arg |])

  let includes ~search_element ~from_index this =
    let search_element = Js.of_any search_element in
    let from_index = Js.Any.of_int from_index in
    Js.Any.to_bool
      (Js.meth_call this "includes" [| search_element; from_index |])

  let index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (Js.Any.undefined_of_option Js.Any.of_int) from_index in
    Js.Any.to_int (Js.meth_call this "indexOf" [| search_element; from_index |])

  let join ~separator this =
    let separator = Js.Any.of_string separator in
    Js.Any.to_string (Js.meth_call this "join" [| separator |])

  let keys this = Js.of_any (Js.meth_call this "keys" [||])

  let last_index_of ~search_element ?from_index this =
    let search_element = Js.of_any search_element in
    let from_index = (Js.Any.undefined_of_option Js.Any.of_int) from_index in
    Js.Any.to_int
      (Js.meth_call this "lastIndexOf" [| search_element; from_index |])

  let length this = Js.Any.to_int (Js.get this "length")
  let set_length this x = Js.set this "length" (Js.Any.of_int x)

  let map ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.of_any (Js.meth_call this "map" [| callbackfn; this_arg |])

  let reduce ~callbackfn ?initial_value this =
    let callbackfn = Js.to_any callbackfn in
    let initial_value = (Js.Any.undefined_of_option Js.of_any) initial_value in
    Js.of_any (Js.meth_call this "reduce" [| callbackfn; initial_value |])

  let reduce_right ~callbackfn ?initial_value this =
    let callbackfn = Js.to_any callbackfn in
    let initial_value = (Js.Any.undefined_of_option Js.of_any) initial_value in
    Js.of_any (Js.meth_call this "reduceRight" [| callbackfn; initial_value |])

  let reverse this = Js.of_any (Js.meth_call this "reverse" [||])

  let set ~array ?offset this =
    let array = Array.to_any array in
    let offset = (Js.Any.undefined_of_option Js.Any.of_int) offset in
    Js.to_unit (Js.meth_call this "set" [| array; offset |])

  let set ~typed_array ?offset this =
    let typed_array = Js.to_any typed_array in
    let offset = (Js.Any.undefined_of_option Js.Any.of_int) offset in
    Js.to_unit (Js.meth_call this "set" [| typed_array; offset |])

  let slice ~start ~end' this =
    let start = Js.Any.of_int start in
    let end' = Js.Any.of_int end' in
    Js.of_any (Js.meth_call this "slice" [| start; end' |])

  let some ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.Any.to_bool (Js.meth_call this "some" [| callbackfn; this_arg |])

  let sort ~comparefn this =
    let comparefn = Js.to_any comparefn in
    Js.to_unit (Js.meth_call this "sort" [| comparefn |])

  let subarray ?begin' ?end' this =
    let begin' = (Js.Any.undefined_of_option Js.Any.of_int) begin' in
    let end' = (Js.Any.undefined_of_option Js.Any.of_int) end' in
    Js.of_any (Js.meth_call this "subarray" [| begin'; end' |])

  let to_locale_string this =
    Js.Any.to_string (Js.meth_call this "toLocaleString" [||])

  let to_string this = Js.Any.to_string (Js.meth_call this "toString" [||])
  let values this = Js.of_any (Js.meth_call this "values" [||])
  let bytes_per_element this = Js.Any.to_int (Js.get this "BYTES_PER_ELEMENT")

  let set_bytes_per_element this x =
    Js.set this "BYTES_PER_ELEMENT" (Js.Any.of_int x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TypedArray} \
   [TypedArray] on MDN}."]

and Int8_array : sig
  type t = [ `Int8_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Int8Array} [Int8Array]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Int8_array ] Js.t

  let t = Js.raw "Int8Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Int8Array} \
   [Int8Array] on MDN}."]

and Uint8_array : sig
  type t = [ `Uint8_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint8Array} \
     [Uint8Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint8_array ] Js.t

  let t = Js.raw "Uint8Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint8Array} \
   [Uint8Array] on MDN}."]

and Uint8_clamped_array : sig
  type t = [ `Uint8_clamped_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint8ClampedArray} \
     [Uint8ClampedArray]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint8_clamped_array ] Js.t

  let t = Js.raw "Uint8ClampedArray"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint8ClampedArray} \
   [Uint8ClampedArray] on MDN}."]

and Int16_array : sig
  type t = [ `Int16_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Int16Array} \
     [Int16Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Int16_array ] Js.t

  let t = Js.raw "Int16Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Int16Array} \
   [Int16Array] on MDN}."]

and Uint16_array : sig
  type t = [ `Uint16_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint16Array} \
     [Uint16Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint16_array ] Js.t

  let t = Js.raw "Uint16Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint16Array} \
   [Uint16Array] on MDN}."]

and Int32_array : sig
  type t = [ `Int32_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Int32Array} \
     [Int32Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Int32_array ] Js.t

  let t = Js.raw "Int32Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Int32Array} \
   [Int32Array] on MDN}."]

and Uint32_array : sig
  type t = [ `Uint32_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Uint32Array} \
     [Uint32Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Uint32_array ] Js.t

  let t = Js.raw "Uint32Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Uint32Array} \
   [Uint32Array] on MDN}."]

and Float32_array : sig
  type t = [ `Float32_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Float32Array} \
     [Float32Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Float32_array ] Js.t

  let t = Js.raw "Float32Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Float32Array} \
   [Float32Array] on MDN}."]

and Float64_array : sig
  type t = [ `Float64_array ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Float64Array} \
     [Float64Array]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
  val make : arg_list:Js.any array -> unit -> t
  val make : length:int -> unit -> t
  val make : array:'todo_buffer -> unit -> t
  val make : obj:Js.object' -> unit -> t

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t
end = struct
  type t = [ `Float64_array ] Js.t

  let t = Js.raw "Float64Array"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let make ~arg_list () =
    let arg_list = (Js.Any.of_array Js.of_any) arg_list in
    Js.obj_new t [| arg_list |]

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let make ~array () =
    let array = to_any array in
    Js.obj_new t [| array |]

  let make ~obj () =
    let obj = Js.to_any obj in
    Js.obj_new t [| obj |]

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Float64Array} \
   [Float64Array] on MDN}."]

and Map : sig
  type t = [ `Map ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Map} [Map]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?iterable:Js.object' -> unit -> t

  val clear : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/clear} \
     [clear] on MDN}."]

  val delete : key:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/delete} \
     [delete] on MDN}."]

  val entries : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/entries} \
     [entries] on MDN}."]

  val for_each : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/forEach} \
     [forEach] on MDN}."]

  val get : key:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/get} [get] \
     on MDN}."]

  val has : key:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/has} [has] \
     on MDN}."]

  val keys : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/keys} [keys] \
     on MDN}."]

  val set : key:Js.any -> value:Js.any -> t -> t
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

  val values : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map/values} \
     [values] on MDN}."]
end = struct
  type t = [ `Map ] Js.t

  let t = Js.raw "Map"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?iterable () =
    let iterable = (Js.Any.undefined_of_option Js.to_any) iterable in
    Js.obj_new t [| iterable |]

  let clear this = Js.to_unit (Js.meth_call this "clear" [||])

  let delete ~key this =
    let key = Js.of_any key in
    Js.Any.to_bool (Js.meth_call this "delete" [| key |])

  let entries this = Js.of_any (Js.meth_call this "entries" [||])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.to_unit (Js.meth_call this "forEach" [| callbackfn; this_arg |])

  let get ~key this =
    let key = Js.of_any key in
    Js.to_unit (Js.meth_call this "get" [| key |])

  let has ~key this =
    let key = Js.of_any key in
    Js.Any.to_bool (Js.meth_call this "has" [| key |])

  let keys this = Js.of_any (Js.meth_call this "keys" [||])

  let set ~key ~value this =
    let key = Js.of_any key in
    let value = Js.of_any value in
    of_any (Js.meth_call this "set" [| key; value |])

  let size this = Js.Any.to_int (Js.get this "size")
  let set_size this x = Js.set this "size" (Js.Any.of_int x)
  let values this = Js.of_any (Js.meth_call this "values" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Map} [Map] on MDN}."]

and Set : sig
  type t = [ `Set ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Set} [Set]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?input:Iterator.t -> unit -> t

  val add : value:Js.any -> t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/add} [add] \
     on MDN}."]

  val clear : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/clear} \
     [clear] on MDN}."]

  val delete : value:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/delete} \
     [delete] on MDN}."]

  val entries : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/entries} \
     [entries] on MDN}."]

  val for_each : callbackfn:Js.object' -> ?this_arg:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/forEach} \
     [forEach] on MDN}."]

  val has : value:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/has} [has] \
     on MDN}."]

  val keys : t -> Js.object'
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

  val values : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set/values} \
     [values] on MDN}."]
end = struct
  type t = [ `Set ] Js.t

  let t = Js.raw "Set"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?input () =
    let input = (Js.Any.undefined_of_option Iterator.to_any) input in
    Js.obj_new t [| input |]

  let add ~value this =
    let value = Js.of_any value in
    Js.of_any (Js.meth_call this "add" [| value |])

  let clear this = Js.to_unit (Js.meth_call this "clear" [||])

  let delete ~value this =
    let value = Js.of_any value in
    Js.Any.to_bool (Js.meth_call this "delete" [| value |])

  let entries this = Js.of_any (Js.meth_call this "entries" [||])

  let for_each ~callbackfn ?this_arg this =
    let callbackfn = Js.to_any callbackfn in
    let this_arg = (Js.Any.undefined_of_option Js.of_any) this_arg in
    Js.to_unit (Js.meth_call this "forEach" [| callbackfn; this_arg |])

  let has ~value this =
    let value = Js.of_any value in
    Js.Any.to_bool (Js.meth_call this "has" [| value |])

  let keys this = Js.of_any (Js.meth_call this "keys" [||])
  let size this = Js.Any.to_int (Js.get this "size")
  let set_size this x = Js.set this "size" (Js.Any.of_int x)
  let values this = Js.of_any (Js.meth_call this "values" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Set} [Set] on MDN}."]

and Weak_map : sig
  type t = [ `Weak_map ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WeakMap} [WeakMap]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?iterable:Js.object' -> unit -> t

  val delete : key:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/delete} \
     [delete] on MDN}."]

  val get : key:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/get} \
     [get] on MDN}."]

  val has : key:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/has} \
     [has] on MDN}."]

  val set : key:Js.any -> value:Js.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap/set} \
     [set] on MDN}."]
end = struct
  type t = [ `Weak_map ] Js.t

  let t = Js.raw "WeakMap"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?iterable () =
    let iterable = (Js.Any.undefined_of_option Js.to_any) iterable in
    Js.obj_new t [| iterable |]

  let delete ~key this =
    let key = Js.of_any key in
    Js.Any.to_bool (Js.meth_call this "delete" [| key |])

  let get ~key this =
    let key = Js.of_any key in
    Js.to_unit (Js.meth_call this "get" [| key |])

  let has ~key this =
    let key = Js.of_any key in
    Js.Any.to_bool (Js.meth_call this "has" [| key |])

  let set ~key ~value this =
    let key = Js.of_any key in
    let value = Js.of_any value in
    of_any (Js.meth_call this "set" [| key; value |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakMap} [WeakMap] \
   on MDN}."]

and Weak_set : sig
  type t = [ `Weak_set ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WeakSet} [WeakSet]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : ?iterable:Js.object' -> unit -> t

  val add : value:Js.any -> t -> t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet/add} \
     [add] on MDN}."]

  val delete : value:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet/delete} \
     [delete] on MDN}."]

  val has : value:Js.any -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet/has} \
     [has] on MDN}."]
end = struct
  type t = [ `Weak_set ] Js.t

  let t = Js.raw "WeakSet"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ?iterable () =
    let iterable = (Js.Any.undefined_of_option Js.to_any) iterable in
    Js.obj_new t [| iterable |]

  let add ~value this =
    let value = Js.of_any value in
    of_any (Js.meth_call this "add" [| value |])

  let delete ~value this =
    let value = Js.of_any value in
    Js.Any.to_bool (Js.meth_call this "delete" [| value |])

  let has ~value this =
    let value = Js.of_any value in
    Js.Any.to_bool (Js.meth_call this "has" [| value |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WeakSet} [WeakSet] \
   on MDN}."]

and Array_buffer : sig
  type t = [ `Array_buffer ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer} \
     [ArrayBuffer]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : length:int -> unit -> t

  val is_view : arg:Js.any -> unit -> bool
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
  type t = [ `Array_buffer ] Js.t

  let t = Js.raw "ArrayBuffer"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let is_view ~arg () =
    let arg = Js.of_any arg in
    Js.Any.to_bool (Js.meth_call t "isView" [| arg |])

  let byte_length this = Js.Any.to_int (Js.get this "byteLength")
  let set_byte_length this x = Js.set this "byteLength" (Js.Any.of_int x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ArrayBuffer} \
   [ArrayBuffer] on MDN}."]

and Shared_array_buffer : sig
  type t = [ `Shared_array_buffer ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer} \
     [SharedArrayBuffer]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
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
  type t = [ `Shared_array_buffer ] Js.t

  let t = Js.raw "SharedArrayBuffer"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ~length () =
    let length = Js.Any.of_int length in
    Js.obj_new t [| length |]

  let byte_length this = Js.Any.to_int (Js.get this "byteLength")
  let set_byte_length this x = Js.set this "byteLength" (Js.Any.of_int x)

  let slice ~start ~end' this =
    let start = Js.Any.of_int start in
    let end' = Js.Any.of_int end' in
    of_any (Js.meth_call this "slice" [| start; end' |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SharedArrayBuffer} \
   [SharedArrayBuffer] on MDN}."]

and Data_view : sig
  type t = [ `Data_view ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataView} [DataView]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val with_buffer_and_byte_offset_and_byte_length :
    buffer:Js.object' -> ?byte_offset:int -> ?byte_length:int -> unit -> t

  val buffer : t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DataView/buffer} \
     [buffer] on MDN}."]

  val set_buffer : t -> Js.object' -> unit
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
  type t = [ `Data_view ] Js.t

  let t = Js.raw "DataView"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let with_buffer_and_byte_offset_and_byte_length ~buffer ?byte_offset
      ?byte_length () =
    let buffer = Js.to_any buffer in
    let byte_offset = (Js.Any.undefined_of_option Js.Any.of_int) byte_offset in
    let byte_length = (Js.Any.undefined_of_option Js.Any.of_int) byte_length in
    Js.obj_new t [| buffer; byte_offset; byte_length |]

  let buffer this = Js.of_any (Js.get this "buffer")
  let set_buffer this x = Js.set this "buffer" (Js.to_any x)
  let byte_length this = Js.Any.to_int (Js.get this "byteLength")
  let set_byte_length this x = Js.set this "byteLength" (Js.Any.of_int x)
  let byte_offset this = Js.Any.to_int (Js.get this "byteOffset")
  let set_byte_offset this x = Js.set this "byteOffset" (Js.Any.of_int x)

  let get_float32 ~byte_offset ?little_endian this =
    let byte_offset = Js.Any.of_float byte_offset in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.Any.to_float
      (Js.meth_call this "getFloat32" [| byte_offset; little_endian |])

  let get_float64 ~byte_offset ?little_endian this =
    let byte_offset = Js.Any.of_float byte_offset in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.Any.to_float
      (Js.meth_call this "getFloat64" [| byte_offset; little_endian |])

  let get_int16 ~byte_offset ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.Any.to_int (Js.meth_call this "getInt16" [| byte_offset; little_endian |])

  let get_int32 ~byte_offset ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.Any.to_int (Js.meth_call this "getInt32" [| byte_offset; little_endian |])

  let get_uint16 ~byte_offset ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.Any.to_int
      (Js.meth_call this "getUint16" [| byte_offset; little_endian |])

  let get_uint32 ~byte_offset ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.Any.to_int
      (Js.meth_call this "getUint32" [| byte_offset; little_endian |])

  let set_float32 ~byte_offset ~value ?little_endian this =
    let byte_offset = Js.Any.of_float byte_offset in
    let value = Js.Any.of_float value in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.to_unit
      (Js.meth_call this "setFloat32" [| byte_offset; value; little_endian |])

  let set_float64 ~byte_offset ~value ?little_endian this =
    let byte_offset = Js.Any.of_float byte_offset in
    let value = Js.Any.of_float value in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.to_unit
      (Js.meth_call this "setFloat64" [| byte_offset; value; little_endian |])

  let set_int16 ~byte_offset ~value ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let value = Js.Any.of_int value in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.to_unit
      (Js.meth_call this "setInt16" [| byte_offset; value; little_endian |])

  let set_int32 ~byte_offset ~value ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let value = Js.Any.of_int value in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.to_unit
      (Js.meth_call this "setInt32" [| byte_offset; value; little_endian |])

  let set_uint16 ~byte_offset ~value ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let value = Js.Any.of_int value in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.to_unit
      (Js.meth_call this "setUint16" [| byte_offset; value; little_endian |])

  let set_uint32 ~byte_offset ~value ?little_endian this =
    let byte_offset = Js.Any.of_int byte_offset in
    let value = Js.Any.of_int value in
    let little_endian =
      (Js.Any.undefined_of_option Js.Any.of_bool) little_endian
    in
    Js.to_unit
      (Js.meth_call this "setUint32" [| byte_offset; value; little_endian |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DataView} \
   [DataView] on MDN}."]

and Json : sig
  type t = [ `Json ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/JSON} [JSON]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val parse : text:string -> ?reviver:Js.object' -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/JSON/parse} \
     [parse] on MDN}."]

  val stringify :
    value:Js.object' -> ?replacer:Js.object' -> ?space:Js.object' -> t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/JSON/stringify} \
     [stringify] on MDN}."]
end = struct
  type t = [ `Json ] Js.t

  let t = Js.raw "JSON"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let parse ~text ?reviver () =
    let text = Js.Any.of_string text in
    let reviver = (Js.Any.undefined_of_option Js.to_any) reviver in
    Js.of_any (Js.meth_call t "parse" [| text; reviver |])

  let stringify ~value ?replacer ?space this =
    let value = Js.to_any value in
    let replacer = (Js.Any.undefined_of_option Js.to_any) replacer in
    let space = (Js.Any.undefined_of_option Js.to_any) space in
    Js.Any.to_string (Js.meth_call this "stringify" [| value; replacer; space |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/JSON} [JSON] on \
   MDN}."]

and Iterator : sig
  type t = [ `Iterator ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Iterator} [Iterator]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = [ `Iterator ] Js.t

  let t = Js.raw "Iterator"
  let to_any = Js.to_any
  let of_any = Js.of_any
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Iterator} \
   [Iterator] on MDN}."]

and Promise : sig
  type t = [ `Promise ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Promise} [Promise]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : executor:Js.object' -> unit -> t

  val all : iterable:Js.object' -> unit -> Js.any Js.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/all} \
     [all] on MDN}."]

  val race : iterable:Js.object' -> unit -> Js.any Js.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/race} \
     [race] on MDN}."]

  val reject : r:Js.object' -> unit -> Js.any Js.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/reject} \
     [reject] on MDN}."]

  val resolve : x:Js.object' -> unit -> Js.any Js.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/resolve} \
     [resolve] on MDN}."]

  val catch : on_rejected:Js.object' -> t -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/catch} \
     [catch] on MDN}."]

  val then' :
    on_fulfilled:Js.object' -> on_reject:Js.object' -> t -> Js.any Js.promise
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise/then} \
     [then] on MDN}."]
end = struct
  type t = [ `Promise ] Js.t

  let t = Js.raw "Promise"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ~executor () =
    let executor = Js.to_any executor in
    Js.obj_new t [| executor |]

  let all ~iterable () =
    let iterable = Js.to_any iterable in
    (Js.Promise.of_any Js.to_any) (Js.meth_call t "all" [| iterable |])

  let race ~iterable () =
    let iterable = Js.to_any iterable in
    (Js.Promise.of_any Js.to_any) (Js.meth_call t "race" [| iterable |])

  let reject ~r () =
    let r = Js.to_any r in
    (Js.Promise.of_any Js.to_any) (Js.meth_call t "reject" [| r |])

  let resolve ~x () =
    let x = Js.to_any x in
    (Js.Promise.of_any Js.to_any) (Js.meth_call t "resolve" [| x |])

  let catch ~on_rejected this =
    let on_rejected = Js.to_any on_rejected in
    Js.of_any (Js.meth_call this "catch" [| on_rejected |])

  let then' ~on_fulfilled ~on_reject this =
    let on_fulfilled = Js.to_any on_fulfilled in
    let on_reject = Js.to_any on_reject in
    (Js.Promise.of_any Js.to_any)
      (Js.meth_call this "then" [| on_fulfilled; on_reject |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Promise} [Promise] \
   on MDN}."]

and Reflect : sig
  type t = [ `Reflect ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect} [Reflect]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val apply :
    target:Js.object' ->
    this_argument:Js.any ->
    argument_list:Js.any array ->
    unit ->
    Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/apply} \
     [apply] on MDN}."]

  val define_property :
    target:Js.object' ->
    property_key:string ->
    argument_list:Js.any array ->
    unit ->
    Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/defineProperty} \
     [defineProperty] on MDN}."]

  val delete_property :
    target:Js.object' -> property_key:string -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/deleteProperty} \
     [deleteProperty] on MDN}."]

  val get :
    target:Js.object' ->
    property_key:string ->
    ?reciever:Js.object' ->
    unit ->
    Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/get} \
     [get] on MDN}."]

  val get_own_property_descriptor :
    target:Js.object' -> property_key:string -> unit -> Property_descriptor.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/getOwnPropertyDescriptor} \
     [getOwnPropertyDescriptor] on MDN}."]

  val get_prototype_of : target:Js.object' -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/getPrototypeOf} \
     [getPrototypeOf] on MDN}."]

  val has : target:Js.object' -> property_key:string -> unit -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/has} \
     [has] on MDN}."]

  val is_extensible : target:Js.object' -> unit -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/isExtensible} \
     [isExtensible] on MDN}."]

  val own_keys : target:Js.object' -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/ownKeys} \
     [ownKeys] on MDN}."]

  val prevent_extensions : target:Js.object' -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/preventExtensions} \
     [preventExtensions] on MDN}."]

  val set :
    target:Js.object' ->
    property_key:string ->
    v:Js.any ->
    ?reciever:Js.object' ->
    unit ->
    Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect/set} \
     [set] on MDN}."]

  val set_prototype_of :
    target:Js.object' -> proto:Js.object' -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Reflect/setPrototypeOf} \
     [setPrototypeOf] on MDN}."]
end = struct
  type t = [ `Reflect ] Js.t

  let t = Js.raw "Reflect"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let apply ~target ~this_argument ~argument_list () =
    let target = Js.to_any target in
    let this_argument = Js.of_any this_argument in
    let argument_list = (Js.Any.of_array Js.of_any) argument_list in
    Js.of_any (Js.meth_call t "apply" [| target; this_argument; argument_list |])

  let define_property ~target ~property_key ~argument_list () =
    let target = Js.to_any target in
    let property_key = Js.Any.of_string property_key in
    let argument_list = (Js.Any.of_array Js.of_any) argument_list in
    Js.of_any
      (Js.meth_call t "defineProperty" [| target; property_key; argument_list |])

  let delete_property ~target ~property_key () =
    let target = Js.to_any target in
    let property_key = Js.Any.of_string property_key in
    Js.of_any (Js.meth_call t "deleteProperty" [| target; property_key |])

  let get ~target ~property_key ?reciever () =
    let target = Js.to_any target in
    let property_key = Js.Any.of_string property_key in
    let reciever = (Js.Any.undefined_of_option Js.to_any) reciever in
    Js.of_any (Js.meth_call t "get" [| target; property_key; reciever |])

  let get_own_property_descriptor ~target ~property_key () =
    let target = Js.to_any target in
    let property_key = Js.Any.of_string property_key in
    Property_descriptor.of_any
      (Js.meth_call t "getOwnPropertyDescriptor" [| target; property_key |])

  let get_prototype_of ~target () =
    let target = Js.to_any target in
    Js.of_any (Js.meth_call t "getPrototypeOf" [| target |])

  let has ~target ~property_key () =
    let target = Js.to_any target in
    let property_key = Js.Any.of_string property_key in
    Js.Any.to_bool (Js.meth_call t "has" [| target; property_key |])

  let is_extensible ~target () =
    let target = Js.to_any target in
    Js.Any.to_bool (Js.meth_call t "isExtensible" [| target |])

  let own_keys ~target () =
    let target = Js.to_any target in
    Js.of_any (Js.meth_call t "ownKeys" [| target |])

  let prevent_extensions ~target () =
    let target = Js.to_any target in
    Js.of_any (Js.meth_call t "preventExtensions" [| target |])

  let set ~target ~property_key ~v ?reciever () =
    let target = Js.to_any target in
    let property_key = Js.Any.of_string property_key in
    let v = Js.of_any v in
    let reciever = (Js.Any.undefined_of_option Js.to_any) reciever in
    Js.of_any (Js.meth_call t "set" [| target; property_key; v; reciever |])

  let set_prototype_of ~target ~proto () =
    let target = Js.to_any target in
    let proto = Js.to_any proto in
    Js.of_any (Js.meth_call t "setPrototypeOf" [| target; proto |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Reflect} [Reflect] \
   on MDN}."]

and Proxy : sig
  type t = [ `Proxy ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Proxy} [Proxy]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val with_target_and_handler :
    target:Js.object' -> handler:Js.object' -> unit -> t

  val revocable : target:Js.object' -> handler:Js.object' -> unit -> Js.object'
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Proxy/revocable} \
     [revocable] on MDN}."]
end = struct
  type t = [ `Proxy ] Js.t

  let t = Js.raw "Proxy"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let with_target_and_handler ~target ~handler () =
    let target = Js.to_any target in
    let handler = Js.to_any handler in
    Js.obj_new t [| target; handler |]

  let revocable ~target ~handler () =
    let target = Js.to_any target in
    let handler = Js.to_any handler in
    Js.of_any (Js.meth_call t "revocable" [| target; handler |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Proxy} [Proxy] on \
   MDN}."]

and Intl : sig
  val collator : Collator.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Intl/Collator} \
     [Collator] on MDN}."]

  val date_time_format : Js.object'
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Intl/DateTimeFormat} \
     [DateTimeFormat] on MDN}."]

  val number_format : Js.object'
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
  let t = Js.global "Intl" `Object
  let collator = Collator.of_any (Js.get t "Collator")
  let date_time_format = Js.of_any (Js.get t "DateTimeFormat")
  let number_format = Js.of_any (Js.get t "NumberFormat")

  let get_canonical_locales ~locales () =
    let locales = (Js.Any.of_array Js.Any.of_string) locales in
    (Js.Any.to_array Js.Any.to_string)
      (Js.meth_call t "getCanonicalLocales" [| locales |])
end

and Collator : sig
  type t = [ `Collator ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Collator} [Collator]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val with_locales_and_options :
    ?locales:[< `String | `Sequence ] Js.t ->
    ?options:Collator_init.t ->
    unit ->
    t

  val supported_locales_of :
    locales:[< `String | `Sequence ] Js.t ->
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
  type t = [ `Collator ] Js.t

  let t = Js.raw "Collator"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let with_locales_and_options ?locales ?options () =
    let locales = (Js.Any.undefined_of_option Js.to_any) locales in
    let options = (Js.Any.undefined_of_option Collator_init.to_any) options in
    Js.obj_new t [| locales; options |]

  let supported_locales_of ~locales ?options () =
    let locales = Js.to_any locales in
    let options =
      (Js.Any.undefined_of_option Supported_locales_options.to_any) options
    in
    (Js.Any.to_array Js.Any.to_string)
      (Js.meth_call t "supportedLocalesOf" [| locales; options |])

  let compare ~string1 ~string2 this =
    let string1 = Js.Any.of_string string1 in
    let string2 = Js.Any.of_string string2 in
    Js.Any.to_bool (Js.meth_call this "compare" [| string1; string2 |])

  let resolved_options this =
    Collator_options.of_any (Js.meth_call this "resolvedOptions" [||])
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

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val locale : t -> string option
  val usage : t -> Collator_usage.t option
  val sensitivity : t -> Collator_sensitivity.t option
  val ignore_punctuation : t -> bool option
  val collation : t -> string option
  val numeric : t -> bool option
  val case_first : t -> Collator_case.t option
end = struct
  type t = Js.any

  let make ?locale ?usage ?sensitivity ?ignore_punctuation ?collation ?numeric
      ?case_first () =
    let locale = (Js.Any.nullable_of_option Js.Any.of_string) locale in
    let usage = (Js.Any.nullable_of_option Collator_usage.to_any) usage in
    let sensitivity =
      (Js.Any.nullable_of_option Collator_sensitivity.to_any) sensitivity
    in
    let ignore_punctuation =
      (Js.Any.nullable_of_option Js.Any.of_bool) ignore_punctuation
    in
    let collation = (Js.Any.nullable_of_option Js.Any.of_string) collation in
    let numeric = (Js.Any.nullable_of_option Js.Any.of_bool) numeric in
    let case_first =
      (Js.Any.nullable_of_option Collator_case.to_any) case_first
    in
    Js.obj
      [|
        ("locale", locale);
        ("usage", usage);
        ("sensitivity", sensitivity);
        ("ignorePunctuation", ignore_punctuation);
        ("collation", collation);
        ("numeric", numeric);
        ("caseFirst", case_first);
      |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let locale this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "locale")

  let usage this =
    (Js.Any.nullable_to_option Collator_usage.of_any) (Js.get this "usage")

  let sensitivity this =
    (Js.Any.nullable_to_option Collator_sensitivity.of_any)
      (Js.get this "sensitivity")

  let ignore_punctuation this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "ignorePunctuation")

  let collation this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "collation")

  let numeric this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "numeric")

  let case_first this =
    (Js.Any.nullable_to_option Collator_case.of_any) (Js.get this "caseFirst")
end

and Collator_sensitivity : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val base : t [@@ocaml.doc "The [base] enum value."]

  val accent : t [@@ocaml.doc "The [accent] enum value."]

  val case : t [@@ocaml.doc "The [case] enum value."]

  val variant : t [@@ocaml.doc "The [variant] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let base = Js.of_string "base"
  let accent = Js.of_string "accent"
  let case = Js.of_string "case"
  let variant = Js.of_string "variant"
end

and Collator_case : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val upper : t [@@ocaml.doc "The [upper] enum value."]

  val lowe : t [@@ocaml.doc "The [lowe] enum value."]

  val false' : t [@@ocaml.doc "The [false] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let upper = Js.of_string "upper"
  let lowe = Js.of_string "lowe"
  let false' = Js.of_string "false"
end

and Collator_locale_matcher : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val lookup : t [@@ocaml.doc "The [lookup] enum value."]

  val best_fit : t [@@ocaml.doc "The [best fit] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let lookup = Js.of_string "lookup"
  let best_fit = Js.of_string "best fit"
end

and Collator_usage : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val sort : t [@@ocaml.doc "The [sort] enum value."]

  val search : t [@@ocaml.doc "The [search] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let sort = Js.of_string "sort"
  let search = Js.of_string "search"
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

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val usage : t -> Collator_usage.t option
  val locale_matcher : t -> Collator_locale_matcher.t option
  val collation : t -> string option
  val numeric : t -> bool option
  val case_first : t -> Collator_case.t option
  val sensitivity : t -> Collator_sensitivity.t option
  val ignore_punctuation : t -> bool option
end = struct
  type t = Js.any

  let make ?usage ?locale_matcher ?collation ?numeric ?case_first ?sensitivity
      ?ignore_punctuation () =
    let usage = (Js.Any.nullable_of_option Collator_usage.to_any) usage in
    let locale_matcher =
      (Js.Any.nullable_of_option Collator_locale_matcher.to_any) locale_matcher
    in
    let collation = (Js.Any.nullable_of_option Js.Any.of_string) collation in
    let numeric = (Js.Any.nullable_of_option Js.Any.of_bool) numeric in
    let case_first =
      (Js.Any.nullable_of_option Collator_case.to_any) case_first
    in
    let sensitivity =
      (Js.Any.nullable_of_option Collator_sensitivity.to_any) sensitivity
    in
    let ignore_punctuation =
      (Js.Any.nullable_of_option Js.Any.of_bool) ignore_punctuation
    in
    Js.obj
      [|
        ("usage", usage);
        ("localeMatcher", locale_matcher);
        ("collation", collation);
        ("numeric", numeric);
        ("caseFirst", case_first);
        ("sensitivity", sensitivity);
        ("ignorePunctuation", ignore_punctuation);
      |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let usage this =
    (Js.Any.nullable_to_option Collator_usage.of_any) (Js.get this "usage")

  let locale_matcher this =
    (Js.Any.nullable_to_option Collator_locale_matcher.of_any)
      (Js.get this "localeMatcher")

  let collation this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "collation")

  let numeric this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "numeric")

  let case_first this =
    (Js.Any.nullable_to_option Collator_case.of_any) (Js.get this "caseFirst")

  let sensitivity this =
    (Js.Any.nullable_to_option Collator_sensitivity.of_any)
      (Js.get this "sensitivity")

  let ignore_punctuation this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "ignorePunctuation")
end

and Supported_locales_options : sig
  type t [@@ocaml.doc "The type for the [SupportedLocalesOptions] dictionary."]

  val make : ?locale_matcher:Collator_locale_matcher.t -> unit -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val locale_matcher : t -> Collator_locale_matcher.t option
end = struct
  type t = Js.any

  let make ?locale_matcher () =
    let locale_matcher =
      (Js.Any.nullable_of_option Collator_locale_matcher.to_any) locale_matcher
    in
    Js.obj [| ("localeMatcher", locale_matcher) |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let locale_matcher this =
    (Js.Any.nullable_to_option Collator_locale_matcher.of_any)
      (Js.get this "localeMatcher")
end
