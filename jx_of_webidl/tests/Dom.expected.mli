module Event : sig
  type t

  val with_type_event_init_dict :
    type_:Js.dom_string -> ?event_init_dict:Event_init.t -> unit -> t

  val type_ : t -> Js.dom_string
  val target : t -> Event_target.t Js.nullable
  val src_element : t -> Event_target.t Js.nullable
  val current_target : t -> Event_target.t Js.nullable
  val composed_path : t -> Event_target.t Js.sequence
  val none : Js.unsigned_short
  val capturing_phase : Js.unsigned_short
  val at_target : Js.unsigned_short
  val bubbling_phase : Js.unsigned_short
  val event_phase : t -> Js.unsigned_short
  val stop_propagation : t -> Js.undefined
  val cancel_bubble : t -> Js.bool
  val set_cancel_bubble : t -> Js.bool -> Js.void
  val stop_immediate_propagation : t -> Js.undefined
  val bubbles : t -> Js.bool
  val cancelable : t -> Js.bool
  val return_value : t -> Js.bool
  val set_return_value : t -> Js.bool -> Js.void
  val prevent_default : t -> Js.undefined
  val default_prevented : t -> Js.bool
  val composed : t -> Js.bool
  val is_trusted : t -> Js.bool
  val time_stamp : t -> Dom_high_res_time_stamp.t

  val init_event :
    type_:Js.dom_string ->
    ?bubbles:Js.bool ->
    ?cancelable:Js.bool ->
    t ->
    Js.undefined
end

module Event_init : sig
  type t

  val make :
    ?bubbles:Js.bool -> ?cancelable:Js.bool -> ?composed:Js.bool -> unit -> t

  val bubbles : t -> Js.bool Js.optional
  val cancelable : t -> Js.bool Js.optional
  val composed : t -> Js.bool Js.optional
end
