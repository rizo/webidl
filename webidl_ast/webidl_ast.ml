(* a list with at least two elements *)
type 'a list2 = 'a * 'a * 'a list

(* https://webidl.spec.whatwg.org/#prod-StringType *)
type string_type = [ `Byte_string | `Dom_string | `Usv_string ]

(* https://webidl.spec.whatwg.org/#index-prod-ConstValue *)
type const_value = [ `Bool of bool | `Float of float | `Int of int ]

(* https://webidl.spec.whatwg.org/#prod-IntegerType *)
type integer_type = [ `Short | `Long | `Long_long ]

(* https://webidl.spec.whatwg.org/#prod-UnsignedIntegerType *)
type unsigned_integer_type = [ `Unsigned of integer_type | integer_type ]

(* https://webidl.spec.whatwg.org/#prod-FloatType *)
type float_type = [ `Float | `Double ]

let string_of_float_type = function
  | `Float -> "float"
  | `Double -> "double"

(* https://webidl.spec.whatwg.org/#prod-UnrestrictedFloatType *)
type unrestricted_float_type = [ float_type | `Unrestricted of float_type ]

(* https://webidl.spec.whatwg.org/#prod-DefaultValue *)
and default_value =
  [ `Const of const_value
  | `String of string
  | `Empty_sequence
  | `Empty_object
  | `Null
  | `Undefined ]

(* https://webidl.spec.whatwg.org/#prod-ArgumentNameKeyword *)
type argument_name_keyword =
  [ `Async
  | `Attribute
  | `Callback
  | `Const
  | `Constructor
  | `Deleter
  | `Dictionary
  | `Enum
  | `Getter
  | `Includes
  | `Inherit
  | `Interface
  | `Iterable
  | `Maplike
  | `Mixin
  | `Namespace
  | `Partial
  | `Readonly
  | `Required
  | `Setlike
  | `Setter
  | `Static
  | `Stringifier
  | `Typedef
  | `Unrestricted ]

let string_of_argument_name_keyword = function
  | `Async -> "async"
  | `Attribute -> "attribute"
  | `Callback -> "callback"
  | `Const -> "const"
  | `Constructor -> "constructor"
  | `Deleter -> "deleter"
  | `Dictionary -> "dictionary"
  | `Enum -> "enum"
  | `Getter -> "getter"
  | `Includes -> "includes"
  | `Inherit -> "inherit"
  | `Interface -> "interface"
  | `Iterable -> "iterable"
  | `Maplike -> "maplike"
  | `Mixin -> "mixin"
  | `Namespace -> "namespace"
  | `Partial -> "partial"
  | `Readonly -> "readonly"
  | `Required -> "required"
  | `Setlike -> "setlike"
  | `Setter -> "setter"
  | `Static -> "static"
  | `Stringifier -> "stringifier"
  | `Typedef -> "typedef"
  | `Unrestricted -> "unrestricted"

(* https://webidl.spec.whatwg.org/#prod-ArgumentName *)
type argument_name = [ `Ident of string | `Keyword of argument_name_keyword ]

let string_of_argument_name argument_name =
  match argument_name with
  | `Ident name -> name
  | `Keyword kwd -> string_of_argument_name_keyword kwd

let string_of_argument arg =
  match arg with
  | `Optional (name, _, _) | `Variadic (name, _) | `Fixed (name, _) ->
    string_of_argument_name name

(* https://webidl.spec.whatwg.org/#prod-BufferRelatedType *)
type buffer_type =
  [ `ArrayBuffer
  | `SharedArrayBuffer
  | `DataView
  | `Int8Array
  | `Int16Array
  | `Int32Array
  | `Uint8Array
  | `Uint16Array
  | `Uint32Array
  | `Uint8ClampedArray
  | `BigInt64Array
  | `BigUint64Array
  | `Float16Array
  | `Float32Array
  | `Float64Array ]

let string_of_buffer_type = function
  | `ArrayBuffer -> "ArrayBuffer"
  | `SharedArrayBuffer -> "SharedArrayBuffer"
  | `DataView -> "DataView"
  | `Int8Array -> "Int8Array"
  | `Int16Array -> "Int16Array"
  | `Int32Array -> "Int32Array"
  | `Uint8Array -> "Uint8Array"
  | `Uint16Array -> "Uint16Array"
  | `Uint32Array -> "Uint32Array"
  | `Uint8ClampedArray -> "Uint8ClampedArray"
  | `BigInt64Array -> "BigInt64Array"
  | `BigUint64Array -> "BigUint64Array"
  | `Float16Array -> "Float16Array"
  | `Float32Array -> "Float32Array"
  | `Float64Array -> "Float64Array"

(* https://webidl.spec.whatwg.org/#prod-PrimitiveType *)
type primitive_type =
  [ unsigned_integer_type
  | unrestricted_float_type
  | `Boolean
  | `Byte
  | `Octet
  | `Bigint ]

(* https://webidl.spec.whatwg.org/#prod-TypeWithExtendedAttributes *)
type type_ext = extended_attributes * type_

(* https://webidl.spec.whatwg.org/#prod-Type *)
and type_ =
  [ `Distinguishable of distinguishable_type * bool
  | `Any
  | `Promise of type_
  | `Union of union_member_type list2 * bool ]

and distinguishable_type =
  [ primitive_type
  | string_type
  | `Name of string
  | `Sequence of type_ext
  | `Object
  | `Symbol
  | buffer_type
  | `Frozen_array of type_ext
  | `Observable_array of type_ext
  | `Record of string_type * type_ext
  | `Undefined ]

and union_member_type =
  [ `Single of extended_attributes * distinguishable_type * bool
  | `Nested of union_member_type list2 * bool ]

(* https://webidl.spec.whatwg.org/#index-prod-ConstType *)
and const_type = [ primitive_type | `Name of string ]

(* https://webidl.spec.whatwg.org/#index-prod-ArgumentRest *)
and argument =
  [ `Optional of argument_name * type_ext * default_value option
  | `Variadic of argument_name * type_
  | `Fixed of argument_name * type_ ]

(* https://webidl.spec.whatwg.org/#prod-Argument *)
and argument_ext = extended_attributes * argument

(* https://webidl.spec.whatwg.org/#idl-extended-attributes *)
and extended_attribute =
  (* [identifier] *)
  | Ext_no_args of string
  (* [identifier ( ArgumentList )] *)
  | Ext_arg_list of string * argument_ext list
  (* [identifier = identifier] *)
  | Ext_ident of string * string
  (* [identifier = ( IdentifierList )] *)
  | Ext_ident_list of string * string list
  (* [identifier = *] *)
  | Ext_wildcard of string
  (* [identifier = identifier ( ArgumentList )] *)
  | Ext_named_arg_list of string * string * argument_ext list

(* https://webidl.spec.whatwg.org/#idl-extended-attributes *)
and extended_attributes = extended_attribute list

type special = Getter | Setter | Deleter

let argument_is_optional = function
  | `Optional _ -> true
  | _ -> false

let string_of_special = function
  | Getter -> "getter"
  | Setter -> "setter"
  | Deleter -> "deleter"

let is_getter = function
  | Getter -> true
  | _ -> false

let is_setter = function
  | Setter -> true
  | _ -> false

let is_deleter = function
  | Deleter -> true
  | _ -> false

let type_is_nullable (t : type_) =
  match t with
  | `Distinguishable (_, is_nullable) -> is_nullable
  | `Any -> false
  | `Promise _ -> false
  | `Union (_, is_nullable) -> is_nullable

let type_of_const_type (ct : const_type) : type_ =
  `Distinguishable ((ct :> distinguishable_type), false)

type constructor = (extended_attributes * argument) list

module Regular_operation = struct
  type t = {
    name : string option;
    type_ : type_;
    arguments : (extended_attributes * argument) list;
  }
end

module Special_operation = struct
  type t = {
    special : special;
    name : string option;
    type_ : type_;
    arguments : (extended_attributes * argument) list;
  }

  let is_getter t =
    match t.special with
    | Getter -> true
    | _ -> false

  let is_setter t =
    match t.special with
    | Setter -> true
    | _ -> false

  let is_deleter t =
    match t.special with
    | Deleter -> true
    | _ -> false
end

module Attribute = struct
  type t = { type_ : type_ext; name : string }
end

module Const = struct
  type t = { type_ : const_type; ident : string; value : const_value }
end

type maplike = { key_type : type_ext; value_type : type_ext }
type setlike = { value_type : type_ext }
type iterable = { value_type : type_ext; key_type : type_ext option }

module Static = struct
  type member =
    | Attribute of {
        attribute : Attribute.t;
        is_static : bool;
        is_readonly : bool;
      }
    | Regular_operation of {
        regular_operation : Regular_operation.t;
        is_static : bool;
      }
end

module Readonly = struct
  type member =
    | Attribute of { attribute : Attribute.t; is_readonly : bool }
    | Maplike of { maplike : maplike; is_readonly : bool }
    | Setlike of { setlike : setlike; is_readonly : bool }
end

module Namespace = struct
  type member =
    | Regular_operation of Regular_operation.t
    | Attribute of { attribute : Attribute.t; is_readonly : unit }
    | Const of Const.t

  type t = { name : string; members : (extended_attributes * member) list }
end

type async_iterable = {
  type1 : type_ext;
  type2 : type_ext option;
  arguments : argument_ext list;
}

module Stringifier = struct
  type t =
    (* TODO is_readonly *)
    | Attribute of { readonly : bool; attribute : Attribute.t }
    | Standalone
end

module Partial_interface = struct
  type member =
    | Const of Const.t
    | Regular_operation of {
        regular_operation : Regular_operation.t;
        is_static : bool;
      }
    | Special_operation of Special_operation.t
    | Stringifier of Stringifier.t
    | Iterable of iterable
    | Async_iterable of async_iterable
    | Attribute of {
        attribute : Attribute.t;
        is_static : bool;
        is_readonly : bool;
      }
    | Maplike of { maplike : maplike; is_readonly : bool }
    | Setlike of { setlike : setlike; is_readonly : bool }
    | Inherit_attribute of Attribute.t

  type t = { name : string; members : (extended_attributes * member) list }

  let of_static (static_member : Static.member) : member =
    match static_member with
    | Attribute { attribute; is_static; is_readonly } ->
      Attribute { attribute; is_static; is_readonly }
    | Regular_operation { regular_operation; is_static } ->
      Regular_operation { regular_operation; is_static }

  let of_readonly (readonly_member : Readonly.member) : member =
    match readonly_member with
    | Attribute { attribute; is_readonly } ->
      Attribute { attribute; is_static = false; is_readonly }
    | Maplike { maplike; is_readonly } -> Maplike { maplike; is_readonly }
    | Setlike { setlike; is_readonly } -> Setlike { setlike; is_readonly }
end

module Mixin = struct
  type member =
    | Const of Const.t
    | Regular_operation of Regular_operation.t
    | Stringifier of Stringifier.t
    | Attribute of { attribute : Attribute.t; is_readonly : bool }

  type t = { name : string; members : (extended_attributes * member) list }
end

module Callback_interface = struct
  type member = Const of Const.t | Regular_operation of Regular_operation.t
  type t = { name : string; members : (extended_attributes * member) list }
end

module Interface = struct
  type member =
    | Constructor of constructor
    | Const of Const.t
    | Regular_operation of {
        regular_operation : Regular_operation.t;
        is_static : bool;
      }
    | Special_operation of Special_operation.t
    | Stringifier of Stringifier.t
    | Iterable of iterable
    | Async_iterable of async_iterable
    | Attribute of {
        attribute : Attribute.t;
        is_static : bool;
        is_readonly : bool;
      }
    | Maplike of { maplike : maplike; is_readonly : bool }
    | Setlike of { setlike : setlike; is_readonly : bool }
    | Inherit_attribute of Attribute.t

  type t = {
    name : string;
    inherits : string option;
    members : (extended_attributes * member) list;
  }

  let of_partial_interface_member (member : Partial_interface.member) : member =
    match member with
    | Const x -> Const x
    | Regular_operation { regular_operation; is_static } ->
      Regular_operation { regular_operation; is_static }
    | Special_operation x -> Special_operation x
    | Stringifier x -> Stringifier x
    | Iterable x -> Iterable x
    | Async_iterable x -> Async_iterable x
    | Attribute { attribute; is_static; is_readonly } ->
      Attribute { attribute; is_static; is_readonly }
    | Maplike { maplike; is_readonly } -> Maplike { maplike; is_readonly }
    | Setlike { setlike; is_readonly } -> Setlike { setlike; is_readonly }
    | Inherit_attribute x -> Inherit_attribute x

  let of_mixin_member (member : Mixin.member) : member =
    match member with
    | Const x -> Const x
    | Regular_operation regular_operation ->
      Regular_operation { regular_operation; is_static = false }
    | Stringifier x -> Stringifier x
    | Attribute { attribute; is_readonly } ->
      Attribute { attribute; is_readonly; is_static = false }

  let of_callback_interface_member (member : Callback_interface.member) : member
      =
    match member with
    | Const x -> Const x
    | Regular_operation regular_operation ->
      Regular_operation { regular_operation; is_static = false }
end

module Dictionary = struct
  type member =
    | Required of type_ext * string
    | Optional of type_ * string * default_value option

  let member_name = function
    | Required (_, name) | Optional (_, name, _) -> name

  type t = {
    name : string;
    inherits : string option;
    members : (extended_attributes * member) list;
  }
end

module Partial_dictionary = struct
  type t = {
    name : string;
    members : (extended_attributes * Dictionary.member) list;
  }
end

module Partial = struct
  type t =
    | Interface of Partial_interface.t
    | Mixin of Mixin.t
    | Dictionary of Partial_dictionary.t
    | Namespace of Namespace.t
end

module Callback = struct
  type t = {
    name : string;
    return : type_;
    arguments : (extended_attributes * argument) list;
  }
end

module Enum = struct
  type t = { name : string; values : string list }
end

module Typedef = struct
  type t = { name : string; type_ : type_ext }
end

(* done *)
type definition =
  | Callback of Callback.t
  | Callback_interface of Callback_interface.t
  | Interface of Interface.t
  | Mixin of Mixin.t
  | Namespace of Namespace.t
  | Partial of Partial.t
  | Dictionary of Dictionary.t
  | Enum of Enum.t
  | Typedef of Typedef.t
  | Includes of string * string

type definitions = (extended_attributes * definition) list
