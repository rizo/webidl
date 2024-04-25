%{
    (* Web IDL parser
     * The below rules are based on Editor’s Draft, 6 August 2018
     * https://heycam.github.io/webidl/#idl-grammar
    *)
    open Webidl_ast
    open Keyword
%}


%token LBRACE RBRACE LBRACKET RBRACKET LPAR RPAR LT GT
%token UNSIGNED BYTE OCTET SHORT LONG
%token DOMSTRING USVSTRING BYTESTRING
%token UNRESTRICTED FLOAT DOUBLE
%token ANY BOOLEAN OBJECT OR
%token TRUE FALSE NULL UNDEFINED INFINITY MINUSINFINITY NAN
%token GETTER SETTER DELETER
%token CONSTRUCTOR
%token STRINGIFIER
%token QUESTION EQUAL COMMA COLON SEMICOLON ELLIPSIS
%token MAPLIKE SETLIKE ITERABLE
%token PROMISE RECORD SEQUENCE INCLUDES MIXIN
%token NAMESPACE CALLBACK PARTIAL INTERFACE DICTIONARY ENUM
%token INHERIT ATTRIBUTE TYPEDEF CONST ASYNC
%token READONLY REQUIRED STATIC OPTIONAL
%token INT8ARRAY INT16ARRAY INT32ARRAY
%token UINT8ARRAY UINT16ARRAY UINT32ARRAY UINT8CLAMPEDARRAY
%token FLOAT32ARRAY FLOAT64ARRAY
%token ARRAYBUFFER DATAVIEW FROZENARRAY
%token ASTERISK

%token<int> INTVAL
%token<float> FLOATVAL
%token<string> IDENTIFIER STRING
%token EOF

%start main
%type < Webidl_ast.definitions > main
%type < Webidl_ast.primitive_type > primitiveType
%%

main :
  | definitions EOF {  $1 }

definitions :
  | extendedAttributeList definition definitions { ($1, $2) :: $3 }
  | { [] }

definition :
  // https://webidl.spec.whatwg.org/#index-prod-CallbackOrInterfaceOrMixin
  | CALLBACK callbackRest { Callback $2 }
  | CALLBACK INTERFACE IDENTIFIER LBRACE callbackInterfaceMembers RBRACE SEMICOLON
    { Callback_interface { name = $3; members = $5 } }

  // https://webidl.spec.whatwg.org/#index-prod-InterfaceOrMixin
  | INTERFACE interfaceRest { Interface $2 }
  | INTERFACE mixinRest { Mixin $2 }

  | namespace { Namespace $1 }
  | partial { Partial $1 }
  | dictionary { Dictionary $1 }
  | enum { Enum $1 }
  | typedef { Typedef $1 }
  
  // https://webidl.spec.whatwg.org/#index-prod-IncludesStatement
  | IDENTIFIER INCLUDES IDENTIFIER SEMICOLON { Includes ($1, $3) }


// https://webidl.spec.whatwg.org/#index-prod-CallbackRest
callbackRest :
  | IDENTIFIER EQUAL type_ LPAR argumentList RPAR SEMICOLON
    { { Callback.name = $1; return = $3; arguments = $5 } }

// https://webidl.spec.whatwg.org/#index-prod-CallbackInterfaceMembers
callbackInterfaceMembers :
  | extendedAttributeList callbackInterfaceMember callbackInterfaceMembers
    { ($1, $2) :: $3 }
  | { [] }

// https://webidl.spec.whatwg.org/#index-prod-CallbackInterfaceMember
callbackInterfaceMember :
  | const { Callback_interface.Const $1 }
  | regularOperation { Callback_interface.Regular_operation $1 }

// https://webidl.spec.whatwg.org/#index-prod-SpecialOperation
specialOperation :
    | special type_ operationRest
    { {
        Special_operation.special = $1;
        type_ = $2;
        name = fst $3;
        arguments = snd $3;
      }
    }

// https://webidl.spec.whatwg.org/#prod-Special
special :
    | GETTER { Getter }
    | SETTER { Setter }
    | DELETER { Deleter }

// https://webidl.spec.whatwg.org/#index-prod-RegularOperation
regularOperation :
  type_ operationRest
    { {
        Regular_operation.type_ = $1;
        name = fst $2;
        arguments = snd $2;
      }
    }
    
// https://webidl.spec.whatwg.org/#index-prod-OperationRest
operationRest :
  | optionalOperationName LPAR argumentList RPAR SEMICOLON
    { ($1, $3) }

// https://webidl.spec.whatwg.org/#index-prod-OptionalOperationName
optionalOperationName :
    | operationName { Some $1 }
    |  { None }

// https://webidl.spec.whatwg.org/#index-prod-OperationName
operationName :
  | operationNameKeyword { $1 }
  | IDENTIFIER { $1 }

// TODO: should this be explicit?
// https://webidl.spec.whatwg.org/#index-prod-OperationNameKeyword
operationNameKeyword :
  | INCLUDES { "includes" }

// https://webidl.spec.whatwg.org/#index-prod-ArgumentNameKeyword
%public argumentNameKeyword :
  | ASYNC { `Async }
  | ATTRIBUTE { `Attribute }
  | CALLBACK { `Callback }
  | CONST { `Const }
  | CONSTRUCTOR { `Constructor }
  | DELETER { `Deleter }
  | DICTIONARY { `Dictionary }
  | ENUM { `Enum }
  | GETTER { `Getter }
  | INCLUDES { `Includes }
  | INHERIT { `Inherit }
  | INTERFACE { `Interface }
  | ITERABLE { `Iterable }
  | MAPLIKE { `Maplike }
  | MIXIN { `Mixin }
  | NAMESPACE { `Namespace }
  | PARTIAL { `Partial }
  | READONLY { `Readonly }
  | REQUIRED { `Required }
  | SETLIKE { `Setlike }
  | SETTER { `Setter }
  | STATIC { `Static }
  | STRINGIFIER { `Stringifier }
  | TYPEDEF { `Typedef }
  | UNRESTRICTED { `Unrestricted }


// https://webidl.spec.whatwg.org/#index-prod-InterfaceRest
interfaceRest :
    | IDENTIFIER inheritance LBRACE interfaceMembers RBRACE SEMICOLON
    { { Interface.name = $1; inherits = $2; members = $4 } }

// https://webidl.spec.whatwg.org/#index-prod-Partial
partial :
    | PARTIAL partialDefinition { $2 }

// https://webidl.spec.whatwg.org/#index-prod-PartialDefinition
partialDefinition :
  | INTERFACE partialInterface { Partial.Interface $2 }
  | INTERFACE mixinRest { Partial.Mixin $2 }
  | partialDictionary { Partial.Dictionary $1 }
  | namespace { Partial.Namespace $1 }

// https://webidl.spec.whatwg.org/#index-prod-PartialInterfaceRest
partialInterface :
  | IDENTIFIER LBRACE partialInterfaceMembers RBRACE SEMICOLON
    { { Partial_interface.name = $1; members = $3 } }

partialInterfaceMembers :
  | extendedAttributeList partialInterfaceMember partialInterfaceMembers
    { ($1, $2) :: $3 }
  | { [] }

interfaceMembers :
  | extendedAttributeList interfaceMember interfaceMembers
    { ($1, $2) :: $3 }
  | { [] }

// https://webidl.spec.whatwg.org/#prod-InterfaceMember
interfaceMember :
  | partialInterfaceMember
    { Interface.of_partial_interface_member $1 }
  | constructor
    { Webidl_ast.Interface.Constructor $1 }

// https://webidl.spec.whatwg.org/#prod-Constructor
constructor :
  | CONSTRUCTOR LPAR argumentList RPAR SEMICOLON
    { $3 }

// https://webidl.spec.whatwg.org/#index-prod-PartialInterfaceMember
partialInterfaceMember :
  | const { Partial_interface.Const $1 }
  | regularOperation
    {
      Partial_interface.Regular_operation {
        regular_operation = $1;
        is_static = false;
      }
    }
  | specialOperation { Partial_interface.Special_operation $1 }
  | stringifier { Partial_interface.Stringifier $1 }
  | staticMember { Partial_interface.of_static $1 }
  | iterable { Partial_interface.Iterable $1 }
  | readOnlyMember { Partial_interface.of_readonly $1 }
  | readWriteAttribute
    { Partial_interface.Attribute {
        attribute = $1;
        is_static = false;
        is_readonly = false;
      }
    }
  | readWriteMaplike
    { Partial_interface.Maplike { maplike = $1; is_readonly = false } }
  | readWriteSetlike
    { Partial_interface.Setlike { setlike = $1; is_readonly = false } }

  // https://webidl.spec.whatwg.org/#index-prod-InheritAttribute
  | INHERIT attributeRest { Partial_interface.Inherit_attribute  $2 }

mixinRest :
    | MIXIN IDENTIFIER LBRACE mixinMembers RBRACE SEMICOLON
    { { Mixin.name = $2; members = $4 } }

mixinMembers :
    | extendedAttributeList mixinMember mixinMembers   { ($1, $2) :: $3 }
    |    { [] }

mixinMember :
    | const { Mixin.Const $1 }
    | regularOperation { Mixin.Regular_operation $1 }
    | stringifier { Mixin.Stringifier $1 }
    | readOnly attributeRest
      { Mixin.Attribute {
        attribute = $2;
        is_readonly = $1;
      }
    }

// https://webidl.spec.whatwg.org/#index-prod-Inheritance
inheritance :
  | COLON IDENTIFIER { Some $2 }
  | { None }

// https://webidl.spec.whatwg.org/#index-prod-Const
const :
  | CONST constType IDENTIFIER EQUAL constValue SEMICOLON
    { { Const.type_ = $2; ident = $3; value = $5 } }

// https://webidl.spec.whatwg.org/#index-prod-ConstValue
constValue :
  | booleanLiteral { `Bool $1}
  | floatLiteral { `Float $1 }
  | INTVAL { `Int $1 }

booleanLiteral :
    | TRUE   { true }
    | FALSE   { false }

floatLiteral :
    | FLOATVAL   { $1 }
    | MINUSINFINITY   { neg_infinity }
    | INFINITY   { infinity }
    | NAN    { nan }

// https://webidl.spec.whatwg.org/#index-prod-ConstType
constType :
  | primitiveType { $1 :> const_type }
  | IDENTIFIER { (`Name $1) :> const_type  }

// https://webidl.spec.whatwg.org/#index-prod-ReadOnlyMember
readOnlyMember :
  | READONLY readOnlyMemberRest { $2 }

// https://webidl.spec.whatwg.org/#index-prod-ReadOnlyMemberRest
readOnlyMemberRest :
  | attributeRest
    { Readonly.Attribute {
        attribute = $1;
        is_readonly = true;
      }
    }
  | maplikeRest
    { Readonly.Maplike {
        maplike = $1;
        is_readonly = true;
      }
    }
  | setlikeRest
    { Readonly.Setlike {
        setlike = $1;
        is_readonly = true;
      }
    }

// https://webidl.spec.whatwg.org/#index-prod-ReadWriteAttribute
readWriteAttribute :
  attributeRest { $1 }

// https://webidl.spec.whatwg.org/#index-prod-AttributeRest
attributeRest :
  | ATTRIBUTE typeWithExtendedAttributes attributeName SEMICOLON
    { { Attribute.type_ = $2; name = $3 } }

attributeName :
    | attributeNameKeyword { $1 }
    | IDENTIFIER { $1 }

attributeNameKeyword :
    | REQUIRED { required }

readOnly :
    | READONLY { true }
    |  { false }

// https://webidl.spec.whatwg.org/#index-prod-DefaultValue
defaultValue :
    | constValue { `Const $1 }
    | STRING { `String $1 }
    | LBRACKET RBRACKET { `Empty_sequence }
    | LBRACE RBRACE { `Empty_object }
    | NULL { `Null }
    | UNDEFINED { `Undefined }


// https://webidl.spec.whatwg.org/#prod-ArgumentList
%public argumentList :
  | argument arguments { $1 :: $2 }
  | { [] }

// https://webidl.spec.whatwg.org/#prod-Arguments
arguments :
  | COMMA argument arguments { $2 :: $3 }
  | { [] }

// https://webidl.spec.whatwg.org/#prod-Argument
argument :
  | extendedAttributeList OPTIONAL typeWithExtendedAttributes argumentName default
    { ($1, `Optional($4, $3, $5)) : Webidl_ast.argument_ext }
  | extendedAttributeList type_ ellipsis argumentName
    { if $3 then
        ($1, `Variadic($4, $2))
      else
        ($1, `Fixed($4, $2))
    }

argumentName :
    | argumentNameKeyword { `Keyword $1 }
    | IDENTIFIER { `Ident $1 }

ellipsis :
    | ELLIPSIS { true }
    |  { false }

// https://webidl.spec.whatwg.org/#index-prod-Stringifier
stringifier :
  STRINGIFIER stringifierRest { $2 }

// https://webidl.spec.whatwg.org/#index-prod-StringifierRest
stringifierRest :
  | readOnly attributeRest
    { Stringifier.Attribute { readonly = $1; attribute = $2 } }
  | SEMICOLON
    { Stringifier.Standalone }

%public identifiers :
    | COMMA IDENTIFIER identifiers { $2 :: $3 }
    |  { [] }

// https://webidl.spec.whatwg.org/#index-prod-StaticMember
staticMember :
  | STATIC staticMemberRest { $2 : Static.member }

// https://webidl.spec.whatwg.org/#index-prod-StaticMemberRest
staticMemberRest :
  | readOnly attributeRest
    { Static.Attribute {
        is_static = true;
        is_readonly = $1;
        attribute = $2;
      }
    }
  | regularOperation
    { Static.Regular_operation {
        is_static = true;
        regular_operation = $1;
      }
    }

iterable :
  | ITERABLE LT typeWithExtendedAttributes optionalType GT SEMICOLON
    { match $4 with
      | None -> ({ value_type = $3; key_type = None } : iterable)
      | Some value_type -> { value_type; key_type = Some $3 }
    }

optionalType :
    | COMMA typeWithExtendedAttributes  { Some $2 }
    |  { None }

// https://webidl.spec.whatwg.org/#index-prod-ReadWriteMaplike
readWriteMaplike : maplikeRest { $1 }

// https://webidl.spec.whatwg.org/#index-prod-MaplikeRest
maplikeRest :
  | MAPLIKE LT typeWithExtendedAttributes COMMA typeWithExtendedAttributes GT SEMICOLON
    { { key_type = $3; value_type = $5 } : maplike }

// https://webidl.spec.whatwg.org/#index-prod-ReadWriteSetlike
readWriteSetlike : setlikeRest { $1 }

setlikeRest :
  | SETLIKE LT typeWithExtendedAttributes GT SEMICOLON
    { { value_type = $3 } : setlike }

// https://webidl.spec.whatwg.org/#index-prod-Namespace
namespace :
  | NAMESPACE IDENTIFIER LBRACE namespaceMembers RBRACE SEMICOLON
    { { Namespace.name = $2; members = $4 } }

namespaceMembers :
  | { [] }
  | extendedAttributeList namespaceMember namespaceMembers
    { ($1, $2) :: $3 }

// https://webidl.spec.whatwg.org/#index-prod-NamespaceMember
namespaceMember :
  | regularOperation { Namespace.Regular_operation $1 }
  | READONLY attributeRest { Namespace.Attribute {
      attribute = $2;
      is_readonly = ();
    }
  }
  | const { Namespace.Const $1 }

dictionary :
  | DICTIONARY IDENTIFIER inheritance LBRACE dictionaryMembers RBRACE SEMICOLON
    { { Dictionary.name = $2; inherits = $3; members = $5 } }

dictionaryMembers :
  | dictionaryMember dictionaryMembers  { $1 :: $2 }
  | { [] }

// https://webidl.spec.whatwg.org/#prod-DictionaryMember
dictionaryMember :
  | extendedAttributeList REQUIRED typeWithExtendedAttributes IDENTIFIER SEMICOLON
    { ($1, Dictionary.Required ($3, $4))}
  | extendedAttributeList type_ IDENTIFIER default SEMICOLON
    { ($1, Dictionary.Optional ($2, $3, $4))}

partialDictionary :
  | DICTIONARY IDENTIFIER LBRACE dictionaryMembers RBRACE SEMICOLON
    { { Partial_dictionary.name = $2; members = $4 } }

// https://webidl.spec.whatwg.org/#index-prod-Default
default :
    | EQUAL defaultValue { Some $2 }
    |  { None }

enum :
  | ENUM IDENTIFIER LBRACE enumValueList RBRACE SEMICOLON
    { { Enum.name = $2; values = $4 } }

enumValueList :
    | STRING enumValueListComma { $1 :: $2 }

enumValueListComma :
    | COMMA enumValueListString { $2 }
    |  { [] }

enumValueListString :
    | STRING enumValueListComma { $1 :: $2 }
    |  { [] }

// https://webidl.spec.whatwg.org/#index-prod-Typedef
typedef :
  | TYPEDEF typeWithExtendedAttributes IDENTIFIER SEMICOLON
    { { Typedef.name = $3; type_ = $2 } }

// DEPRECATED?
//implementsStatement :
//  | IDENTIFIER IMPLEMENTS IDENTIFIER SEMICOLON { ($1, $3) }

// https://webidl.spec.whatwg.org/#index-prod-Type
type_ :
    | singleType { ($1 : type_) }
    | unionType null { `Union ($1, $2) }

%public typeWithExtendedAttributes :
  | extendedAttributeList type_
    { ($1, $2) }

// https://webidl.spec.whatwg.org/#index-prod-SingleType
singleType :
    | distinguishableType { `Distinguishable $1 }
    | ANY { `Any }
    | promiseType { $1 }

unionType :
    | LPAR unionMemberType OR unionMemberType unionMemberTypes RPAR
    { ($2, $4, $5) }

unionMemberType :
  | extendedAttributeList distinguishableType
    { `Single ($1, fst $2, snd $2) }
  | unionType null
    { `Nested ($1, $2) }

unionMemberTypes :
    | OR unionMemberType unionMemberTypes { $2 :: $3 }
    | { [] }

%public distinguishableType :
  | primitiveType null { (($1 :> distinguishable_type), $2) }
  | stringType null { (($1 :> distinguishable_type), $2) }
  | IDENTIFIER null { (`Name $1, $2)  }
  | SEQUENCE LT typeWithExtendedAttributes GT null { (`Sequence $3, $5) }
  | OBJECT null { (`Object, $2) }
  // https://webidl.spec.whatwg.org/#idl-symbol
  /* | SYMBOL null { mk_nullable $2 `Symbol} */
  | bufferRelatedType null { (($1 :> distinguishable_type), $2) }
  | FROZENARRAY LT typeWithExtendedAttributes GT null
    { (`Frozen_array $3, $5) }
  | recordType null { (($1 :> distinguishable_type), $2) }
  | UNDEFINED null { ((`Undefined :> distinguishable_type), $2) }

// | legacyArray { $1 } /* support for non standard Web IDL */

primitiveType :
    | unsignedIntegerType { $1 :> primitive_type }
    | unrestrictedFloatType { $1 :> primitive_type }
    | BOOLEAN { `Boolean }
    | BYTE { `Byte }
    | OCTET { `Octet }

unrestrictedFloatType :
  | UNRESTRICTED floatType { (`Unrestricted $2 :> unrestricted_float_type) }
  | floatType { ($1 :> unrestricted_float_type) }

floatType :
    | FLOAT { `Float }
    | DOUBLE { `Double }

unsignedIntegerType :
    | UNSIGNED integerType { `Unsigned $2 }
    | integerType { $1 :> primitive_type }

integerType :
    | SHORT { `Short }
    | LONG optionalLong { $2 }

optionalLong :
    | LONG { `Long_long }
    |  { `Long }

stringType :
    | BYTESTRING { `Byte_string }
    | DOMSTRING { `Dom_string }
    | USVSTRING { `Usv_string }

// https://webidl.spec.whatwg.org/#index-prod-PromiseType
promiseType :
  | PROMISE LT type_ GT { `Promise $3 }

// | promiseOnly { $1 } /* support for non standard Web IDL */
// | promiseNull { $1 } /* support for non standard Web IDL */

// https://webidl.spec.whatwg.org/#prod-RecordType
recordType :
  | RECORD LT stringType COMMA typeWithExtendedAttributes GT
    { `Record ($3, $5) }

%public null :
  | QUESTION { true }
  | { false }

%public bufferRelatedType :
  | ARRAYBUFFER { `ArrayBuffer }
  | DATAVIEW { `DataView }
  | INT8ARRAY { `Int8Array }
  | INT16ARRAY { `Int16Array }
  | INT32ARRAY { `Int32Array }
  | UINT8ARRAY { `Uint8Array }
  | UINT16ARRAY { `Uint16Array }
  | UINT32ARRAY { `Uint32Array }
  | UINT8CLAMPEDARRAY { `Uint8ClampedArray }
  | FLOAT32ARRAY { `Float32Array }
  | FLOAT64ARRAY { `Float64Array }


// BASIC EXTENDED ATTRIBUTES



%public extendedAttributeList :
  | LBRACKET extendedAttribute extendedAttributes RBRACKET { ($2 :: $3) }
  | { [] }

extendedAttributes :
  | COMMA extendedAttribute extendedAttributes { $2 :: $3 }
  | { [] }

extendedAttribute :
  | extendedAttributeNoArgs { $1 }
  | extendedAttributeArgList { $1 }
  | extendedAttributeIdent { $1 }
  | extendedAttributeWildcard { $1 }
  | extendedAttributeIdentList { $1 }
  | extendedAttributeNamedArgList { $1 }

identifierList :
  | IDENTIFIER identifiers { $1 :: $2 }

extendedAttributeNoArgs :
  | IDENTIFIER { Ext_no_args $1 }

extendedAttributeArgList :
  | IDENTIFIER LPAR argumentList RPAR { Ext_arg_list ($1, $3) }

extendedAttributeIdent :
  | IDENTIFIER EQUAL IDENTIFIER { Ext_ident ($1, $3) }

extendedAttributeWildcard :
  | IDENTIFIER EQUAL ASTERISK { Ext_wildcard $1 }

extendedAttributeIdentList :
  | IDENTIFIER EQUAL LPAR identifierList RPAR { Ext_ident_list ($1, $4) }

extendedAttributeNamedArgList :
  | IDENTIFIER EQUAL IDENTIFIER LPAR argumentList RPAR 
    { Ext_named_arg_list ($1, $3, $5) }
