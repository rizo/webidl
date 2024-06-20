open struct
  module E_js = Js.Encode
  module D_js = Js.Decode
end

module rec Dom_high_res_time_stamp : sig
  type nonrec t = float

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Dom_high_res_time_stamp

and Html_slot_element : sig
  type nonrec t = Js.any

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Html_slot_element

and Event_handler_non_null : sig
  type t = Event.t -> Js.any

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Event_handler_non_null

and Event_handler : sig
  type nonrec t = Event_handler_non_null.t option

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Event_handler

and Event : sig
  type t = [ `Event ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event} [Event]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Event | `Object ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event} [Event]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val with_type_and_event_init_dict :
    type':string -> ?event_init_dict:Event_init.t -> unit -> 'a super

  val type' : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/type} \
     [type] on MDN}."]

  val target : t -> Event_target.t option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/target} \
     [target] on MDN}."]

  val src_element : t -> Event_target.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/srcElement} \
     [srcElement] on MDN}."]

  val current_target : t -> Event_target.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/currentTarget} \
     [currentTarget] on MDN}."]

  val composed_path : t -> Event_target.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/composedPath} \
     [composedPath] on MDN}."]

  val none : int
  val capturing_phase : int
  val at_target : int
  val bubbling_phase : int

  val event_phase : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/eventPhase} \
     [eventPhase] on MDN}."]

  val stop_propagation : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/stopPropagation} \
     [stopPropagation] on MDN}."]

  val cancel_bubble : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/cancelBubble} \
     [cancelBubble] on MDN}."]

  val set_cancel_bubble : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/cancelBubble} \
     [cancelBubble] on MDN}."]

  val stop_immediate_propagation : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/stopImmediatePropagation} \
     [stopImmediatePropagation] on MDN}."]

  val bubbles : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/bubbles} \
     [bubbles] on MDN}."]

  val cancelable : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/cancelable} \
     [cancelable] on MDN}."]

  val return_value : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/returnValue} \
     [returnValue] on MDN}."]

  val set_return_value : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/returnValue} \
     [returnValue] on MDN}."]

  val prevent_default : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault} \
     [preventDefault] on MDN}."]

  val default_prevented : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event/defaultPrevented} \
     [defaultPrevented] on MDN}."]

  val composed : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/composed} \
     [composed] on MDN}."]

  val is_trusted : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/isTrusted} \
     [isTrusted] on MDN}."]

  val time_stamp : t -> Dom_high_res_time_stamp.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/timeStamp} \
     [timeStamp] on MDN}."]

  val init_event :
    type':string -> ?bubbles:bool -> ?cancelable:bool -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event/initEvent} \
     [initEvent] on MDN}."]
end = struct
  type t = [ `Event ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Event | `Object ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Event} [Event]} \
     interface or any base interface that it inherits."]

  let t = Js.raw "Event"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let super this = Js.magic this

  let with_type_and_event_init_dict ~type' ?event_init_dict () =
    let type' = Js.Any.of_string type' in
    let event_init_dict =
      (Js.Any.undefined_of_option Event_init.to_any) event_init_dict
    in
    Js.obj_new t [| type'; event_init_dict |]

  let type' this = Js.Any.to_string (Js.get this "type")

  let target this =
    (Js.Any.nullable_to_option Event_target.of_any) (Js.get this "target")

  let src_element this =
    (Js.Any.nullable_to_option Event_target.of_any) (Js.get this "srcElement")

  let current_target this =
    (Js.Any.nullable_to_option Event_target.of_any) (Js.get this "currentTarget")

  let composed_path this =
    (Js.Any.to_array Event_target.of_any) (Js.meth_call this "composedPath" [||])

  let none = 0
  let capturing_phase = 1
  let at_target = 2
  let bubbling_phase = 3
  let event_phase this = Js.Any.to_int (Js.get this "eventPhase")

  let stop_propagation this =
    Js.to_unit (Js.meth_call this "stopPropagation" [||])

  let cancel_bubble this = Js.Any.to_bool (Js.get this "cancelBubble")
  let set_cancel_bubble this x = Js.set this "cancelBubble" (Js.Any.of_bool x)

  let stop_immediate_propagation this =
    Js.to_unit (Js.meth_call this "stopImmediatePropagation" [||])

  let bubbles this = Js.Any.to_bool (Js.get this "bubbles")
  let cancelable this = Js.Any.to_bool (Js.get this "cancelable")
  let return_value this = Js.Any.to_bool (Js.get this "returnValue")
  let set_return_value this x = Js.set this "returnValue" (Js.Any.of_bool x)
  let prevent_default this = Js.to_unit (Js.meth_call this "preventDefault" [||])
  let default_prevented this = Js.Any.to_bool (Js.get this "defaultPrevented")
  let composed this = Js.Any.to_bool (Js.get this "composed")
  let is_trusted this = Js.Any.to_bool (Js.get this "isTrusted")
  let time_stamp this = Dom_high_res_time_stamp.of_any (Js.get this "timeStamp")

  let init_event ~type' ?bubbles ?cancelable this =
    let type' = Js.Any.of_string type' in
    let bubbles = (Js.Any.undefined_of_option Js.Any.of_bool) bubbles in
    let cancelable = (Js.Any.undefined_of_option Js.Any.of_bool) cancelable in
    Js.to_unit (Js.meth_call this "initEvent" [| type'; bubbles; cancelable |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Event} [Event] on \
   MDN}."]

and Event_init : sig
  type t = [ `Event_init ] Js.t
  [@@ocaml.doc "The type for the [EventInit] dictionary."]

  val make : ?bubbles:bool -> ?cancelable:bool -> ?composed:bool -> unit -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val bubbles : t -> bool option
  val cancelable : t -> bool option
  val composed : t -> bool option
end = struct
  type t = [ `Event_init ] Js.t

  let make ?bubbles ?cancelable ?composed () =
    (* let bubbles = (Js.Any.nullable_of_option Js.Any.of_bool) bubbles in *)
    let bubbles = E_js.nullable E_js.bool bubbles in
    let cancelable = E_js.nullable E_js.bool cancelable in
    let composed = E_js.nullable E_js.bool composed in
    D_js.any
      (E_js.obj
         [|
           ("bubbles", bubbles);
           ("cancelable", cancelable);
           ("composed", composed);
         |]
      )

  let to_any = Js.to_any
  let of_any = Js.of_any

  let bubbles this =
    D_js.field "bubbles" (D_js.nullable D_js.bool) (E_js.any this)

  let cancelable this = D_js.field "cancelable" (D_js.nullable D_js.bool) this
  let composed this = D_js.field "composed" (D_js.nullable D_js.bool) this
end

and Custom_event : sig
  type t = [ `Custom_event ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent} \
     [CustomEvent]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Custom_event | `Event | `Object ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent} \
     [CustomEvent]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val with_type_and_event_init_dict :
    type':string -> ?event_init_dict:Custom_event_init.t -> unit -> 'a super

  val detail : t -> Js.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent/detail} \
     [detail] on MDN}."]

  val init_custom_event :
    type':string ->
    ?bubbles:bool ->
    ?cancelable:bool ->
    ?detail:Js.any ->
    t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent/initCustomEvent} \
     [initCustomEvent] on MDN}."]
end = struct
  type t = [ `Custom_event ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Custom_event | `Event | `Object ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent} \
     [CustomEvent]} interface or any base interface that it inherits."]

  let t = Js.raw "CustomEvent"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let super this = Js.magic this

  let with_type_and_event_init_dict ~type' ?event_init_dict () =
    let type' = Js.Any.of_string type' in
    let event_init_dict =
      (Js.Any.undefined_of_option Custom_event_init.to_any) event_init_dict
    in
    Js.obj_new t [| type'; event_init_dict |]

  let detail this = Js.to_any (Js.get this "detail")

  let init_custom_event ~type' ?bubbles ?cancelable ?detail this =
    let type' = Js.Any.of_string type' in
    let bubbles = (Js.Any.undefined_of_option Js.Any.of_bool) bubbles in
    let cancelable = (Js.Any.undefined_of_option Js.Any.of_bool) cancelable in
    let detail = (Js.Any.undefined_of_option Js.of_any) detail in
    Js.to_unit
      (Js.meth_call this "initCustomEvent"
         [| type'; bubbles; cancelable; detail |]
      )
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent} \
   [CustomEvent] on MDN}."]

and Custom_event_init : sig
  type t = [ `Custom_event_init ] Js.t
  [@@ocaml.doc "The type for the [CustomEventInit] dictionary."]

  type 'a super = 'a Js.t constraint 'a = [< `Custom_event_init | `Event_init ]

  val make : ?detail:Js.any -> unit -> 'a super
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val super : t -> 'a super
  val detail : t -> Js.any option
end = struct
  type t = [ `Custom_event_init ] Js.t
  type 'a super = 'a Js.t constraint 'a = [< `Custom_event_init | `Event_init ]

  let make ?detail () =
    let detail = (Js.Any.nullable_of_option Js.of_any) detail in
    Js.magic (Js.obj [| ("detail", detail) |])

  let super this = Js.magic this
  let to_any = Js.to_any
  let of_any = Js.of_any
  let detail this = (Js.Any.nullable_to_option Js.to_any) (Js.get this "detail")
end

and Event_target : sig
  type t = [ `Event_target ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EventTarget} \
     [EventTarget]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t

  val add_event_listener :
    type':string ->
    callback:Event_listener.t option ->
    ?options:[< `Add_event_listener_options | `Bool ] Js.t ->
    t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener} \
     [addEventListener] on MDN}."]

  val remove_event_listener :
    type':string ->
    callback:Event_listener.t option ->
    ?options:[< `Event_listener_options | `Bool ] Js.t ->
    t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/removeEventListener} \
     [removeEventListener] on MDN}."]

  val dispatch_event : event:Event.t -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/dispatchEvent} \
     [dispatchEvent] on MDN}."]
end = struct
  type t = [ `Event_target ] Js.t

  let t = Js.raw "EventTarget"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let add_event_listener ~type' ~callback ?options this =
    let type' = Js.Any.of_string type' in
    let callback = (Js.Any.nullable_of_option Event_listener.to_any) callback in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.to_unit
      (Js.meth_call this "addEventListener" [| type'; callback; options |])

  let remove_event_listener ~type' ~callback ?options this =
    let type' = Js.Any.of_string type' in
    let callback = (Js.Any.nullable_of_option Event_listener.to_any) callback in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.to_unit
      (Js.meth_call this "removeEventListener" [| type'; callback; options |])

  let dispatch_event ~event this =
    let event = Event.to_any event in
    Js.Any.to_bool (Js.meth_call this "dispatchEvent" [| event |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget} \
   [EventTarget] on MDN}."]

and Event_listener : sig
  type t = Event.t -> unit

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Event.t -> unit

  let to_any this = Js.Any.of_fun 1 this

  let of_any any =
    let __f_js = Js.magic any in
    fun event ->
      let event = Event.to_any event in
      Js.to_unit (Js.fun_call __f_js [| event |])
end

and Event_listener_options : sig
  type t [@@ocaml.doc "The type for the [EventListenerOptions] dictionary."]

  val make : ?capture:bool -> unit -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val capture : t -> bool option
end = struct
  type t = Js.any

  let make ?capture () =
    let capture = (Js.Any.nullable_of_option Js.Any.of_bool) capture in
    Js.obj [| ("capture", capture) |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let capture this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "capture")
end

and Add_event_listener_options : sig
  type t [@@ocaml.doc "The type for the [AddEventListenerOptions] dictionary."]

  val make : ?passive:bool -> ?once:bool -> ?signal:Abort_signal.t -> unit -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val to_event_listener_options : t -> Event_listener_options.t
  val passive : t -> bool option
  val once : t -> bool option
  val signal : t -> Abort_signal.t option
end = struct
  type t = Js.any

  let make ?passive ?once ?signal () =
    let passive = (Js.Any.nullable_of_option Js.Any.of_bool) passive in
    let once = (Js.Any.nullable_of_option Js.Any.of_bool) once in
    let signal = (Js.Any.nullable_of_option Abort_signal.to_any) signal in
    Js.obj [| ("passive", passive); ("once", once); ("signal", signal) |]

  let super this = Js.magic this
  let to_any = Js.to_any
  let of_any = Js.of_any

  let passive this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "passive")

  let once this = (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "once")

  let signal this =
    (Js.Any.nullable_to_option Abort_signal.of_any) (Js.get this "signal")
end

and Abort_controller : sig
  type t = [ `Abort_controller ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortController} \
     [AbortController]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t

  val signal : t -> 'a Abort_signal.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortController/signal} \
     [signal] on MDN}."]

  val abort : ?reason:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortController/abort} \
     [abort] on MDN}."]
end = struct
  type t = [ `Abort_controller ] Js.t

  let t = Js.raw "AbortController"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]
  let signal this = Abort_signal.of_any (Js.get this "signal")

  let abort ?reason this =
    let reason = (Js.Any.undefined_of_option Js.of_any) reason in
    Js.to_unit (Js.meth_call this "abort" [| reason |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/AbortController} \
   [AbortController] on MDN}."]

and Abort_signal : sig
  type t = [ `Abort_signal ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal} \
     [AbortSignal]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Abort_signal | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal} \
     [AbortSignal]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val abort : ?reason:Js.any -> unit -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/abort} \
     [abort] on MDN}."]

  val timeout : milliseconds:int -> unit -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/timeout} \
     [timeout] on MDN}."]

  val _any : signals:Abort_signal.t array -> unit -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/_any} [_any] \
     on MDN}."]

  val aborted : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/aborted} \
     [aborted] on MDN}."]

  val reason : t -> Js.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/reason} \
     [reason] on MDN}."]

  val throw_if_aborted : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/throwIfAborted} \
     [throwIfAborted] on MDN}."]

  val onabort : t -> Event_handler.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/onabort} \
     [onabort] on MDN}."]

  val set_onabort : t -> Event_handler.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal/onabort} \
     [onabort] on MDN}."]
end = struct
  type t = [ `Abort_signal ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Abort_signal | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal} \
     [AbortSignal]} interface or any base interface that it inherits."]

  let t = Js.raw "AbortSignal"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_event_target this = Js.magic this

  let abort ?reason () =
    let reason = (Js.Any.undefined_of_option Js.of_any) reason in
    of_any (Js.meth_call t "abort" [| reason |])

  let timeout ~milliseconds () =
    let milliseconds = Js.Any.of_int milliseconds in
    of_any (Js.meth_call t "timeout" [| milliseconds |])

  let _any ~signals () =
    let signals = (Js.Any.of_array to_any) signals in
    of_any (Js.meth_call t "_any" [| signals |])

  let aborted this = Js.Any.to_bool (Js.get this "aborted")
  let reason this = Js.to_any (Js.get this "reason")

  let throw_if_aborted this =
    Js.to_unit (Js.meth_call this "throwIfAborted" [||])

  let onabort this = Event_handler.of_any (Js.get this "onabort")
  let set_onabort this x = Js.set this "onabort" (Event_handler.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/AbortSignal} \
   [AbortSignal] on MDN}."]

and Node_list : sig
  type t = [ `Node_list ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeList} [NodeList]} \
     interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val item : index:int -> t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/NodeList/item} \
     [item] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/NodeList/length} \
     [length] on MDN}."]
end = struct
  type t = [ `Node_list ] Js.t

  let t = Js.raw "NodeList"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let item ~index this =
    let index = Js.Any.of_int index in
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "item" [| index |])

  let length this = Js.Any.to_int (Js.get this "length")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/NodeList} \
   [NodeList] on MDN}."]

and Html_collection : sig
  type t = [ `Html_collection ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection} \
     [HTMLCollection]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection/length} \
     [length] on MDN}."]

  val item : index:int -> t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection/item} \
     [item] on MDN}."]

  val named_item : name:string -> t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection/namedItem} \
     [namedItem] on MDN}."]
end = struct
  type t = [ `Html_collection ] Js.t

  let t = Js.raw "HTMLCollection"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let length this = Js.Any.to_int (Js.get this "length")

  let item ~index this =
    let index = Js.Any.of_int index in
    (Js.Any.nullable_to_option Element.of_any)
      (Js.meth_call this "item" [| index |])

  let named_item ~name this =
    let name = Js.Any.of_string name in
    (Js.Any.nullable_to_option Element.of_any)
      (Js.meth_call this "namedItem" [| name |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection} \
   [HTMLCollection] on MDN}."]

and Mutation_observer : sig
  type t = [ `Mutation_observer ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver} \
     [MutationObserver]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : callback:Mutation_callback.t -> unit -> t

  val observe : target:Node.t -> ?options:Mutation_observer_init.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/observe} \
     [observe] on MDN}."]

  val disconnect : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/disconnect} \
     [disconnect] on MDN}."]

  val take_records : t -> Mutation_record.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver/takeRecords} \
     [takeRecords] on MDN}."]
end = struct
  type t = [ `Mutation_observer ] Js.t

  let t = Js.raw "MutationObserver"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let make ~callback () =
    let callback = Mutation_callback.to_any callback in
    Js.obj_new t [| callback |]

  let observe ~target ?options this =
    let target = Node.to_any target in
    let options =
      (Js.Any.undefined_of_option Mutation_observer_init.to_any) options
    in
    Js.to_unit (Js.meth_call this "observe" [| target; options |])

  let disconnect this = Js.to_unit (Js.meth_call this "disconnect" [||])

  let take_records this =
    (Js.Any.to_array Mutation_record.of_any)
      (Js.meth_call this "takeRecords" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver} \
   [MutationObserver] on MDN}."]

and Mutation_callback : sig
  type t = Mutation_record.t array -> Mutation_observer.t -> unit

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Mutation_callback

and Mutation_observer_init : sig
  type t [@@ocaml.doc "The type for the [MutationObserverInit] dictionary."]

  val make :
    ?child_list:bool ->
    ?attributes:bool ->
    ?character_data:bool ->
    ?subtree:bool ->
    ?attribute_old_value:bool ->
    ?character_data_old_value:bool ->
    ?attribute_filter:string array ->
    unit ->
    t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val child_list : t -> bool option
  val attributes : t -> bool option
  val character_data : t -> bool option
  val subtree : t -> bool option
  val attribute_old_value : t -> bool option
  val character_data_old_value : t -> bool option
  val attribute_filter : t -> string array option
end = struct
  type t = Js.any

  let make ?child_list ?attributes ?character_data ?subtree ?attribute_old_value
      ?character_data_old_value ?attribute_filter () =
    let child_list = (Js.Any.nullable_of_option Js.Any.of_bool) child_list in
    let attributes = (Js.Any.nullable_of_option Js.Any.of_bool) attributes in
    let character_data =
      (Js.Any.nullable_of_option Js.Any.of_bool) character_data
    in
    let subtree = (Js.Any.nullable_of_option Js.Any.of_bool) subtree in
    let attribute_old_value =
      (Js.Any.nullable_of_option Js.Any.of_bool) attribute_old_value
    in
    let character_data_old_value =
      (Js.Any.nullable_of_option Js.Any.of_bool) character_data_old_value
    in
    let attribute_filter =
      (Js.Any.nullable_of_option (Js.Any.of_array Js.Any.of_string))
        attribute_filter
    in
    Js.obj
      [|
        ("childList", child_list);
        ("attributes", attributes);
        ("characterData", character_data);
        ("subtree", subtree);
        ("attributeOldValue", attribute_old_value);
        ("characterDataOldValue", character_data_old_value);
        ("attributeFilter", attribute_filter);
      |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let child_list this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "childList")

  let attributes this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "attributes")

  let character_data this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "characterData")

  let subtree this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "subtree")

  let attribute_old_value this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "attributeOldValue")

  let character_data_old_value this =
    (Js.Any.nullable_to_option Js.Any.to_bool)
      (Js.get this "characterDataOldValue")

  let attribute_filter this =
    (Js.Any.nullable_to_option (Js.Any.to_array Js.Any.to_string))
      (Js.get this "attributeFilter")
end

and Mutation_record : sig
  type t = [ `Mutation_record ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord} \
     [MutationRecord]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val type' : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/type} \
     [type] on MDN}."]

  val target : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/target} \
     [target] on MDN}."]

  val added_nodes : t -> Node_list.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/addedNodes} \
     [addedNodes] on MDN}."]

  val removed_nodes : t -> Node_list.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/removedNodes} \
     [removedNodes] on MDN}."]

  val previous_sibling : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/previousSibling} \
     [previousSibling] on MDN}."]

  val next_sibling : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/nextSibling} \
     [nextSibling] on MDN}."]

  val attribute_name : t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/attributeName} \
     [attributeName] on MDN}."]

  val attribute_namespace : t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/attributeNamespace} \
     [attributeNamespace] on MDN}."]

  val old_value : t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord/oldValue} \
     [oldValue] on MDN}."]
end = struct
  type t = [ `Mutation_record ] Js.t

  let t = Js.raw "MutationRecord"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let type' this = Js.Any.to_string (Js.get this "type")
  let target this = Node.of_any (Js.get this "target")
  let added_nodes this = Node_list.of_any (Js.get this "addedNodes")
  let removed_nodes this = Node_list.of_any (Js.get this "removedNodes")

  let previous_sibling this =
    (Js.Any.nullable_to_option Node.of_any) (Js.get this "previousSibling")

  let next_sibling this =
    (Js.Any.nullable_to_option Node.of_any) (Js.get this "nextSibling")

  let attribute_name this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "attributeName")

  let attribute_namespace this =
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.get this "attributeNamespace")

  let old_value this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "oldValue")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/MutationRecord} \
   [MutationRecord] on MDN}."]

and Node : sig
  type t = [ `Node ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node} [Node]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node} [Node]} interface \
     or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val element_node : int
  val attribute_node : int
  val text_node : int
  val cdata_section_node : int
  val entity_reference_node : int
  val entity_node : int
  val processing_instruction_node : int
  val comment_node : int
  val document_node : int
  val document_type_node : int
  val document_fragment_node : int
  val notation_node : int

  val node_type : t -> int
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeType} \
     [nodeType] on MDN}."]

  val node_name : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeName} \
     [nodeName] on MDN}."]

  val base_uri : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/baseURI} \
     [baseURI] on MDN}."]

  val is_connected : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/isConnected} \
     [isConnected] on MDN}."]

  val owner_document : t -> 'a Document.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/ownerDocument} \
     [ownerDocument] on MDN}."]

  val get_root_node : ?options:Get_root_node_options.t -> t -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/getRootNode} \
     [getRootNode] on MDN}."]

  val parent_node : t -> 'a super option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/parentNode} \
     [parentNode] on MDN}."]

  val parent_element : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/parentElement} \
     [parentElement] on MDN}."]

  val has_child_nodes : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/hasChildNodes} \
     [hasChildNodes] on MDN}."]

  val child_nodes : t -> Node_list.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/childNodes} \
     [childNodes] on MDN}."]

  val first_child : t -> 'a super option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/firstChild} \
     [firstChild] on MDN}."]

  val last_child : t -> 'a super option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/lastChild} \
     [lastChild] on MDN}."]

  val previous_sibling : t -> 'a super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/previousSibling} \
     [previousSibling] on MDN}."]

  val next_sibling : t -> 'a super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/nextSibling} \
     [nextSibling] on MDN}."]

  val node_value : t -> string option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeValue} \
     [nodeValue] on MDN}."]

  val set_node_value : t -> string option -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeValue} \
     [nodeValue] on MDN}."]

  val text_content : t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent} \
     [textContent] on MDN}."]

  val set_text_content : t -> string option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent} \
     [textContent] on MDN}."]

  val normalize : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/normalize} \
     [normalize] on MDN}."]

  val clone_node : ?deep:bool -> t -> 'a super
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/cloneNode} \
     [cloneNode] on MDN}."]

  val is_equal_node : other_node:t option -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/isEqualNode} \
     [isEqualNode] on MDN}."]

  val is_same_node : other_node:t option -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/isSameNode} \
     [isSameNode] on MDN}."]

  val document_position_disconnected : int
  val document_position_preceding : int
  val document_position_following : int
  val document_position_contains : int
  val document_position_contained_by : int
  val document_position_implementation_specific : int

  val compare_document_position : other:t -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/compareDocumentPosition} \
     [compareDocumentPosition] on MDN}."]

  val contains : other:t option -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/contains} \
     [contains] on MDN}."]

  val lookup_prefix : namespace:string option -> t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/lookupPrefix} \
     [lookupPrefix] on MDN}."]

  val lookup_namespace_uri : prefix:string option -> t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/lookupNamespaceURI} \
     [lookupNamespaceURI] on MDN}."]

  val is_default_namespace : namespace:string option -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/isDefaultNamespace} \
     [isDefaultNamespace] on MDN}."]

  val insert_before : node:t -> child:t option -> t -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/insertBefore} \
     [insertBefore] on MDN}."]

  val append_child : node:t -> t -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild} \
     [appendChild] on MDN}."]

  val replace_child : node:t -> child:t -> t -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/replaceChild} \
     [replaceChild] on MDN}."]

  val remove_child : child:t -> t -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild} \
     [removeChild] on MDN}."]
end = struct
  type t = [ `Node ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node} [Node]} interface \
     or any base interface that it inherits."]

  let t = Js.raw "Node"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_event_target this = Js.magic this
  let element_node = 1
  let attribute_node = 2
  let text_node = 3
  let cdata_section_node = 4
  let entity_reference_node = 5
  let entity_node = 6
  let processing_instruction_node = 7
  let comment_node = 8
  let document_node = 9
  let document_type_node = 10
  let document_fragment_node = 11
  let notation_node = 12
  let node_type this = Js.Any.to_int (Js.get this "nodeType")
  let node_name this = Js.Any.to_string (Js.get this "nodeName")
  let base_uri this = Js.Any.to_string (Js.get this "baseURI")
  let is_connected this = Js.Any.to_bool (Js.get this "isConnected")

  let owner_document this =
    (Js.Any.nullable_to_option Document.of_any) (Js.get this "ownerDocument")

  let get_root_node ?options this =
    let options =
      (Js.Any.undefined_of_option Get_root_node_options.to_any) options
    in
    of_any (Js.meth_call this "getRootNode" [| options |])

  let parent_node this =
    (Js.Any.nullable_to_option of_any) (Js.get this "parentNode")

  let parent_element this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "parentElement")

  let has_child_nodes this =
    Js.Any.to_bool (Js.meth_call this "hasChildNodes" [||])

  let child_nodes this = Node_list.of_any (Js.get this "childNodes")

  let first_child this =
    (Js.Any.nullable_to_option of_any) (Js.get this "firstChild")

  let last_child this =
    (Js.Any.nullable_to_option of_any) (Js.get this "lastChild")

  let previous_sibling this =
    (Js.Any.nullable_to_option of_any) (Js.get this "previousSibling")

  let next_sibling this =
    (Js.Any.nullable_to_option of_any) (Js.get this "nextSibling")

  let node_value this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "nodeValue")

  let set_node_value this x =
    Js.set this "nodeValue" ((Js.Any.nullable_of_option Js.Any.of_string) x)

  let text_content this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "textContent")

  let set_text_content this x =
    Js.set this "textContent" ((Js.Any.nullable_of_option Js.Any.of_string) x)

  let normalize this = Js.to_unit (Js.meth_call this "normalize" [||])

  let clone_node ?deep this =
    let deep = (Js.Any.undefined_of_option Js.Any.of_bool) deep in
    of_any (Js.meth_call this "cloneNode" [| deep |])

  let is_equal_node ~other_node this =
    let other_node = (Js.Any.nullable_of_option to_any) other_node in
    Js.Any.to_bool (Js.meth_call this "isEqualNode" [| other_node |])

  let is_same_node ~other_node this =
    let other_node = (Js.Any.nullable_of_option to_any) other_node in
    Js.Any.to_bool (Js.meth_call this "isSameNode" [| other_node |])

  let document_position_disconnected = 1
  let document_position_preceding = 2
  let document_position_following = 4
  let document_position_contains = 8
  let document_position_contained_by = 16
  let document_position_implementation_specific = 32

  let compare_document_position ~other this =
    let other = to_any other in
    Js.Any.to_int (Js.meth_call this "compareDocumentPosition" [| other |])

  let contains ~other this =
    let other = (Js.Any.nullable_of_option to_any) other in
    Js.Any.to_bool (Js.meth_call this "contains" [| other |])

  let lookup_prefix ~namespace this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.meth_call this "lookupPrefix" [| namespace |])

  let lookup_namespace_uri ~prefix this =
    let prefix = (Js.Any.nullable_of_option Js.Any.of_string) prefix in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.meth_call this "lookupNamespaceURI" [| prefix |])

  let is_default_namespace ~namespace this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    Js.Any.to_bool (Js.meth_call this "isDefaultNamespace" [| namespace |])

  let insert_before ~node ~child this =
    let node = to_any node in
    let child = (Js.Any.nullable_of_option to_any) child in
    of_any (Js.meth_call this "insertBefore" [| node; child |])

  let append_child ~node this =
    let node = to_any node in
    of_any (Js.meth_call this "appendChild" [| node |])

  let replace_child ~node ~child this =
    let node = to_any node in
    let child = to_any child in
    of_any (Js.meth_call this "replaceChild" [| node; child |])

  let remove_child ~child this =
    let child = to_any child in
    of_any (Js.meth_call this "removeChild" [| child |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node} [Node] on \
   MDN}."]

and Get_root_node_options : sig
  type t [@@ocaml.doc "The type for the [GetRootNodeOptions] dictionary."]

  val make : ?composed:bool -> unit -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val composed : t -> bool option
end = struct
  type t = Js.any

  let make ?composed () =
    let composed = (Js.Any.nullable_of_option Js.Any.of_bool) composed in
    Js.obj [| ("composed", composed) |]

  let to_any = Js.to_any
  let of_any = Js.of_any

  let composed this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "composed")
end

and Document : sig
  type t = [ `Document ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document} [Document]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Document | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document} [Document]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val make : unit -> 'a super

  val implementation : t -> Dom_implementation.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/implementation} \
     [implementation] on MDN}."]

  val url : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Document/URL} \
     [URL] on MDN}."]

  val document_uri : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/documentURI} \
     [documentURI] on MDN}."]

  val compat_mode : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/compatMode} \
     [compatMode] on MDN}."]

  val character_set : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/characterSet} \
     [characterSet] on MDN}."]

  val charset : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/charset} \
     [charset] on MDN}."]

  val input_encoding : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/inputEncoding} \
     [inputEncoding] on MDN}."]

  val content_type : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/contentType} \
     [contentType] on MDN}."]

  val doctype : t -> 'a Document_type.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/doctype} \
     [doctype] on MDN}."]

  val document_element : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/documentElement} \
     [documentElement] on MDN}."]

  val get_elements_by_tag_name : qualified_name:string -> t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByTagName} \
     [getElementsByTagName] on MDN}."]

  val get_elements_by_tag_name_ns :
    namespace:string option -> local_name:string -> t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByTagNameNS} \
     [getElementsByTagNameNS] on MDN}."]

  val get_elements_by_class_name : class_names:string -> t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByClassName} \
     [getElementsByClassName] on MDN}."]

  val create_element :
    local_name:string ->
    ?options:[< `String | `Element_creation_options ] Js.t ->
    t ->
    'a Element.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement} \
     [createElement] on MDN}."]

  val create_element_ns :
    namespace:string option ->
    qualified_name:string ->
    ?options:[< `String | `Element_creation_options ] Js.t ->
    t ->
    'a Element.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createElementNS} \
     [createElementNS] on MDN}."]

  val create_document_fragment : t -> 'a Document_fragment.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createDocumentFragment} \
     [createDocumentFragment] on MDN}."]

  val create_text_node : data:string -> t -> 'a Text.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createTextNode} \
     [createTextNode] on MDN}."]

  val create_cdata_section : data:string -> t -> 'a Cdata_section.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createCDATASection} \
     [createCDATASection] on MDN}."]

  val create_comment : data:string -> t -> 'a Comment.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createComment} \
     [createComment] on MDN}."]

  val create_processing_instruction :
    target:string -> data:string -> t -> 'a Processing_instruction.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createProcessingInstruction} \
     [createProcessingInstruction] on MDN}."]

  val import_node : node:Node.t -> ?deep:bool -> t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/importNode} \
     [importNode] on MDN}."]

  val adopt_node : node:Node.t -> t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/adoptNode} \
     [adoptNode] on MDN}."]

  val create_attribute : local_name:string -> t -> 'a Attr.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createAttribute} \
     [createAttribute] on MDN}."]

  val create_attribute_ns :
    namespace:string option -> qualified_name:string -> t -> 'a Attr.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createAttributeNS} \
     [createAttributeNS] on MDN}."]

  val create_event : interface:string -> t -> 'a Event.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createEvent} \
     [createEvent] on MDN}."]

  val create_range : t -> 'a Range.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createRange} \
     [createRange] on MDN}."]

  val create_node_iterator :
    root:Node.t ->
    ?what_to_show:int ->
    ?filter:Node_filter.t option ->
    t ->
    Node_iterator.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createNodeIterator} \
     [createNodeIterator] on MDN}."]

  val create_tree_walker :
    root:Node.t ->
    ?what_to_show:int ->
    ?filter:Node_filter.t option ->
    t ->
    Tree_walker.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createTreeWalker} \
     [createTreeWalker] on MDN}."]

  val evaluate :
    expression:string ->
    context_node:Node.t ->
    ?resolver:X_path_ns_resolver.t option ->
    ?type':int ->
    ?result:X_path_result.t option ->
    t ->
    X_path_result.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/evaluate} \
     [evaluate] on MDN}."]

  val create_ns_resolver : node_resolver:Node.t -> t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createNSResolver} \
     [createNSResolver] on MDN}."]

  val create_expression :
    expression:string ->
    ?resolver:X_path_ns_resolver.t option ->
    t ->
    X_path_expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/createExpression} \
     [createExpression] on MDN}."]

  val query_selector_all : selectors:string -> t -> Node_list.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelectorAll} \
     [querySelectorAll] on MDN}."]

  val query_selector : selectors:string -> t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector} \
     [querySelector] on MDN}."]

  val replace_children :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/replaceChildren} \
     [replaceChildren] on MDN}."]

  val append :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Document/append} \
     [append] on MDN}."]

  val prepend :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/prepend} \
     [prepend] on MDN}."]

  val child_element_count : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/childElementCount} \
     [childElementCount] on MDN}."]

  val last_element_child : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/lastElementChild} \
     [lastElementChild] on MDN}."]

  val first_element_child : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/firstElementChild} \
     [firstElementChild] on MDN}."]

  val children : t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document/children} \
     [children] on MDN}."]
end = struct
  type t = [ `Document ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Document | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Document} [Document]} \
     interface or any base interface that it inherits."]

  let t = Js.raw "Document"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.magic this
  let make () = Js.obj_new t [||]

  let implementation this =
    Dom_implementation.of_any (Js.get this "implementation")

  let url this = Js.Any.to_string (Js.get this "URL")
  let document_uri this = Js.Any.to_string (Js.get this "documentURI")
  let compat_mode this = Js.Any.to_string (Js.get this "compatMode")
  let character_set this = Js.Any.to_string (Js.get this "characterSet")
  let charset this = Js.Any.to_string (Js.get this "charset")
  let input_encoding this = Js.Any.to_string (Js.get this "inputEncoding")
  let content_type this = Js.Any.to_string (Js.get this "contentType")

  let doctype this =
    (Js.Any.nullable_to_option Document_type.of_any) (Js.get this "doctype")

  let document_element this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "documentElement")

  let get_elements_by_tag_name ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Html_collection.of_any
      (Js.meth_call this "getElementsByTagName" [| qualified_name |])

  let get_elements_by_tag_name_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Html_collection.of_any
      (Js.meth_call this "getElementsByTagNameNS" [| namespace; local_name |])

  let get_elements_by_class_name ~class_names this =
    let class_names = Js.Any.of_string class_names in
    Html_collection.of_any
      (Js.meth_call this "getElementsByClassName" [| class_names |])

  let create_element ~local_name ?options this =
    let local_name = Js.Any.of_string local_name in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Element.of_any (Js.meth_call this "createElement" [| local_name; options |])

  let create_element_ns ~namespace ~qualified_name ?options this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Element.of_any
      (Js.meth_call this "createElementNS"
         [| namespace; qualified_name; options |]
      )

  let create_document_fragment this =
    Document_fragment.of_any (Js.meth_call this "createDocumentFragment" [||])

  let create_text_node ~data this =
    let data = Js.Any.of_string data in
    Text.of_any (Js.meth_call this "createTextNode" [| data |])

  let create_cdata_section ~data this =
    let data = Js.Any.of_string data in
    Cdata_section.of_any (Js.meth_call this "createCDATASection" [| data |])

  let create_comment ~data this =
    let data = Js.Any.of_string data in
    Comment.of_any (Js.meth_call this "createComment" [| data |])

  let create_processing_instruction ~target ~data this =
    let target = Js.Any.of_string target in
    let data = Js.Any.of_string data in
    Processing_instruction.of_any
      (Js.meth_call this "createProcessingInstruction" [| target; data |])

  let import_node ~node ?deep this =
    let node = Node.to_any node in
    let deep = (Js.Any.undefined_of_option Js.Any.of_bool) deep in
    Node.of_any (Js.meth_call this "importNode" [| node; deep |])

  let adopt_node ~node this =
    let node = Node.to_any node in
    Node.of_any (Js.meth_call this "adoptNode" [| node |])

  let create_attribute ~local_name this =
    let local_name = Js.Any.of_string local_name in
    Attr.of_any (Js.meth_call this "createAttribute" [| local_name |])

  let create_attribute_ns ~namespace ~qualified_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    Attr.of_any
      (Js.meth_call this "createAttributeNS" [| namespace; qualified_name |])

  let create_event ~interface this =
    let interface = Js.Any.of_string interface in
    Event.of_any (Js.meth_call this "createEvent" [| interface |])

  let create_range this = Range.of_any (Js.meth_call this "createRange" [||])

  let create_node_iterator ~root ?what_to_show ?filter this =
    let root = Node.to_any root in
    let what_to_show =
      (Js.Any.undefined_of_option Js.Any.of_int) what_to_show
    in
    let filter =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Node_filter.to_any))
        filter
    in
    Node_iterator.of_any
      (Js.meth_call this "createNodeIterator" [| root; what_to_show; filter |])

  let create_tree_walker ~root ?what_to_show ?filter this =
    let root = Node.to_any root in
    let what_to_show =
      (Js.Any.undefined_of_option Js.Any.of_int) what_to_show
    in
    let filter =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Node_filter.to_any))
        filter
    in
    Tree_walker.of_any
      (Js.meth_call this "createTreeWalker" [| root; what_to_show; filter |])

  let evaluate ~expression ~context_node ?resolver ?type' ?result this =
    let expression = Js.Any.of_string expression in
    let context_node = Node.to_any context_node in
    let resolver =
      (Js.Any.undefined_of_option
         (Js.Any.nullable_of_option X_path_ns_resolver.to_any)
      )
        resolver
    in
    let type' = (Js.Any.undefined_of_option Js.Any.of_int) type' in
    let result =
      (Js.Any.undefined_of_option
         (Js.Any.nullable_of_option X_path_result.to_any)
      )
        result
    in
    X_path_result.of_any
      (Js.meth_call this "evaluate"
         [| expression; context_node; resolver; type'; result |]
      )

  let create_ns_resolver ~node_resolver this =
    let node_resolver = Node.to_any node_resolver in
    Node.of_any (Js.meth_call this "createNSResolver" [| node_resolver |])

  let create_expression ~expression ?resolver this =
    let expression = Js.Any.of_string expression in
    let resolver =
      (Js.Any.undefined_of_option
         (Js.Any.nullable_of_option X_path_ns_resolver.to_any)
      )
        resolver
    in
    X_path_expression.of_any
      (Js.meth_call this "createExpression" [| expression; resolver |])

  let query_selector_all ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Node_list.of_any (Js.meth_call this "querySelectorAll" [| selectors |])

  let query_selector ~selectors this =
    let selectors = Js.Any.of_string selectors in
    (Js.Any.nullable_to_option Element.of_any)
      (Js.meth_call this "querySelector" [| selectors |])

  let replace_children ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "replaceChildren" [| nodes |])

  let append ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "append" [| nodes |])

  let prepend ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "prepend" [| nodes |])

  let child_element_count this = Js.Any.to_int (Js.get this "childElementCount")

  let last_element_child this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "lastElementChild")

  let first_element_child this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "firstElementChild")

  let children this = Html_collection.of_any (Js.get this "children")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Document} \
   [Document] on MDN}."]

and Xml_document : sig
  type t = [ `Xml_document ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XMLDocument} \
     [XMLDocument]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Xml_document | `Document | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XMLDocument} \
     [XMLDocument]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Xml_document ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Xml_document | `Document | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XMLDocument} \
     [XMLDocument]} interface or any base interface that it inherits."]

  let t = Js.raw "XMLDocument"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_document this = Js.magic this
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/XMLDocument} \
   [XMLDocument] on MDN}."]

and Element_creation_options : sig
  type t [@@ocaml.doc "The type for the [ElementCreationOptions] dictionary."]

  val make : ?is:string -> unit -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val is : t -> string option
end = struct
  type t = Js.any

  let make ?is () =
    let is = (Js.Any.nullable_of_option Js.Any.of_string) is in
    Js.obj [| ("is", is) |]

  let to_any = Js.to_any
  let of_any = Js.of_any
  let is this = (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "is")
end

and Dom_implementation : sig
  type t = [ `Dom_implementation ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation} \
     [DOMImplementation]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val create_document_type :
    qualified_name:string ->
    public_id:string ->
    system_id:string ->
    t ->
    'a Document_type.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation/createDocumentType} \
     [createDocumentType] on MDN}."]

  val create_document :
    namespace:string option ->
    qualified_name:string ->
    ?doctype:Document_type.t option ->
    t ->
    'a Xml_document.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation/createDocument} \
     [createDocument] on MDN}."]

  val create_html_document : ?title:string -> t -> 'a Document.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation/createHTMLDocument} \
     [createHTMLDocument] on MDN}."]

  val has_feature : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation/hasFeature} \
     [hasFeature] on MDN}."]
end = struct
  type t = [ `Dom_implementation ] Js.t

  let t = Js.raw "DOMImplementation"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let create_document_type ~qualified_name ~public_id ~system_id this =
    let qualified_name = Js.Any.of_string qualified_name in
    let public_id = Js.Any.of_string public_id in
    let system_id = Js.Any.of_string system_id in
    Document_type.of_any
      (Js.meth_call this "createDocumentType"
         [| qualified_name; public_id; system_id |]
      )

  let create_document ~namespace ~qualified_name ?doctype this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    let doctype =
      (Js.Any.undefined_of_option
         (Js.Any.nullable_of_option Document_type.to_any)
      )
        doctype
    in
    Xml_document.of_any
      (Js.meth_call this "createDocument"
         [| namespace; qualified_name; doctype |]
      )

  let create_html_document ?title this =
    let title = (Js.Any.undefined_of_option Js.Any.of_string) title in
    Document.of_any (Js.meth_call this "createHTMLDocument" [| title |])

  let has_feature this = Js.Any.to_bool (Js.meth_call this "hasFeature" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DOMImplementation} \
   [DOMImplementation] on MDN}."]

and Document_type : sig
  type t = [ `Document_type ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentType} \
     [DocumentType]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Document_type | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentType} \
     [DocumentType]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentType/name} \
     [name] on MDN}."]

  val public_id : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentType/publicId} \
     [publicId] on MDN}."]

  val system_id : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentType/systemId} \
     [systemId] on MDN}."]
end = struct
  type t = [ `Document_type ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Document_type | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentType} \
     [DocumentType]} interface or any base interface that it inherits."]

  let t = Js.raw "DocumentType"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.magic this
  let name this = Js.Any.to_string (Js.get this "name")
  let public_id this = Js.Any.to_string (Js.get this "publicId")
  let system_id this = Js.Any.to_string (Js.get this "systemId")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DocumentType} \
   [DocumentType] on MDN}."]

and Document_fragment : sig
  type t = [ `Document_fragment ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment} \
     [DocumentFragment]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Document_fragment | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment} \
     [DocumentFragment]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val make : unit -> 'a super

  val query_selector_all : selectors:string -> t -> Node_list.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/querySelectorAll} \
     [querySelectorAll] on MDN}."]

  val query_selector : selectors:string -> t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/querySelector} \
     [querySelector] on MDN}."]

  val replace_children :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/replaceChildren} \
     [replaceChildren] on MDN}."]

  val append :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/append} \
     [append] on MDN}."]

  val prepend :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/prepend} \
     [prepend] on MDN}."]

  val child_element_count : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/childElementCount} \
     [childElementCount] on MDN}."]

  val last_element_child : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/lastElementChild} \
     [lastElementChild] on MDN}."]

  val first_element_child : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/firstElementChild} \
     [firstElementChild] on MDN}."]

  val children : t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment/children} \
     [children] on MDN}."]
end = struct
  type t = [ `Document_fragment ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Document_fragment | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment} \
     [DocumentFragment]} interface or any base interface that it inherits."]

  let t = Js.raw "DocumentFragment"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.magic this
  let make () = Js.obj_new t [||]

  let query_selector_all ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Node_list.of_any (Js.meth_call this "querySelectorAll" [| selectors |])

  let query_selector ~selectors this =
    let selectors = Js.Any.of_string selectors in
    (Js.Any.nullable_to_option Element.of_any)
      (Js.meth_call this "querySelector" [| selectors |])

  let replace_children ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "replaceChildren" [| nodes |])

  let append ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "append" [| nodes |])

  let prepend ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "prepend" [| nodes |])

  let child_element_count this = Js.Any.to_int (Js.get this "childElementCount")

  let last_element_child this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "lastElementChild")

  let first_element_child this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "firstElementChild")

  let children this = Html_collection.of_any (Js.get this "children")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment} \
   [DocumentFragment] on MDN}."]

and Shadow_root : sig
  type t = [ `Shadow_root ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot} \
     [ShadowRoot]} interface."]

  type 'a super = 'a Js.t
    constraint
      'a =
      [< `Shadow_root | `Document_fragment | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot} \
     [ShadowRoot]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val mode : t -> Shadow_root_mode.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/mode} \
     [mode] on MDN}."]

  val delegates_focus : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/delegatesFocus} \
     [delegatesFocus] on MDN}."]

  val slot_assignment : t -> Slot_assignment_mode.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/slotAssignment} \
     [slotAssignment] on MDN}."]

  val clonable : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/clonable} \
     [clonable] on MDN}."]

  val serializable : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/serializable} \
     [serializable] on MDN}."]

  val host : t -> 'a Element.super
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/host} \
     [host] on MDN}."]

  val onslotchange : t -> Event_handler.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/onslotchange} \
     [onslotchange] on MDN}."]

  val set_onslotchange : t -> Event_handler.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot/onslotchange} \
     [onslotchange] on MDN}."]
end = struct
  type t = [ `Shadow_root ] Js.t

  type 'a super = 'a Js.t
    constraint
      'a =
      [< `Shadow_root | `Document_fragment | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot} \
     [ShadowRoot]} interface or any base interface that it inherits."]

  let t = Js.raw "ShadowRoot"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_document_fragment this = Js.magic this
  let mode this = Shadow_root_mode.of_any (Js.get this "mode")
  let delegates_focus this = Js.Any.to_bool (Js.get this "delegatesFocus")

  let slot_assignment this =
    Slot_assignment_mode.of_any (Js.get this "slotAssignment")

  let clonable this = Js.Any.to_bool (Js.get this "clonable")
  let serializable this = Js.Any.to_bool (Js.get this "serializable")
  let host this = Element.of_any (Js.get this "host")
  let onslotchange this = Event_handler.of_any (Js.get this "onslotchange")

  let set_onslotchange this x =
    Js.set this "onslotchange" (Event_handler.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot} \
   [ShadowRoot] on MDN}."]

and Shadow_root_mode : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val open' : t [@@ocaml.doc "The [open] enum value."]

  val closed' : t [@@ocaml.doc "The [closed] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let open' = Js.of_string "open"
  let closed' = Js.of_string "closed"
end

and Slot_assignment_mode : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val manual : t [@@ocaml.doc "The [manual] enum value."]

  val named : t [@@ocaml.doc "The [named] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let manual = Js.of_string "manual"
  let named = Js.of_string "named"
end

and Element : sig
  type t = [ `Element ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element} [Element]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Element | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element} [Element]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val namespace_uri : t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/namespaceURI} \
     [namespaceURI] on MDN}."]

  val prefix : t -> string option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/prefix} \
     [prefix] on MDN}."]

  val local_name : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/localName} \
     [localName] on MDN}."]

  val tag_name : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/tagName} \
     [tagName] on MDN}."]

  val id : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/id} [id] \
     on MDN}."]

  val set_id : t -> string -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/id} [id] \
     on MDN}."]

  val class_name : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/className} \
     [className] on MDN}."]

  val set_class_name : t -> string -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/className} \
     [className] on MDN}."]

  val class_list : t -> Dom_token_list.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/classList} \
     [classList] on MDN}."]

  val slot : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/slot} \
     [slot] on MDN}."]

  val set_slot : t -> string -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/slot} \
     [slot] on MDN}."]

  val has_attributes : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/hasAttributes} \
     [hasAttributes] on MDN}."]

  val attributes : t -> Named_node_map.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/attributes} \
     [attributes] on MDN}."]

  val get_attribute_names : t -> string array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttributeNames} \
     [getAttributeNames] on MDN}."]

  val get_attribute : qualified_name:string -> t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttribute} \
     [getAttribute] on MDN}."]

  val get_attribute_ns :
    namespace:string option -> local_name:string -> t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttributeNS} \
     [getAttributeNS] on MDN}."]

  val set_attribute : qualified_name:string -> value:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttribute} \
     [setAttribute] on MDN}."]

  val set_attribute_ns :
    namespace:string option ->
    qualified_name:string ->
    value:string ->
    t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttributeNS} \
     [setAttributeNS] on MDN}."]

  val remove_attribute : qualified_name:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/removeAttribute} \
     [removeAttribute] on MDN}."]

  val remove_attribute_ns :
    namespace:string option -> local_name:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/removeAttributeNS} \
     [removeAttributeNS] on MDN}."]

  val toggle_attribute : qualified_name:string -> ?force:bool -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/toggleAttribute} \
     [toggleAttribute] on MDN}."]

  val has_attribute : qualified_name:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/hasAttribute} \
     [hasAttribute] on MDN}."]

  val has_attribute_ns :
    namespace:string option -> local_name:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/hasAttributeNS} \
     [hasAttributeNS] on MDN}."]

  val get_attribute_node : qualified_name:string -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttributeNode} \
     [getAttributeNode] on MDN}."]

  val get_attribute_node_ns :
    namespace:string option -> local_name:string -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttributeNodeNS} \
     [getAttributeNodeNS] on MDN}."]

  val set_attribute_node : attr:Attr.t -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttributeNode} \
     [setAttributeNode] on MDN}."]

  val set_attribute_node_ns : attr:Attr.t -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttributeNodeNS} \
     [setAttributeNodeNS] on MDN}."]

  val remove_attribute_node : attr:Attr.t -> t -> 'a Attr.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/removeAttributeNode} \
     [removeAttributeNode] on MDN}."]

  val attach_shadow : init:Shadow_root_init.t -> t -> 'a Shadow_root.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/attachShadow} \
     [attachShadow] on MDN}."]

  val shadow_root : t -> 'a Shadow_root.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/shadowRoot} \
     [shadowRoot] on MDN}."]

  val closest : selectors:string -> t -> 'a super option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/closest} \
     [closest] on MDN}."]

  val matches : selectors:string -> t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/matches} \
     [matches] on MDN}."]

  val webkit_matches_selector : selectors:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/webkitMatchesSelector} \
     [webkitMatchesSelector] on MDN}."]

  val get_elements_by_tag_name : qualified_name:string -> t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getElementsByTagName} \
     [getElementsByTagName] on MDN}."]

  val get_elements_by_tag_name_ns :
    namespace:string option -> local_name:string -> t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getElementsByTagNameNS} \
     [getElementsByTagNameNS] on MDN}."]

  val get_elements_by_class_name : class_names:string -> t -> Html_collection.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/getElementsByClassName} \
     [getElementsByClassName] on MDN}."]

  val insert_adjacent_element :
    where:string -> element:t -> t -> 'a super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentElement} \
     [insertAdjacentElement] on MDN}."]

  val insert_adjacent_text : where:string -> data:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentText} \
     [insertAdjacentText] on MDN}."]

  val assigned_slot : t -> Html_slot_element.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/assignedSlot} \
     [assignedSlot] on MDN}."]

  val next_element_sibling : t -> 'a super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/nextElementSibling} \
     [nextElementSibling] on MDN}."]

  val previous_element_sibling : t -> 'a super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/previousElementSibling} \
     [previousElementSibling] on MDN}."]

  val remove : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/remove} \
     [remove] on MDN}."]

  val replace_with :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element/replaceWith} \
     [replaceWith] on MDN}."]

  val after :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/after} \
     [after] on MDN}."]

  val before :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element/before} \
     [before] on MDN}."]
end = struct
  type t = [ `Element ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Element | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Element} [Element]} \
     interface or any base interface that it inherits."]

  let t = Js.raw "Element"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.magic this

  let namespace_uri this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "namespaceURI")

  let prefix this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "prefix")

  let local_name this = Js.Any.to_string (Js.get this "localName")
  let tag_name this = Js.Any.to_string (Js.get this "tagName")
  let id this = Js.Any.to_string (Js.get this "id")
  let set_id this x = Js.set this "id" (Js.Any.of_string x)
  let class_name this = Js.Any.to_string (Js.get this "className")
  let set_class_name this x = Js.set this "className" (Js.Any.of_string x)
  let class_list this = Dom_token_list.of_any (Js.get this "classList")
  let slot this = Js.Any.to_string (Js.get this "slot")
  let set_slot this x = Js.set this "slot" (Js.Any.of_string x)

  let has_attributes this =
    Js.Any.to_bool (Js.meth_call this "hasAttributes" [||])

  let attributes this = Named_node_map.of_any (Js.get this "attributes")

  let get_attribute_names this =
    (Js.Any.to_array Js.Any.to_string)
      (Js.meth_call this "getAttributeNames" [||])

  let get_attribute ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.meth_call this "getAttribute" [| qualified_name |])

  let get_attribute_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.meth_call this "getAttributeNS" [| namespace; local_name |])

  let set_attribute ~qualified_name ~value this =
    let qualified_name = Js.Any.of_string qualified_name in
    let value = Js.Any.of_string value in
    Js.to_unit (Js.meth_call this "setAttribute" [| qualified_name; value |])

  let set_attribute_ns ~namespace ~qualified_name ~value this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    let value = Js.Any.of_string value in
    Js.to_unit
      (Js.meth_call this "setAttributeNS" [| namespace; qualified_name; value |])

  let remove_attribute ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.to_unit (Js.meth_call this "removeAttribute" [| qualified_name |])

  let remove_attribute_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.to_unit
      (Js.meth_call this "removeAttributeNS" [| namespace; local_name |])

  let toggle_attribute ~qualified_name ?force this =
    let qualified_name = Js.Any.of_string qualified_name in
    let force = (Js.Any.undefined_of_option Js.Any.of_bool) force in
    Js.Any.to_bool
      (Js.meth_call this "toggleAttribute" [| qualified_name; force |])

  let has_attribute ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.Any.to_bool (Js.meth_call this "hasAttribute" [| qualified_name |])

  let has_attribute_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.Any.to_bool
      (Js.meth_call this "hasAttributeNS" [| namespace; local_name |])

  let get_attribute_node ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "getAttributeNode" [| qualified_name |])

  let get_attribute_node_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "getAttributeNodeNS" [| namespace; local_name |])

  let set_attribute_node ~attr this =
    let attr = Attr.to_any attr in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "setAttributeNode" [| attr |])

  let set_attribute_node_ns ~attr this =
    let attr = Attr.to_any attr in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "setAttributeNodeNS" [| attr |])

  let remove_attribute_node ~attr this =
    let attr = Attr.to_any attr in
    Attr.of_any (Js.meth_call this "removeAttributeNode" [| attr |])

  let attach_shadow ~init this =
    let init = Shadow_root_init.to_any init in
    Shadow_root.of_any (Js.meth_call this "attachShadow" [| init |])

  let shadow_root this =
    (Js.Any.nullable_to_option Shadow_root.of_any) (Js.get this "shadowRoot")

  let closest ~selectors this =
    let selectors = Js.Any.of_string selectors in
    (Js.Any.nullable_to_option of_any)
      (Js.meth_call this "closest" [| selectors |])

  let matches ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Js.Any.to_bool (Js.meth_call this "matches" [| selectors |])

  let webkit_matches_selector ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Js.Any.to_bool (Js.meth_call this "webkitMatchesSelector" [| selectors |])

  let get_elements_by_tag_name ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Html_collection.of_any
      (Js.meth_call this "getElementsByTagName" [| qualified_name |])

  let get_elements_by_tag_name_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Html_collection.of_any
      (Js.meth_call this "getElementsByTagNameNS" [| namespace; local_name |])

  let get_elements_by_class_name ~class_names this =
    let class_names = Js.Any.of_string class_names in
    Html_collection.of_any
      (Js.meth_call this "getElementsByClassName" [| class_names |])

  let insert_adjacent_element ~where ~element this =
    let where = Js.Any.of_string where in
    let element = to_any element in
    (Js.Any.nullable_to_option of_any)
      (Js.meth_call this "insertAdjacentElement" [| where; element |])

  let insert_adjacent_text ~where ~data this =
    let where = Js.Any.of_string where in
    let data = Js.Any.of_string data in
    Js.to_unit (Js.meth_call this "insertAdjacentText" [| where; data |])

  let assigned_slot this =
    (Js.Any.nullable_to_option Html_slot_element.of_any)
      (Js.get this "assignedSlot")

  let next_element_sibling this =
    (Js.Any.nullable_to_option of_any) (Js.get this "nextElementSibling")

  let previous_element_sibling this =
    (Js.Any.nullable_to_option of_any) (Js.get this "previousElementSibling")

  let remove this = Js.to_unit (Js.meth_call this "remove" [||])

  let replace_with ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "replaceWith" [| nodes |])

  let after ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "after" [| nodes |])

  let before ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "before" [| nodes |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Element} [Element] \
   on MDN}."]

and Shadow_root_init : sig
  type t [@@ocaml.doc "The type for the [ShadowRootInit] dictionary."]

  val make :
    mode:Shadow_root_mode.t ->
    ?delegates_focus:bool ->
    ?slot_assignment:Slot_assignment_mode.t ->
    ?clonable:bool ->
    ?serializable:bool ->
    unit ->
    t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val mode : t -> Shadow_root_mode.t
  val delegates_focus : t -> bool option
  val slot_assignment : t -> Slot_assignment_mode.t option
  val clonable : t -> bool option
  val serializable : t -> bool option
end = struct
  type t = Js.any

  let make ~mode ?delegates_focus ?slot_assignment ?clonable ?serializable () =
    let mode = Shadow_root_mode.to_any mode in
    let delegates_focus =
      (Js.Any.nullable_of_option Js.Any.of_bool) delegates_focus
    in
    let slot_assignment =
      (Js.Any.nullable_of_option Slot_assignment_mode.to_any) slot_assignment
    in
    let clonable = (Js.Any.nullable_of_option Js.Any.of_bool) clonable in
    let serializable =
      (Js.Any.nullable_of_option Js.Any.of_bool) serializable
    in
    Js.obj
      [|
        ("mode", mode);
        ("delegatesFocus", delegates_focus);
        ("slotAssignment", slot_assignment);
        ("clonable", clonable);
        ("serializable", serializable);
      |]

  let to_any = Js.to_any
  let of_any = Js.of_any
  let mode this = Shadow_root_mode.of_any (Js.get this "mode")

  let delegates_focus this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "delegatesFocus")

  let slot_assignment this =
    (Js.Any.nullable_to_option Slot_assignment_mode.of_any)
      (Js.get this "slotAssignment")

  let clonable this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "clonable")

  let serializable this =
    (Js.Any.nullable_to_option Js.Any.to_bool) (Js.get this "serializable")
end

and Named_node_map : sig
  type t = [ `Named_node_map ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap} \
     [NamedNodeMap]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/length} \
     [length] on MDN}."]

  val item : index:int -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/item} \
     [item] on MDN}."]

  val get_named_item : qualified_name:string -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/getNamedItem} \
     [getNamedItem] on MDN}."]

  val get_named_item_ns :
    namespace:string option -> local_name:string -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/getNamedItemNS} \
     [getNamedItemNS] on MDN}."]

  val set_named_item : attr:Attr.t -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/setNamedItem} \
     [setNamedItem] on MDN}."]

  val set_named_item_ns : attr:Attr.t -> t -> 'a Attr.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/setNamedItemNS} \
     [setNamedItemNS] on MDN}."]

  val remove_named_item : qualified_name:string -> t -> 'a Attr.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/removeNamedItem} \
     [removeNamedItem] on MDN}."]

  val remove_named_item_ns :
    namespace:string option -> local_name:string -> t -> 'a Attr.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap/removeNamedItemNS} \
     [removeNamedItemNS] on MDN}."]
end = struct
  type t = [ `Named_node_map ] Js.t

  let t = Js.raw "NamedNodeMap"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let length this = Js.Any.to_int (Js.get this "length")

  let item ~index this =
    let index = Js.Any.of_int index in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "item" [| index |])

  let get_named_item ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "getNamedItem" [| qualified_name |])

  let get_named_item_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "getNamedItemNS" [| namespace; local_name |])

  let set_named_item ~attr this =
    let attr = Attr.to_any attr in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "setNamedItem" [| attr |])

  let set_named_item_ns ~attr this =
    let attr = Attr.to_any attr in
    (Js.Any.nullable_to_option Attr.of_any)
      (Js.meth_call this "setNamedItemNS" [| attr |])

  let remove_named_item ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Attr.of_any (Js.meth_call this "removeNamedItem" [| qualified_name |])

  let remove_named_item_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Attr.of_any
      (Js.meth_call this "removeNamedItemNS" [| namespace; local_name |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/NamedNodeMap} \
   [NamedNodeMap] on MDN}."]

and Attr : sig
  type t = [ `Attr ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Attr} [Attr]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Attr | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Attr} [Attr]} interface \
     or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val namespace_uri : t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Attr/namespaceURI} \
     [namespaceURI] on MDN}."]

  val prefix : t -> string option
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr/prefix} \
     [prefix] on MDN}."]

  val local_name : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr/localName} \
     [localName] on MDN}."]

  val name : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr/name} \
     [name] on MDN}."]

  val value : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr/value} \
     [value] on MDN}."]

  val set_value : t -> string -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr/value} \
     [value] on MDN}."]

  val owner_element : t -> 'a Element.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Attr/ownerElement} \
     [ownerElement] on MDN}."]

  val specified : t -> bool
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr/specified} \
     [specified] on MDN}."]
end = struct
  type t = [ `Attr ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Attr | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Attr} [Attr]} interface \
     or any base interface that it inherits."]

  let t = Js.raw "Attr"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.magic this

  let namespace_uri this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "namespaceURI")

  let prefix this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.get this "prefix")

  let local_name this = Js.Any.to_string (Js.get this "localName")
  let name this = Js.Any.to_string (Js.get this "name")
  let value this = Js.Any.to_string (Js.get this "value")
  let set_value this x = Js.set this "value" (Js.Any.of_string x)

  let owner_element this =
    (Js.Any.nullable_to_option Element.of_any) (Js.get this "ownerElement")

  let specified this = Js.Any.to_bool (Js.get this "specified")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Attr} [Attr] on \
   MDN}."]

and Character_data : sig
  type t = [ `Character_data ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData} \
     [CharacterData]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData} \
     [CharacterData]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val data : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/data} \
     [data] on MDN}."]

  val set_data : t -> string -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/data} \
     [data] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/length} \
     [length] on MDN}."]

  val substring_data : offset:int -> count:int -> t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/substringData} \
     [substringData] on MDN}."]

  val append_data : data:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/appendData} \
     [appendData] on MDN}."]

  val insert_data : offset:int -> data:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/insertData} \
     [insertData] on MDN}."]

  val delete_data : offset:int -> count:int -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/deleteData} \
     [deleteData] on MDN}."]

  val replace_data : offset:int -> count:int -> data:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/replaceData} \
     [replaceData] on MDN}."]

  val remove : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/remove} \
     [remove] on MDN}."]

  val replace_with :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/replaceWith} \
     [replaceWith] on MDN}."]

  val after :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/after} \
     [after] on MDN}."]

  val before :
    nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData/before} \
     [before] on MDN}."]
end = struct
  type t = [ `Character_data ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CharacterData} \
     [CharacterData]} interface or any base interface that it inherits."]

  let t = Js.raw "CharacterData"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.magic this
  let data this = Js.Any.to_string (Js.get this "data")
  let set_data this x = Js.set this "data" (Js.Any.of_string x)
  let length this = Js.Any.to_int (Js.get this "length")

  let substring_data ~offset ~count this =
    let offset = Js.Any.of_int offset in
    let count = Js.Any.of_int count in
    Js.Any.to_string (Js.meth_call this "substringData" [| offset; count |])

  let append_data ~data this =
    let data = Js.Any.of_string data in
    Js.to_unit (Js.meth_call this "appendData" [| data |])

  let insert_data ~offset ~data this =
    let offset = Js.Any.of_int offset in
    let data = Js.Any.of_string data in
    Js.to_unit (Js.meth_call this "insertData" [| offset; data |])

  let delete_data ~offset ~count this =
    let offset = Js.Any.of_int offset in
    let count = Js.Any.of_int count in
    Js.to_unit (Js.meth_call this "deleteData" [| offset; count |])

  let replace_data ~offset ~count ~data this =
    let offset = Js.Any.of_int offset in
    let count = Js.Any.of_int count in
    let data = Js.Any.of_string data in
    Js.to_unit (Js.meth_call this "replaceData" [| offset; count; data |])

  let remove this = Js.to_unit (Js.meth_call this "remove" [||])

  let replace_with ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "replaceWith" [| nodes |])

  let after ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "after" [| nodes |])

  let before ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.meth_call this "before" [| nodes |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/CharacterData} \
   [CharacterData] on MDN}."]

and Text : sig
  type t = [ `Text ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Text} [Text]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Text | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Text} [Text]} interface \
     or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val make : ?data:string -> unit -> 'a super

  val split_text : offset:int -> t -> 'a super
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Text/splitText} \
     [splitText] on MDN}."]

  val whole_text : t -> string
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Text/wholeText} \
     [wholeText] on MDN}."]
end = struct
  type t = [ `Text ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Text | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Text} [Text]} interface \
     or any base interface that it inherits."]

  let t = Js.raw "Text"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_character_data this = Js.magic this

  let make ?data () =
    let data = (Js.Any.undefined_of_option Js.Any.of_string) data in
    Js.obj_new t [| data |]

  let split_text ~offset this =
    let offset = Js.Any.of_int offset in
    of_any (Js.meth_call this "splitText" [| offset |])

  let whole_text this = Js.Any.to_string (Js.get this "wholeText")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Text} [Text] on \
   MDN}."]

and Cdata_section : sig
  type t = [ `Cdata_section ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CDATASection} \
     [CDATASection]} interface."]

  type 'a super = 'a Js.t
    constraint
      'a =
      [< `Cdata_section | `Text | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CDATASection} \
     [CDATASection]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Cdata_section ] Js.t

  type 'a super = 'a Js.t
    constraint
      'a =
      [< `Cdata_section | `Text | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CDATASection} \
     [CDATASection]} interface or any base interface that it inherits."]

  let t = Js.raw "CDATASection"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_text this = Js.magic this
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/CDATASection} \
   [CDATASection] on MDN}."]

and Processing_instruction : sig
  type t = [ `Processing_instruction ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction} \
     [ProcessingInstruction]} interface."]

  type 'a super = 'a Js.t
    constraint
      'a =
      [< `Processing_instruction | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction} \
     [ProcessingInstruction]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val target : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction/target} \
     [target] on MDN}."]
end = struct
  type t = [ `Processing_instruction ] Js.t

  type 'a super = 'a Js.t
    constraint
      'a =
      [< `Processing_instruction | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction} \
     [ProcessingInstruction]} interface or any base interface that it \
     inherits."]

  let t = Js.raw "ProcessingInstruction"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_character_data this = Js.magic this
  let target this = Js.Any.to_string (Js.get this "target")
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ProcessingInstruction} \
   [ProcessingInstruction] on MDN}."]

and Comment : sig
  type t = [ `Comment ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Comment} [Comment]} \
     interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Comment | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Comment} [Comment]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val make : ?data:string -> unit -> 'a super
end = struct
  type t = [ `Comment ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Comment | `Character_data | `Node | `Event_target ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Comment} [Comment]} \
     interface or any base interface that it inherits."]

  let t = Js.raw "Comment"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_character_data this = Js.magic this

  let make ?data () =
    let data = (Js.Any.undefined_of_option Js.Any.of_string) data in
    Js.obj_new t [| data |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Comment} [Comment] \
   on MDN}."]

and Abstract_range : sig
  type t = [ `Abstract_range ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange} \
     [AbstractRange]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val start_container : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange/startContainer} \
     [startContainer] on MDN}."]

  val start_offset : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange/startOffset} \
     [startOffset] on MDN}."]

  val end_container : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange/endContainer} \
     [endContainer] on MDN}."]

  val end_offset : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange/endOffset} \
     [endOffset] on MDN}."]

  val collapsed : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange/collapsed} \
     [collapsed] on MDN}."]
end = struct
  type t = [ `Abstract_range ] Js.t

  let t = Js.raw "AbstractRange"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let start_container this = Node.of_any (Js.get this "startContainer")
  let start_offset this = Js.Any.to_int (Js.get this "startOffset")
  let end_container this = Node.of_any (Js.get this "endContainer")
  let end_offset this = Js.Any.to_int (Js.get this "endOffset")
  let collapsed this = Js.Any.to_bool (Js.get this "collapsed")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/AbstractRange} \
   [AbstractRange] on MDN}."]

and Static_range_init : sig
  type t [@@ocaml.doc "The type for the [StaticRangeInit] dictionary."]

  val make :
    start_container:Node.t ->
    start_offset:int ->
    end_container:Node.t ->
    end_offset:int ->
    unit ->
    t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val start_container : t -> Node.t
  val start_offset : t -> int
  val end_container : t -> Node.t
  val end_offset : t -> int
end = struct
  type t = Js.any

  let make ~start_container ~start_offset ~end_container ~end_offset () =
    let start_container = Node.to_any start_container in
    let start_offset = Js.Any.of_int start_offset in
    let end_container = Node.to_any end_container in
    let end_offset = Js.Any.of_int end_offset in
    Js.obj
      [|
        ("startContainer", start_container);
        ("startOffset", start_offset);
        ("endContainer", end_container);
        ("endOffset", end_offset);
      |]

  let to_any = Js.to_any
  let of_any = Js.of_any
  let start_container this = Node.of_any (Js.get this "startContainer")
  let start_offset this = Js.Any.to_int (Js.get this "startOffset")
  let end_container this = Node.of_any (Js.get this "endContainer")
  let end_offset this = Js.Any.to_int (Js.get this "endOffset")
end

and Static_range : sig
  type t = [ `Static_range ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticRange} \
     [StaticRange]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Static_range | `Abstract_range ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticRange} \
     [StaticRange]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val make : init:Static_range_init.t -> unit -> 'a super
end = struct
  type t = [ `Static_range ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Static_range | `Abstract_range ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticRange} \
     [StaticRange]} interface or any base interface that it inherits."]

  let t = Js.raw "StaticRange"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_abstract_range this = Js.magic this

  let make ~init () =
    let init = Static_range_init.to_any init in
    Js.obj_new t [| init |]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/StaticRange} \
   [StaticRange] on MDN}."]

and Range : sig
  type t = [ `Range ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range} [Range]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Range | `Abstract_range ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range} [Range]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
  val make : unit -> 'a super

  val common_ancestor_container : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/commonAncestorContainer} \
     [commonAncestorContainer] on MDN}."]

  val set_start : node:Node.t -> offset:int -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Range/setStart} \
     [setStart] on MDN}."]

  val set_end : node:Node.t -> offset:int -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Range/setEnd} \
     [setEnd] on MDN}."]

  val set_start_before : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/setStartBefore} \
     [setStartBefore] on MDN}."]

  val set_start_after : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/setStartAfter} \
     [setStartAfter] on MDN}."]

  val set_end_before : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/setEndBefore} \
     [setEndBefore] on MDN}."]

  val set_end_after : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/setEndAfter} \
     [setEndAfter] on MDN}."]

  val collapse : ?to_start:bool -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Range/collapse} \
     [collapse] on MDN}."]

  val select_node : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/selectNode} \
     [selectNode] on MDN}."]

  val select_node_contents : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/selectNodeContents} \
     [selectNodeContents] on MDN}."]

  val start_to_start : int
  val start_to_end : int
  val end_to_end : int
  val end_to_start : int

  val compare_boundary_points : how:int -> source_range:t -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/compareBoundaryPoints} \
     [compareBoundaryPoints] on MDN}."]

  val delete_contents : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/deleteContents} \
     [deleteContents] on MDN}."]

  val extract_contents : t -> 'a Document_fragment.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/extractContents} \
     [extractContents] on MDN}."]

  val clone_contents : t -> 'a Document_fragment.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/cloneContents} \
     [cloneContents] on MDN}."]

  val insert_node : node:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/insertNode} \
     [insertNode] on MDN}."]

  val surround_contents : new_parent:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/surroundContents} \
     [surroundContents] on MDN}."]

  val clone_range : t -> 'a super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/cloneRange} \
     [cloneRange] on MDN}."]

  val detach : t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Range/detach} \
     [detach] on MDN}."]

  val is_point_in_range : node:Node.t -> offset:int -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/isPointInRange} \
     [isPointInRange] on MDN}."]

  val compare_point : node:Node.t -> offset:int -> t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/comparePoint} \
     [comparePoint] on MDN}."]

  val intersects_node : node:Node.t -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range/intersectsNode} \
     [intersectsNode] on MDN}."]
end = struct
  type t = [ `Range ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Range | `Abstract_range ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Range} [Range]} \
     interface or any base interface that it inherits."]

  let t = Js.raw "Range"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_abstract_range this = Js.magic this
  let make () = Js.obj_new t [||]

  let common_ancestor_container this =
    Node.of_any (Js.get this "commonAncestorContainer")

  let set_start ~node ~offset this =
    let node = Node.to_any node in
    let offset = Js.Any.of_int offset in
    Js.to_unit (Js.meth_call this "setStart" [| node; offset |])

  let set_end ~node ~offset this =
    let node = Node.to_any node in
    let offset = Js.Any.of_int offset in
    Js.to_unit (Js.meth_call this "setEnd" [| node; offset |])

  let set_start_before ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "setStartBefore" [| node |])

  let set_start_after ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "setStartAfter" [| node |])

  let set_end_before ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "setEndBefore" [| node |])

  let set_end_after ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "setEndAfter" [| node |])

  let collapse ?to_start this =
    let to_start = (Js.Any.undefined_of_option Js.Any.of_bool) to_start in
    Js.to_unit (Js.meth_call this "collapse" [| to_start |])

  let select_node ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "selectNode" [| node |])

  let select_node_contents ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "selectNodeContents" [| node |])

  let start_to_start = 0
  let start_to_end = 1
  let end_to_end = 2
  let end_to_start = 3

  let compare_boundary_points ~how ~source_range this =
    let how = Js.Any.of_int how in
    let source_range = to_any source_range in
    Js.Any.to_int
      (Js.meth_call this "compareBoundaryPoints" [| how; source_range |])

  let delete_contents this = Js.to_unit (Js.meth_call this "deleteContents" [||])

  let extract_contents this =
    Document_fragment.of_any (Js.meth_call this "extractContents" [||])

  let clone_contents this =
    Document_fragment.of_any (Js.meth_call this "cloneContents" [||])

  let insert_node ~node this =
    let node = Node.to_any node in
    Js.to_unit (Js.meth_call this "insertNode" [| node |])

  let surround_contents ~new_parent this =
    let new_parent = Node.to_any new_parent in
    Js.to_unit (Js.meth_call this "surroundContents" [| new_parent |])

  let clone_range this = of_any (Js.meth_call this "cloneRange" [||])
  let detach this = Js.to_unit (Js.meth_call this "detach" [||])

  let is_point_in_range ~node ~offset this =
    let node = Node.to_any node in
    let offset = Js.Any.of_int offset in
    Js.Any.to_bool (Js.meth_call this "isPointInRange" [| node; offset |])

  let compare_point ~node ~offset this =
    let node = Node.to_any node in
    let offset = Js.Any.of_int offset in
    Js.Any.to_int (Js.meth_call this "comparePoint" [| node; offset |])

  let intersects_node ~node this =
    let node = Node.to_any node in
    Js.Any.to_bool (Js.meth_call this "intersectsNode" [| node |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Range} [Range] on \
   MDN}."]

and Node_iterator : sig
  type t = [ `Node_iterator ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator} \
     [NodeIterator]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val root : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/root} \
     [root] on MDN}."]

  val reference_node : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/referenceNode} \
     [referenceNode] on MDN}."]

  val pointer_before_reference_node : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/pointerBeforeReferenceNode} \
     [pointerBeforeReferenceNode] on MDN}."]

  val what_to_show : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/whatToShow} \
     [whatToShow] on MDN}."]

  val filter : t -> Node_filter.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/filter} \
     [filter] on MDN}."]

  val next_node : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/nextNode} \
     [nextNode] on MDN}."]

  val previous_node : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/previousNode} \
     [previousNode] on MDN}."]

  val detach : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator/detach} \
     [detach] on MDN}."]
end = struct
  type t = [ `Node_iterator ] Js.t

  let t = Js.raw "NodeIterator"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let root this = Node.of_any (Js.get this "root")
  let reference_node this = Node.of_any (Js.get this "referenceNode")

  let pointer_before_reference_node this =
    Js.Any.to_bool (Js.get this "pointerBeforeReferenceNode")

  let what_to_show this = Js.Any.to_int (Js.get this "whatToShow")

  let filter this =
    (Js.Any.nullable_to_option Node_filter.of_any) (Js.get this "filter")

  let next_node this =
    (Js.Any.nullable_to_option Node.of_any) (Js.meth_call this "nextNode" [||])

  let previous_node this =
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "previousNode" [||])

  let detach this = Js.to_unit (Js.meth_call this "detach" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/NodeIterator} \
   [NodeIterator] on MDN}."]

and Tree_walker : sig
  type t = [ `Tree_walker ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker} \
     [TreeWalker]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val root : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/root} \
     [root] on MDN}."]

  val what_to_show : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/whatToShow} \
     [whatToShow] on MDN}."]

  val filter : t -> Node_filter.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/filter} \
     [filter] on MDN}."]

  val current_node : t -> 'a Node.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/currentNode} \
     [currentNode] on MDN}."]

  val set_current_node : t -> Node.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/currentNode} \
     [currentNode] on MDN}."]

  val parent_node : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/parentNode} \
     [parentNode] on MDN}."]

  val first_child : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/firstChild} \
     [firstChild] on MDN}."]

  val last_child : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/lastChild} \
     [lastChild] on MDN}."]

  val previous_sibling : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/previousSibling} \
     [previousSibling] on MDN}."]

  val next_sibling : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/nextSibling} \
     [nextSibling] on MDN}."]

  val previous_node : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/previousNode} \
     [previousNode] on MDN}."]

  val next_node : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker/nextNode} \
     [nextNode] on MDN}."]
end = struct
  type t = [ `Tree_walker ] Js.t

  let t = Js.raw "TreeWalker"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let root this = Node.of_any (Js.get this "root")
  let what_to_show this = Js.Any.to_int (Js.get this "whatToShow")

  let filter this =
    (Js.Any.nullable_to_option Node_filter.of_any) (Js.get this "filter")

  let current_node this = Node.of_any (Js.get this "currentNode")
  let set_current_node this x = Js.set this "currentNode" (Node.to_any x)

  let parent_node this =
    (Js.Any.nullable_to_option Node.of_any) (Js.meth_call this "parentNode" [||])

  let first_child this =
    (Js.Any.nullable_to_option Node.of_any) (Js.meth_call this "firstChild" [||])

  let last_child this =
    (Js.Any.nullable_to_option Node.of_any) (Js.meth_call this "lastChild" [||])

  let previous_sibling this =
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "previousSibling" [||])

  let next_sibling this =
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "nextSibling" [||])

  let previous_node this =
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "previousNode" [||])

  let next_node this =
    (Js.Any.nullable_to_option Node.of_any) (Js.meth_call this "nextNode" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TreeWalker} \
   [TreeWalker] on MDN}."]

and Node_filter : sig
  type t = Node.t -> int

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val show_notation : int
  val show_document_fragment : int
  val show_document_type : int
  val show_document : int
  val show_comment : int
  val show_processing_instruction : int
  val show_entity : int
  val show_entity_reference : int
  val show_cdata_section : int
  val show_text : int
  val show_attribute : int
  val show_element : int
  val show_all : int
  val filter_skip : int
  val filter_reject : int
  val filter_accept : int
end = struct
  type t = Node.t -> int

  let to_any this = Js.Any.of_fun 1 this

  let of_any any =
    let __f_js = Js.magic any in
    fun node ->
      let node = Node.to_any node in
      Js.Any.to_int (Js.fun_call __f_js [| node |])

  let show_notation = 2048
  let show_document_fragment = 1024
  let show_document_type = 512
  let show_document = 256
  let show_comment = 128
  let show_processing_instruction = 64
  let show_entity = 32
  let show_entity_reference = 16
  let show_cdata_section = 8
  let show_text = 4
  let show_attribute = 2
  let show_element = 1
  let show_all = 4294967295
  let filter_skip = 3
  let filter_reject = 2
  let filter_accept = 1
end

and Dom_token_list : sig
  type t = [ `Dom_token_list ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList} \
     [DOMTokenList]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/length} \
     [length] on MDN}."]

  val item : index:int -> t -> string option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/item} \
     [item] on MDN}."]

  val contains : token:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/contains} \
     [contains] on MDN}."]

  val add : tokens:string array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/add} [add] \
     on MDN}."]

  val remove : tokens:string array -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/remove} \
     [remove] on MDN}."]

  val toggle : token:string -> ?force:bool -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/toggle} \
     [toggle] on MDN}."]

  val replace : token:string -> new_token:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/replace} \
     [replace] on MDN}."]

  val supports : token:string -> t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/supports} \
     [supports] on MDN}."]

  val to_string : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/to_string} \
     [to_string] on MDN}."]

  val value : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/value} \
     [value] on MDN}."]

  val set_value : t -> string -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/value} \
     [value] on MDN}."]
end = struct
  type t = [ `Dom_token_list ] Js.t

  let t = Js.raw "DOMTokenList"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let length this = Js.Any.to_int (Js.get this "length")

  let item ~index this =
    let index = Js.Any.of_int index in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.meth_call this "item" [| index |])

  let contains ~token this =
    let token = Js.Any.of_string token in
    Js.Any.to_bool (Js.meth_call this "contains" [| token |])

  let add ~tokens this =
    let tokens = (Js.Any.of_array Js.Any.of_string) tokens in
    Js.to_unit (Js.meth_call this "add" [| tokens |])

  let remove ~tokens this =
    let tokens = (Js.Any.of_array Js.Any.of_string) tokens in
    Js.to_unit (Js.meth_call this "remove" [| tokens |])

  let toggle ~token ?force this =
    let token = Js.Any.of_string token in
    let force = (Js.Any.undefined_of_option Js.Any.of_bool) force in
    Js.Any.to_bool (Js.meth_call this "toggle" [| token; force |])

  let replace ~token ~new_token this =
    let token = Js.Any.of_string token in
    let new_token = Js.Any.of_string new_token in
    Js.Any.to_bool (Js.meth_call this "replace" [| token; new_token |])

  let supports ~token this =
    let token = Js.Any.of_string token in
    Js.Any.to_bool (Js.meth_call this "supports" [| token |])

  let value this = Js.Any.to_string (Js.get this "value")
  let set_value this x = Js.set this "value" (Js.Any.of_string x)
  let to_string = value
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList} \
   [DOMTokenList] on MDN}."]

and X_path_result : sig
  type t = [ `X_path_result ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult} \
     [XPathResult]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val any_type : int
  val number_type : int
  val string_type : int
  val boolean_type : int
  val unordered_node_iterator_type : int
  val ordered_node_iterator_type : int
  val unordered_node_snapshot_type : int
  val ordered_node_snapshot_type : int
  val any_unordered_node_type : int
  val first_ordered_node_type : int

  val result_type : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/resultType} \
     [resultType] on MDN}."]

  val number_value : t -> float
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/numberValue} \
     [numberValue] on MDN}."]

  val string_value : t -> string
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/stringValue} \
     [stringValue] on MDN}."]

  val boolean_value : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/booleanValue} \
     [booleanValue] on MDN}."]

  val single_node_value : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/singleNodeValue} \
     [singleNodeValue] on MDN}."]

  val invalid_iterator_state : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/invalidIteratorState} \
     [invalidIteratorState] on MDN}."]

  val snapshot_length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/snapshotLength} \
     [snapshotLength] on MDN}."]

  val iterate_next : t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/iterateNext} \
     [iterateNext] on MDN}."]

  val snapshot_item : index:int -> t -> 'a Node.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathResult/snapshotItem} \
     [snapshotItem] on MDN}."]
end = struct
  type t = [ `X_path_result ] Js.t

  let t = Js.raw "XPathResult"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let any_type = 0
  let number_type = 1
  let string_type = 2
  let boolean_type = 3
  let unordered_node_iterator_type = 4
  let ordered_node_iterator_type = 5
  let unordered_node_snapshot_type = 6
  let ordered_node_snapshot_type = 7
  let any_unordered_node_type = 8
  let first_ordered_node_type = 9
  let result_type this = Js.Any.to_int (Js.get this "resultType")
  let number_value this = Js.Any.to_float (Js.get this "numberValue")
  let string_value this = Js.Any.to_string (Js.get this "stringValue")
  let boolean_value this = Js.Any.to_bool (Js.get this "booleanValue")

  let single_node_value this =
    (Js.Any.nullable_to_option Node.of_any) (Js.get this "singleNodeValue")

  let invalid_iterator_state this =
    Js.Any.to_bool (Js.get this "invalidIteratorState")

  let snapshot_length this = Js.Any.to_int (Js.get this "snapshotLength")

  let iterate_next this =
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "iterateNext" [||])

  let snapshot_item ~index this =
    let index = Js.Any.of_int index in
    (Js.Any.nullable_to_option Node.of_any)
      (Js.meth_call this "snapshotItem" [| index |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/XPathResult} \
   [XPathResult] on MDN}."]

and X_path_expression : sig
  type t = [ `X_path_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathExpression} \
     [XPathExpression]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val evaluate :
    context_node:Node.t ->
    ?type':int ->
    ?result:X_path_result.t option ->
    t ->
    X_path_result.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathExpression/evaluate} \
     [evaluate] on MDN}."]
end = struct
  type t = [ `X_path_expression ] Js.t

  let t = Js.raw "XPathExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let evaluate ~context_node ?type' ?result this =
    let context_node = Node.to_any context_node in
    let type' = (Js.Any.undefined_of_option Js.Any.of_int) type' in
    let result =
      (Js.Any.undefined_of_option
         (Js.Any.nullable_of_option X_path_result.to_any)
      )
        result
    in
    X_path_result.of_any
      (Js.meth_call this "evaluate" [| context_node; type'; result |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/XPathExpression} \
   [XPathExpression] on MDN}."]

and X_path_ns_resolver : sig
  type t = string option -> string option

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = string option -> string option

  let to_any this = Js.Any.of_fun 1 this

  let of_any any =
    let __f_js = Js.magic any in
    fun prefix ->
      let prefix = (Js.Any.nullable_of_option Js.Any.of_string) prefix in
      (Js.Any.nullable_to_option Js.Any.to_string)
        (Js.fun_call __f_js [| prefix |])
end

and X_path_evaluator : sig
  type t = [ `X_path_evaluator ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XPathEvaluator} \
     [XPathEvaluator]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t
end = struct
  type t = [ `X_path_evaluator ] Js.t

  let t = Js.raw "XPathEvaluator"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/XPathEvaluator} \
   [XPathEvaluator] on MDN}."]

and Xslt_processor : sig
  type t = [ `Xslt_processor ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor} \
     [XSLTProcessor]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any
  val make : unit -> t

  val import_stylesheet : style:Node.t -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/importStylesheet} \
     [importStylesheet] on MDN}."]

  val transform_to_fragment :
    source:Node.t -> output:Document.t -> t -> 'a Document_fragment.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/transformToFragment} \
     [transformToFragment] on MDN}."]

  val transform_to_document : source:Node.t -> t -> 'a Document.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/transformToDocument} \
     [transformToDocument] on MDN}."]

  val set_parameter :
    namespace_uri:string -> local_name:string -> value:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/setParameter} \
     [setParameter] on MDN}."]

  val get_parameter : namespace_uri:string -> local_name:string -> t -> Js.any
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/getParameter} \
     [getParameter] on MDN}."]

  val remove_parameter : namespace_uri:string -> local_name:string -> t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/removeParameter} \
     [removeParameter] on MDN}."]

  val clear_parameters : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/clearParameters} \
     [clearParameters] on MDN}."]

  val reset : t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/reset} \
     [reset] on MDN}."]
end = struct
  type t = [ `Xslt_processor ] Js.t

  let t = Js.raw "XSLTProcessor"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let make () = Js.obj_new t [||]

  let import_stylesheet ~style this =
    let style = Node.to_any style in
    Js.to_unit (Js.meth_call this "importStylesheet" [| style |])

  let transform_to_fragment ~source ~output this =
    let source = Node.to_any source in
    let output = Document.to_any output in
    Document_fragment.of_any
      (Js.meth_call this "transformToFragment" [| source; output |])

  let transform_to_document ~source this =
    let source = Node.to_any source in
    Document.of_any (Js.meth_call this "transformToDocument" [| source |])

  let set_parameter ~namespace_uri ~local_name ~value this =
    let namespace_uri = Js.Any.of_string namespace_uri in
    let local_name = Js.Any.of_string local_name in
    let value = Js.of_any value in
    Js.to_unit
      (Js.meth_call this "setParameter" [| namespace_uri; local_name; value |])

  let get_parameter ~namespace_uri ~local_name this =
    let namespace_uri = Js.Any.of_string namespace_uri in
    let local_name = Js.Any.of_string local_name in
    Js.to_any (Js.meth_call this "getParameter" [| namespace_uri; local_name |])

  let remove_parameter ~namespace_uri ~local_name this =
    let namespace_uri = Js.Any.of_string namespace_uri in
    let local_name = Js.Any.of_string local_name in
    Js.to_unit
      (Js.meth_call this "removeParameter" [| namespace_uri; local_name |])

  let clear_parameters this =
    Js.to_unit (Js.meth_call this "clearParameters" [||])

  let reset this = Js.to_unit (Js.meth_call this "reset" [||])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor} \
   [XSLTProcessor] on MDN}."]
