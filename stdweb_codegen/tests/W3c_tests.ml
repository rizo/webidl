module Dahut : sig
  type t

  val to_mammal : t -> Mammal.t
  val levrogyrous : Js.unsigned_short
  val dextrogyrous : Js.unsigned_short
  val chirality : t -> Js.dom_string
  val age : t -> Js.unsigned_long
  val set_age : t -> Js.unsigned_long -> Js.void
  val turn_around : angle:Js.float -> fall:Js.bool -> t -> Dahut.t
  val trip : t -> Js.unsigned_long
  val yell : volume:Js.unsigned_long -> sentence:Js.dom_string -> t -> Js.void
end

module Super_star : sig
  type t
end

module Super_star : sig
  type t

  val make : unit -> t
end

module Super_star : sig
  type t

  val to_hyper_star : t -> Hyper_star.t
end

module Super_star : sig
  type t
end

module Doc_interface : sig
  type t
end

module Doc_is_not_case_sensitive : sig
  type t
end

module Undoc_interface : sig
  type t
end

module Super_star : sig
  type t
end

module Super_star : sig
  type t
end

module Super_star : sig
  type t
end

module Const_test : sig
  type t

  val test : Js.bool
  val bite : Js.char
  val eight : Js.char
  val small : Js.short
  val shortish : Js.unsigned_short
  val not_so_long : Js.long
  val somewhat_long : Js.unsigned_long
  val very_long : Js.long_long
  val so_long : Js.unsigned_long_long
  val ation_device : Js.float
  val buoy : Js.unrestricted_float
  val twice : Js.double
  val rambaldi : Js.unrestricted_double
  val why : Js.bool Js.nullable
  val not_so : Js.bool Js.nullable
  val inf : Js.short
  val mininf : Js.short
  val cheese : Js.short
  val ext_attr : Js.short
end

module Attr_basic : sig
  type t

  val regular : t -> Js.dom_string
  val set_regular : t -> Js.dom_string -> Js.void
  val ro : t -> Js.dom_string
  val _readonly : t -> Js.dom_string
  val in_ : t -> Js.dom_string
  val set_in : t -> Js.dom_string -> Js.void
  val to_string : t -> Js.dom_string
  val st : t -> Js.dom_string
  val set_st : t -> Js.dom_string -> Js.void
  val ext : t -> Js.dom_string
  val dates : t -> Date.t Js.sequence
  val set_dates : t -> Date.t Js.sequence -> Js.void
  val operation : t -> Js.dom_string Js.promise
  val set_operation : t -> Js.dom_string Js.promise -> Js.void
end

module Meth_basic : sig
  type t

  val basic : t -> Js.void
  val ext : t -> Js.void
  val ull : s:Js.short -> t -> Js.unsigned_long_long
  val ull : t -> Super_star.t Js.nullable
end

module Serializer_map : sig
  type t

  val foo : t -> Js.dom_string
  val set_foo : t -> Js.dom_string -> Js.void
  val bar : t -> Js.dom_string
  val set_bar : t -> Js.dom_string -> Js.void
end

module Super_star : sig
  type t
end

module Super_star : sig
  type t

  val make : unit -> t
end

module Super_star : sig
  type t

  val make : unit -> t
  val to_hyper_star : t -> Hyper_star.t
end

module Super_star : sig
  type t

  val make :
    ?value:Js.dom_string ->
    ?nullable:Js.dom_string Js.nullable ->
    ?ext:Js.float ->
    ?long_long:Js.unsigned_long_long ->
    ?test:Js.bool ->
    ?little:Js.char ->
    ?big:Js.char ->
    ?cheese:Js.char ->
    ?blah:Js.dom_string ->
    unit ->
    t

  val value : t -> Js.dom_string Js.optional
  val nullable : t -> Js.dom_string Js.nullable Js.optional
  val ext : t -> Js.float Js.optional
  val long_long : t -> Js.unsigned_long_long Js.optional
  val test : t -> Js.bool Js.optional
  val little : t -> Js.char Js.optional
  val big : t -> Js.char Js.optional
  val cheese : t -> Js.char Js.optional
  val blah : t -> Js.dom_string Js.optional
end

module Dict_doc_test : sig
  type t

  val make :
    ?dict_doc_field:Js.dom_string ->
    ?other_field:Js.dom_string Js.nullable ->
    ?undoc_field:Js.long ->
    unit ->
    t

  val dict_doc_field : t -> Js.dom_string Js.optional
  val other_field : t -> Js.dom_string Js.nullable Js.optional
  val undoc_field : t -> Js.long Js.optional
end

module Enum_basic : sig
  type t

  val to_string : t -> string
  val one : t
  val two : t
  val three : t
end

val todo : callback
val todo : callback

type string = Js.dom_string
type tdLessBasic = Js.unsigned_long_long Js.nullable

module Window : Breakable
module Window : Breakable
