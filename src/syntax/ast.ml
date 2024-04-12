type primitive =
  [ `Boolean
  | `Byte
  | `Octet
  | `Unrestricted of [ `Float | `Double ]
  | `Float
  | `Double
  | `Unsigned of [ `Short | `Long | `LongLong ]
  | `Short
  | `Long
  | `LongLong ]

type string_type = [ `ByteString | `DOMString | `USVString ]

type buffer =
  [ `ArrayBuffer
  | `DataView
  | `Int8Array
  | `Int16Array
  | `Int32Array
  | `Uint8Array
  | `Uint16Array
  | `Uint32Array
  | `Uint8Clampedarray
  | `Float32Array
  | `Float64Array ]

type 'type_with_ext nullable_non_any_aux =
  [ primitive
  | string_type
  | `Ident of string
  | `Sequence of 'type_with_ext
  | `Object
  | `Error
  | `DomException
  | buffer
  | `FrozenArray of 'type_with_ext
  | `Record of string_type * 'type_with_ext ]

type ('type_with_ext, 'union_type) nullable_union_aux =
  [ 'type_with_ext nullable_non_any_aux | `Union of 'union_type ]

type ('type_with_ext, 'return_type) non_any_aux =
  [ `Promise of 'return_type
  | `Nullable of 'type_with_ext nullable_non_any_aux
  | 'type_with_ext nullable_non_any_aux ]

type ('type_with_ext, 'return_type) single_type_aux =
  [ ('type_with_ext, 'return_type) non_any_aux | `Any ]

type ('type_with_ext, 'return_type, 'union_type, 'extends) union_member_aux =
  [ `NonAny of 'extends * ('type_with_ext, 'return_type) non_any_aux
  | `Union of 'union_type
  | `Nullable of [ `Union of 'union_type ] ]

type ('type_with_ext, 'return_type, 'union_type, 'extends) union_type_aux =
  ('type_with_ext, 'return_type, 'union_type, 'extends) union_member_aux list

type ('type_with_ext, 'return_type, 'union_type) type_aux =
  [ `Promise of 'return_type
  | 'type_with_ext nullable_non_any_aux
  | `Any
  | `Nullable of ('type_with_ext, 'union_type) nullable_union_aux
  | `Union of 'union_type ]

type ('type_with_ext, 'return_type, 'union_type) return_type_aux =
  [ ('type_with_ext, 'return_type, 'union_type) type_aux | `Void ]

type type_with_ext = extends * type_
and type_ = (type_with_ext, return_type, union_type) type_aux
and return_type = (type_with_ext, return_type, union_type) return_type_aux

and union_type =
  (type_with_ext, return_type, union_type, extends) union_type_aux

and nullable_non_any = type_with_ext nullable_non_any_aux
and non_any = (type_with_ext, return_type) non_any_aux
and const_value = [ `Bool of bool | `Float of float | `Int of int | `Null ]
and const = [ primitive | `Ident of string ]

and default_value =
  [ `Const of const_value | `String of string | `EmptySequence | `EmptyObject ]

and argument =
  [ `Optional of type_with_ext * string * default_value option
  | `Variadic of type_ * string
  | `Fixed of type_ * string ]

and extended_argument = extends * argument

and extended_attribute =
  [ `Custom of string
  | `NoArgs of string
  | `ArgumentList of string * extended_argument list
  | `NamedArgList of string * string * extended_argument list
  | `Ident of string * string
  | `IdentList of string * string list ]

and extends = extended_attribute list

type special = [ `Getter | `Setter | `Deleter | `Legacycaller ]
type operation_rest = string option * (extends * argument) list

type no_special_operation =
  [ `NoSpecialOperation of return_type * operation_rest ]

type operation =
  [ no_special_operation
  | `SpecialOperation of special list * return_type * operation_rest ]

type dictionary_member =
  [ `Required of type_with_ext * string * default_value option
  | `NotRequired of type_ * string * default_value option ]

type dictionary = string * string option * (extends * dictionary_member) list
type attribute_rest = [ `AttributeRest of type_with_ext * string ]
type operation_or_attribute = [ no_special_operation | attribute_rest ]
type namespace_member = [ no_special_operation | `ReadOnly of attribute_rest ]
type namespace = string * (extends * namespace_member) list
type maplike = type_with_ext * type_with_ext
type setlike = type_with_ext
type const_type = [ const | `Nullable of const ]
type static_member = [ operation_or_attribute | `ReadOnly of attribute_rest ]

type readonly_member =
  [ `Maplike of maplike | `Setlike of setlike | attribute_rest ]

type attribute = [ `Inherit of attribute_rest | attribute_rest ]

type interface_member =
  [ `ReadOnly of readonly_member
  | `Static of static_member
  | `Const of const_type * string * const_value
  | `Operation of operation
  | `Stringifier of [ static_member | `None ]
  | `Iterable of type_with_ext * type_with_ext option
  | `Attribute of attribute
  | `Maplike of maplike
  | `Setlike of setlike ]

type interface = string * string option * (extends * interface_member) list

type mixin_member =
  [ `Attribute of attribute
  | `ReadOnly of readonly_member
  | `Const of const_type * string * const_value
  | `Operation of operation
  | `Stringifier of [ static_member | `None ] ]

type mixin = string * (extends * mixin_member) list

type partial =
  [ `PartialInterface of string * (extends * interface_member) list
  | `Mixin of mixin
  | `PartialDictionary of string * (extends * dictionary_member) list
  | `Namespace of namespace ]

type callback =
  [ `CallbackRest of string * return_type * (extends * argument) list
  | `Interface of interface ]

type definition =
  [ `Callback of callback
  | `Interface of interface
  | `Mixin of mixin
  | `Namespace of namespace
  | `Partial of partial
  | `Dictionary of dictionary
  | `Enum of string * string list
  | `Typedef of type_with_ext * string
  | `Includes of string * string
  | `Implements of string * string ]

type definitions = (extends * definition) list
