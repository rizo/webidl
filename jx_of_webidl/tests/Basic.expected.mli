module A : sig
  type t

  val s1 : t -> Js.byte_string
  val set_s1 : t -> Js.byte_string -> Js.void
  val s2 : t -> Js.dom_string
  val set_s2 : t -> Js.dom_string -> Js.void
  val s3 : t -> Js.usv_string
  val set_s3 : t -> Js.usv_string -> Js.void
  val s4 : t -> String.t
  val set_s4 : t -> String.t -> Js.void
  val s5 : t -> Cssom_string.t
  val set_s5 : t -> Cssom_string.t -> Js.void
  val nullable_string : t -> Js.dom_string Js.nullable
  val set_nullable_string : t -> Js.dom_string Js.nullable -> Js.void
  val obj : t -> 'todo_object
  val set_obj : t -> 'todo_object -> Js.void
  val nullable_object : t -> 'todo_object Js.nullable
  val set_nullable_object : t -> 'todo_object Js.nullable -> Js.void
  val value : t -> Unknown_type.t
  val set_value : t -> Unknown_type.t -> Js.void
  val h : t -> Js.any
end

module A : sig
  type t

  val f1 : t -> Js.double
  val f2 : x:Js.long -> y:Js.long -> t -> Js.double
  val f3 : x:A.t -> t -> A.t
  val f4 : t -> Js.void
end

module A : sig
  type t

  val event1 : t -> A_callback.t
  val set_event1 : t -> A_callback.t -> Js.void
  val event2 : t -> A_callback.t Js.nullable
  val set_event2 : t -> A_callback.t Js.nullable -> Js.void
  val event3 : t -> Any_callback.t
  val set_event3 : t -> Any_callback.t -> Js.void
end

val todo : callback

module A : sig
  type t

  val behavior : t -> Scroll_behavior.t
  val set_behavior : t -> Scroll_behavior.t -> Js.void
end

module Scroll_behavior : sig
  type t

  val to_string : t -> string
  val auto : t
  val instant : t
  val smooth : t
end

module A : sig
  type t

  val x : t -> Js.long
  val set_x : t -> Js.long -> Js.void
end

module A : sig
  type t

  val y : t -> Js.long
  val set_y : t -> Js.long -> Js.void
  val z : Js.long
  val f : t -> Js.void
end

module A : sig
  type t

  val g : t -> Js.void
end

module B : sig
  type t

  val make : ?a:Js.bool -> unit -> t
  val a : t -> Js.bool Js.optional
end

val todo : partial
