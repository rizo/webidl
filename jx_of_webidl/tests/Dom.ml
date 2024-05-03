module rec Event : sig
  type t = [ `Event ] Js.t

  val t : [ `Event ] Js.constr
  val to_object : t -> [ `Obj ] Js.t

  val with_type_and_event_init_dict :
    type_:string -> ?event_init_dict:[ `Event_init ] Js.t -> unit -> t

  val type_ : t -> string
  val target : t -> [ `Event_target ] Js.t option
  val src_element : t -> [ `Event_target ] Js.t option
  val current_target : t -> [ `Event_target ] Js.t option
  val composed_path : t -> [ `Event_target ] Js.t array
  val none : int
  val capturing_phase : int
  val at_target : int
  val bubbling_phase : int
  val event_phase : t -> int
  val stop_propagation : t -> unit
  val cancel_bubble : t -> bool
  val set_cancel_bubble : t -> bool -> unit
  val stop_immediate_propagation : t -> unit
  val bubbles : t -> bool
  val cancelable : t -> bool
  val return_value : t -> bool
  val set_return_value : t -> bool -> unit
  val prevent_default : t -> unit
  val default_prevented : t -> bool
  val composed : t -> bool
  val is_trusted : t -> bool
  val time_stamp : t -> [ `Dom_high_res_time_stamp ] Js.t

  val init_event :
    type_:string -> ?bubbles:bool -> ?cancelable:bool -> t -> unit
end = struct
  type t = [ `Event ] Js.t

  let t = Js.Ffi.constr "Event"
  let to_object this = Js.Ffi.magic this

  let with_type_and_event_init_dict ~type_ ?event_init_dict () =
    let type_ = Js.Any.of_string type_ in
    let event_init_dict =
      (Js.Any.undefined_of_option Js.to_any) event_init_dict
    in
    Js.Ffi.obj_new t [| type_; event_init_dict |]

  let type_ this = Js.Any.to_string (Js.Ffi.get this "type")

  let target this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "target")

  let src_element this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "srcElement")

  let current_target this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "currentTarget")

  let composed_path this =
    (Js.Any.to_array Js.of_any) (Js.Ffi.meth_call this "composedPath" [||])

  let none = 0
  let capturing_phase = 1
  let at_target = 2
  let bubbling_phase = 3
  let event_phase this = Js.Any.to_int (Js.Ffi.get this "eventPhase")

  let stop_propagation this =
    Js.to_unit (Js.Ffi.meth_call this "stopPropagation" [||])

  let cancel_bubble this = Js.Any.to_bool (Js.Ffi.get this "cancelBubble")

  let set_cancel_bubble this x =
    Js.Ffi.set this "cancelBubble" (Js.Any.of_bool x)

  let stop_immediate_propagation this =
    Js.to_unit (Js.Ffi.meth_call this "stopImmediatePropagation" [||])

  let bubbles this = Js.Any.to_bool (Js.Ffi.get this "bubbles")
  let cancelable this = Js.Any.to_bool (Js.Ffi.get this "cancelable")
  let return_value this = Js.Any.to_bool (Js.Ffi.get this "returnValue")
  let set_return_value this x = Js.Ffi.set this "returnValue" (Js.Any.of_bool x)

  let prevent_default this =
    Js.to_unit (Js.Ffi.meth_call this "preventDefault" [||])

  let default_prevented this =
    Js.Any.to_bool (Js.Ffi.get this "defaultPrevented")

  let composed this = Js.Any.to_bool (Js.Ffi.get this "composed")
  let is_trusted this = Js.Any.to_bool (Js.Ffi.get this "isTrusted")
  let time_stamp this = Js.of_any (Js.Ffi.get this "timeStamp")

  let init_event ~type_ ?bubbles ?cancelable this =
    let type_ = Js.Any.of_string type_ in
    let bubbles = (Js.Any.undefined_of_option Js.Any.of_bool) bubbles in
    let cancelable = (Js.Any.undefined_of_option Js.Any.of_bool) cancelable in
    Js.to_unit
      (Js.Ffi.meth_call this "initEvent" [| type_; bubbles; cancelable |])
end

and Event_init : sig
  type t

  val make : ?bubbles:bool -> ?cancelable:bool -> ?composed:bool -> unit -> t
  val bubbles : t -> bool option
  val cancelable : t -> bool option
  val composed : t -> bool option
end = struct end

and Custom_event : sig
  type t = [ `Custom_event ] Js.t

  val t : [ `Custom_event ] Js.constr
  val to_event : t -> [ `Event ] Js.t

  val with_type_and_event_init_dict :
    type_:string -> ?event_init_dict:[ `Custom_event_init ] Js.t -> unit -> t

  val detail : t -> Js.any

  val init_custom_event :
    type_:string ->
    ?bubbles:bool ->
    ?cancelable:bool ->
    ?detail:Js.any ->
    t ->
    unit
end = struct
  type t = [ `Custom_event ] Js.t

  let t = Js.Ffi.constr "CustomEvent"
  let to_event this = Js.Ffi.magic this

  let with_type_and_event_init_dict ~type_ ?event_init_dict () =
    let type_ = Js.Any.of_string type_ in
    let event_init_dict =
      (Js.Any.undefined_of_option Js.to_any) event_init_dict
    in
    Js.Ffi.obj_new t [| type_; event_init_dict |]

  let detail this = Js.to_any (Js.Ffi.get this "detail")

  let init_custom_event ~type_ ?bubbles ?cancelable ?detail this =
    let type_ = Js.Any.of_string type_ in
    let bubbles = (Js.Any.undefined_of_option Js.Any.of_bool) bubbles in
    let cancelable = (Js.Any.undefined_of_option Js.Any.of_bool) cancelable in
    let detail = (Js.Any.undefined_of_option Js.of_any) detail in
    Js.to_unit
      (Js.Ffi.meth_call this "initCustomEvent"
         [| type_; bubbles; cancelable; detail |]
      )
end

and Custom_event_init : sig
  type t

  val make : ?detail:Js.any -> unit -> t
  val to_event_init : t -> Event_init.t
  val detail : t -> Js.any option
end = struct end

and Event_target : sig
  type t = [ `Event_target ] Js.t

  val t : [ `Event_target ] Js.constr
  val make : unit -> t

  val add_event_listener :
    type_:string ->
    callback:[ `Event_listener ] Js.t option ->
    ?options:[ `Add_event_listener_options | `Bool ] Js.t ->
    t ->
    unit

  val remove_event_listener :
    type_:string ->
    callback:[ `Event_listener ] Js.t option ->
    ?options:[ `Event_listener_options | `Bool ] Js.t ->
    t ->
    unit

  val dispatch_event : event:[ `Event ] Js.t -> t -> bool
end = struct
  type t = [ `Event_target ] Js.t

  let t = Js.Ffi.constr "EventTarget"
  let make () = Js.Ffi.obj_new t [||]

  let add_event_listener ~type_ ~callback ?options this =
    let type_ = Js.Any.of_string type_ in
    let callback = (Js.Any.nullable_of_option Js.to_any) callback in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.to_unit
      (Js.Ffi.meth_call this "addEventListener" [| type_; callback; options |])

  let remove_event_listener ~type_ ~callback ?options this =
    let type_ = Js.Any.of_string type_ in
    let callback = (Js.Any.nullable_of_option Js.to_any) callback in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.to_unit
      (Js.Ffi.meth_call this "removeEventListener"
         [| type_; callback; options |]
      )

  let dispatch_event ~event this =
    let event = Js.to_any event in
    Js.Any.to_bool (Js.Ffi.meth_call this "dispatchEvent" [| event |])
end

and Event_listener : sig
  type t = event:[ `Event ] Js.t -> unit
end = struct end

and Event_listener_options : sig
  type t

  val make : ?capture:bool -> unit -> t
  val capture : t -> bool option
end = struct end

and Add_event_listener_options : sig
  type t

  val make :
    ?passive:bool -> ?once:bool -> ?signal:[ `Abort_signal ] Js.t -> unit -> t

  val to_event_listener_options : t -> Event_listener_options.t
  val passive : t -> bool option
  val once : t -> bool option
  val signal : t -> [ `Abort_signal ] Js.t option
end = struct end

and Abort_controller : sig
  type t = [ `Abort_controller ] Js.t

  val t : [ `Abort_controller ] Js.constr
  val make : unit -> t
  val signal : t -> [ `Abort_signal ] Js.t
  val abort : ?reason:Js.any -> t -> unit
end = struct
  type t = [ `Abort_controller ] Js.t

  let t = Js.Ffi.constr "AbortController"
  let make () = Js.Ffi.obj_new t [||]
  let signal this = Js.of_any (Js.Ffi.get this "signal")

  let abort ?reason this =
    let reason = (Js.Any.undefined_of_option Js.of_any) reason in
    Js.to_unit (Js.Ffi.meth_call this "abort" [| reason |])
end

and Abort_signal : sig
  type t = [ `Abort_signal ] Js.t

  val t : [ `Abort_signal ] Js.constr
  val to_event_target : t -> [ `Event_target ] Js.t
  val abort : ?reason:Js.any -> unit -> [ `Abort_signal ] Js.t
  val timeout : milliseconds:int -> unit -> [ `Abort_signal ] Js.t

  val _any :
    signals:[ `Abort_signal ] Js.t array -> unit -> [ `Abort_signal ] Js.t

  val aborted : t -> bool
  val reason : t -> Js.any
  val throw_if_aborted : t -> unit
  val onabort : t -> [ `Event_handler ] Js.t
  val set_onabort : t -> [ `Event_handler ] Js.t -> unit
end = struct
  type t = [ `Abort_signal ] Js.t

  let t = Js.Ffi.constr "AbortSignal"
  let to_event_target this = Js.Ffi.magic this

  let abort ?reason () =
    let reason = (Js.Any.undefined_of_option Js.of_any) reason in
    Js.of_any (Js.Ffi.meth_call t "abort" [| reason |])

  let timeout ~milliseconds () =
    let milliseconds = Js.Any.of_int milliseconds in
    Js.of_any (Js.Ffi.meth_call t "timeout" [| milliseconds |])

  let _any ~signals () =
    let signals = (Js.Any.of_array Js.to_any) signals in
    Js.of_any (Js.Ffi.meth_call t "_any" [| signals |])

  let aborted this = Js.Any.to_bool (Js.Ffi.get this "aborted")
  let reason this = Js.to_any (Js.Ffi.get this "reason")

  let throw_if_aborted this =
    Js.to_unit (Js.Ffi.meth_call this "throwIfAborted" [||])

  let onabort this = Js.of_any (Js.Ffi.get this "onabort")
  let set_onabort this x = Js.Ffi.set this "onabort" (Js.to_any x)
end

and Node_list : sig
  type t = [ `Node_list ] Js.t

  val t : [ `Node_list ] Js.constr
  val get_item : t -> index:int -> [ `Node ] Js.t option
  val length : t -> int
  val to_iterable : t -> [ `Node ] Js.t Seq.t
end = struct
  type t = [ `Node_list ] Js.t

  let t = Js.Ffi.constr "NodeList"
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
end

and Html_collection : sig
  type t = [ `Html_collection ] Js.t

  val t : [ `Html_collection ] Js.constr
  val length : t -> int
  val get_item : t -> index:int -> [ `Element ] Js.t option
  val get_named_item : t -> name:string -> [ `Element ] Js.t option
end = struct
  type t = [ `Html_collection ] Js.t

  let t = Js.Ffi.constr "HTMLCollection"
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
end

and Mutation_observer : sig
  type t = [ `Mutation_observer ] Js.t

  val t : [ `Mutation_observer ] Js.constr
  val make : callback:[ `Mutation_callback ] Js.t -> unit -> t

  val observe :
    target:[ `Node ] Js.t ->
    ?options:[ `Mutation_observer_init ] Js.t ->
    t ->
    unit

  val disconnect : t -> unit
  val take_records : t -> [ `Mutation_record ] Js.t array
end = struct
  type t = [ `Mutation_observer ] Js.t

  let t = Js.Ffi.constr "MutationObserver"

  let make ~callback () =
    let callback = Js.to_any callback in
    Js.Ffi.obj_new t [| callback |]

  let observe ~target ?options this =
    let target = Js.to_any target in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.to_unit (Js.Ffi.meth_call this "observe" [| target; options |])

  let disconnect this = Js.to_unit (Js.Ffi.meth_call this "disconnect" [||])

  let take_records this =
    (Js.Any.to_array Js.of_any) (Js.Ffi.meth_call this "takeRecords" [||])
end

and Mutation_callback : sig
  type t =
    mutations:[ `Mutation_record ] Js.t array ->
    observer:[ `Mutation_observer ] Js.t ->
    unit
end = struct end

and Mutation_observer_init : sig
  type t

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

  val child_list : t -> bool option
  val attributes : t -> bool option
  val character_data : t -> bool option
  val subtree : t -> bool option
  val attribute_old_value : t -> bool option
  val character_data_old_value : t -> bool option
  val attribute_filter : t -> string array option
end = struct end

and Mutation_record : sig
  type t = [ `Mutation_record ] Js.t

  val t : [ `Mutation_record ] Js.constr
  val type_ : t -> string
  val target : t -> [ `Node ] Js.t
  val added_nodes : t -> [ `Node_list ] Js.t
  val removed_nodes : t -> [ `Node_list ] Js.t
  val previous_sibling : t -> [ `Node ] Js.t option
  val next_sibling : t -> [ `Node ] Js.t option
  val attribute_name : t -> string option
  val attribute_namespace : t -> string option
  val old_value : t -> string option
end = struct
  type t = [ `Mutation_record ] Js.t

  let t = Js.Ffi.constr "MutationRecord"
  let type_ this = Js.Any.to_string (Js.Ffi.get this "type")
  let target this = Js.of_any (Js.Ffi.get this "target")
  let added_nodes this = Js.of_any (Js.Ffi.get this "addedNodes")
  let removed_nodes this = Js.of_any (Js.Ffi.get this "removedNodes")

  let previous_sibling this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "previousSibling")

  let next_sibling this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "nextSibling")

  let attribute_name this =
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.Ffi.get this "attributeName")

  let attribute_namespace this =
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.Ffi.get this "attributeNamespace")

  let old_value this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "oldValue")
end

and Node : sig
  type t = [ `Node ] Js.t

  val t : [ `Node ] Js.constr
  val to_event_target : t -> [ `Event_target ] Js.t
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
  val node_name : t -> string
  val base_uri : t -> string
  val is_connected : t -> bool
  val owner_document : t -> [ `Document ] Js.t option

  val get_root_node :
    ?options:[ `Get_root_node_options ] Js.t -> t -> [ `Node ] Js.t

  val parent_node : t -> [ `Node ] Js.t option
  val parent_element : t -> [ `Element ] Js.t option
  val has_child_nodes : t -> bool
  val child_nodes : t -> [ `Node_list ] Js.t
  val first_child : t -> [ `Node ] Js.t option
  val last_child : t -> [ `Node ] Js.t option
  val previous_sibling : t -> [ `Node ] Js.t option
  val next_sibling : t -> [ `Node ] Js.t option
  val node_value : t -> string option
  val set_node_value : t -> string option -> unit
  val text_content : t -> string option
  val set_text_content : t -> string option -> unit
  val normalize : t -> unit
  val clone_node : ?deep:bool -> t -> [ `Node ] Js.t
  val is_equal_node : other_node:[ `Node ] Js.t option -> t -> bool
  val is_same_node : other_node:[ `Node ] Js.t option -> t -> bool
  val document_position_disconnected : int
  val document_position_preceding : int
  val document_position_following : int
  val document_position_contains : int
  val document_position_contained_by : int
  val document_position_implementation_specific : int
  val compare_document_position : other:[ `Node ] Js.t -> t -> int
  val contains : other:[ `Node ] Js.t option -> t -> bool
  val lookup_prefix : namespace:string option -> t -> string option
  val lookup_namespace_uri : prefix:string option -> t -> string option
  val is_default_namespace : namespace:string option -> t -> bool

  val insert_before :
    node:[ `Node ] Js.t -> child:[ `Node ] Js.t option -> t -> [ `Node ] Js.t

  val append_child : node:[ `Node ] Js.t -> t -> [ `Node ] Js.t

  val replace_child :
    node:[ `Node ] Js.t -> child:[ `Node ] Js.t -> t -> [ `Node ] Js.t

  val remove_child : child:[ `Node ] Js.t -> t -> [ `Node ] Js.t
end = struct
  type t = [ `Node ] Js.t

  let t = Js.Ffi.constr "Node"
  let to_event_target this = Js.Ffi.magic this
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
  let node_type this = Js.Any.to_int (Js.Ffi.get this "nodeType")
  let node_name this = Js.Any.to_string (Js.Ffi.get this "nodeName")
  let base_uri this = Js.Any.to_string (Js.Ffi.get this "baseURI")
  let is_connected this = Js.Any.to_bool (Js.Ffi.get this "isConnected")

  let owner_document this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "ownerDocument")

  let get_root_node ?options this =
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.of_any (Js.Ffi.meth_call this "getRootNode" [| options |])

  let parent_node this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "parentNode")

  let parent_element this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "parentElement")

  let has_child_nodes this =
    Js.Any.to_bool (Js.Ffi.meth_call this "hasChildNodes" [||])

  let child_nodes this = Js.of_any (Js.Ffi.get this "childNodes")

  let first_child this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "firstChild")

  let last_child this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "lastChild")

  let previous_sibling this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "previousSibling")

  let next_sibling this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "nextSibling")

  let node_value this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "nodeValue")

  let set_node_value this x =
    Js.Ffi.set this "nodeValue" ((Js.Any.nullable_of_option Js.Any.of_string) x)

  let text_content this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "textContent")

  let set_text_content this x =
    Js.Ffi.set this "textContent"
      ((Js.Any.nullable_of_option Js.Any.of_string) x)

  let normalize this = Js.to_unit (Js.Ffi.meth_call this "normalize" [||])

  let clone_node ?deep this =
    let deep = (Js.Any.undefined_of_option Js.Any.of_bool) deep in
    Js.of_any (Js.Ffi.meth_call this "cloneNode" [| deep |])

  let is_equal_node ~other_node this =
    let other_node = (Js.Any.nullable_of_option Js.to_any) other_node in
    Js.Any.to_bool (Js.Ffi.meth_call this "isEqualNode" [| other_node |])

  let is_same_node ~other_node this =
    let other_node = (Js.Any.nullable_of_option Js.to_any) other_node in
    Js.Any.to_bool (Js.Ffi.meth_call this "isSameNode" [| other_node |])

  let document_position_disconnected = 1
  let document_position_preceding = 2
  let document_position_following = 4
  let document_position_contains = 8
  let document_position_contained_by = 16
  let document_position_implementation_specific = 32

  let compare_document_position ~other this =
    let other = Js.to_any other in
    Js.Any.to_int (Js.Ffi.meth_call this "compareDocumentPosition" [| other |])

  let contains ~other this =
    let other = (Js.Any.nullable_of_option Js.to_any) other in
    Js.Any.to_bool (Js.Ffi.meth_call this "contains" [| other |])

  let lookup_prefix ~namespace this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.Ffi.meth_call this "lookupPrefix" [| namespace |])

  let lookup_namespace_uri ~prefix this =
    let prefix = (Js.Any.nullable_of_option Js.Any.of_string) prefix in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.Ffi.meth_call this "lookupNamespaceURI" [| prefix |])

  let is_default_namespace ~namespace this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    Js.Any.to_bool (Js.Ffi.meth_call this "isDefaultNamespace" [| namespace |])

  let insert_before ~node ~child this =
    let node = Js.to_any node in
    let child = (Js.Any.nullable_of_option Js.to_any) child in
    Js.of_any (Js.Ffi.meth_call this "insertBefore" [| node; child |])

  let append_child ~node this =
    let node = Js.to_any node in
    Js.of_any (Js.Ffi.meth_call this "appendChild" [| node |])

  let replace_child ~node ~child this =
    let node = Js.to_any node in
    let child = Js.to_any child in
    Js.of_any (Js.Ffi.meth_call this "replaceChild" [| node; child |])

  let remove_child ~child this =
    let child = Js.to_any child in
    Js.of_any (Js.Ffi.meth_call this "removeChild" [| child |])
end

and Get_root_node_options : sig
  type t

  val make : ?composed:bool -> unit -> t
  val composed : t -> bool option
end = struct end

and Document : sig
  type t = [ `Document ] Js.t

  val t : [ `Document ] Js.constr
  val to_node : t -> [ `Node ] Js.t
  val make : unit -> t
  val implementation : t -> [ `Dom_implementation ] Js.t
  val url : t -> string
  val document_uri : t -> string
  val compat_mode : t -> string
  val character_set : t -> string
  val charset : t -> string
  val input_encoding : t -> string
  val content_type : t -> string
  val doctype : t -> [ `Document_type ] Js.t option
  val document_element : t -> [ `Element ] Js.t option

  val get_elements_by_tag_name :
    qualified_name:string -> t -> [ `Html_collection ] Js.t

  val get_elements_by_tag_name_ns :
    namespace:string option ->
    local_name:string ->
    t ->
    [ `Html_collection ] Js.t

  val get_elements_by_class_name :
    class_names:string -> t -> [ `Html_collection ] Js.t

  val create_element :
    local_name:string ->
    ?options:[ `String | `Element_creation_options ] Js.t ->
    t ->
    [ `Element ] Js.t

  val create_element_ns :
    namespace:string option ->
    qualified_name:string ->
    ?options:[ `String | `Element_creation_options ] Js.t ->
    t ->
    [ `Element ] Js.t

  val create_document_fragment : t -> [ `Document_fragment ] Js.t
  val create_text_node : data:string -> t -> [ `Text ] Js.t
  val create_cdata_section : data:string -> t -> [ `Cdata_section ] Js.t
  val create_comment : data:string -> t -> [ `Comment ] Js.t

  val create_processing_instruction :
    target:string -> data:string -> t -> [ `Processing_instruction ] Js.t

  val import_node : node:[ `Node ] Js.t -> ?deep:bool -> t -> [ `Node ] Js.t
  val adopt_node : node:[ `Node ] Js.t -> t -> [ `Node ] Js.t
  val create_attribute : local_name:string -> t -> [ `Attr ] Js.t

  val create_attribute_ns :
    namespace:string option -> qualified_name:string -> t -> [ `Attr ] Js.t

  val create_event : interface:string -> t -> [ `Event ] Js.t
  val create_range : t -> [ `Range ] Js.t

  val create_node_iterator :
    root:[ `Node ] Js.t ->
    ?what_to_show:int ->
    ?filter:[ `Node_filter ] Js.t option ->
    t ->
    [ `Node_iterator ] Js.t

  val create_tree_walker :
    root:[ `Node ] Js.t ->
    ?what_to_show:int ->
    ?filter:[ `Node_filter ] Js.t option ->
    t ->
    [ `Tree_walker ] Js.t

  val evaluate :
    expression:string ->
    context_node:[ `Node ] Js.t ->
    ?resolver:[ `X_path_ns_resolver ] Js.t option ->
    ?type_:int ->
    ?result:[ `X_path_result ] Js.t option ->
    t ->
    [ `X_path_result ] Js.t

  val create_ns_resolver : node_resolver:[ `Node ] Js.t -> t -> [ `Node ] Js.t

  val create_expression :
    expression:string ->
    ?resolver:[ `X_path_ns_resolver ] Js.t option ->
    t ->
    [ `X_path_expression ] Js.t

  val query_selector_all : selectors:string -> t -> [ `Node_list ] Js.t
  val query_selector : selectors:string -> t -> [ `Element ] Js.t option

  val replace_children :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val append :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val prepend :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val child_element_count : t -> int
  val last_element_child : t -> [ `Element ] Js.t option
  val first_element_child : t -> [ `Element ] Js.t option
  val children : t -> [ `Html_collection ] Js.t
end = struct
  type t = [ `Document ] Js.t

  let t = Js.Ffi.constr "Document"
  let to_node this = Js.Ffi.magic this
  let make () = Js.Ffi.obj_new t [||]
  let implementation this = Js.of_any (Js.Ffi.get this "implementation")
  let url this = Js.Any.to_string (Js.Ffi.get this "URL")
  let document_uri this = Js.Any.to_string (Js.Ffi.get this "documentURI")
  let compat_mode this = Js.Any.to_string (Js.Ffi.get this "compatMode")
  let character_set this = Js.Any.to_string (Js.Ffi.get this "characterSet")
  let charset this = Js.Any.to_string (Js.Ffi.get this "charset")
  let input_encoding this = Js.Any.to_string (Js.Ffi.get this "inputEncoding")
  let content_type this = Js.Any.to_string (Js.Ffi.get this "contentType")

  let doctype this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "doctype")

  let document_element this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "documentElement")

  let get_elements_by_tag_name ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.of_any (Js.Ffi.meth_call this "getElementsByTagName" [| qualified_name |])

  let get_elements_by_tag_name_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.of_any
      (Js.Ffi.meth_call this "getElementsByTagNameNS"
         [| namespace; local_name |]
      )

  let get_elements_by_class_name ~class_names this =
    let class_names = Js.Any.of_string class_names in
    Js.of_any (Js.Ffi.meth_call this "getElementsByClassName" [| class_names |])

  let create_element ~local_name ?options this =
    let local_name = Js.Any.of_string local_name in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.of_any (Js.Ffi.meth_call this "createElement" [| local_name; options |])

  let create_element_ns ~namespace ~qualified_name ?options this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    let options = (Js.Any.undefined_of_option Js.to_any) options in
    Js.of_any
      (Js.Ffi.meth_call this "createElementNS"
         [| namespace; qualified_name; options |]
      )

  let create_document_fragment this =
    Js.of_any (Js.Ffi.meth_call this "createDocumentFragment" [||])

  let create_text_node ~data this =
    let data = Js.Any.of_string data in
    Js.of_any (Js.Ffi.meth_call this "createTextNode" [| data |])

  let create_cdata_section ~data this =
    let data = Js.Any.of_string data in
    Js.of_any (Js.Ffi.meth_call this "createCDATASection" [| data |])

  let create_comment ~data this =
    let data = Js.Any.of_string data in
    Js.of_any (Js.Ffi.meth_call this "createComment" [| data |])

  let create_processing_instruction ~target ~data this =
    let target = Js.Any.of_string target in
    let data = Js.Any.of_string data in
    Js.of_any
      (Js.Ffi.meth_call this "createProcessingInstruction" [| target; data |])

  let import_node ~node ?deep this =
    let node = Js.to_any node in
    let deep = (Js.Any.undefined_of_option Js.Any.of_bool) deep in
    Js.of_any (Js.Ffi.meth_call this "importNode" [| node; deep |])

  let adopt_node ~node this =
    let node = Js.to_any node in
    Js.of_any (Js.Ffi.meth_call this "adoptNode" [| node |])

  let create_attribute ~local_name this =
    let local_name = Js.Any.of_string local_name in
    Js.of_any (Js.Ffi.meth_call this "createAttribute" [| local_name |])

  let create_attribute_ns ~namespace ~qualified_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    Js.of_any
      (Js.Ffi.meth_call this "createAttributeNS" [| namespace; qualified_name |])

  let create_event ~interface this =
    let interface = Js.Any.of_string interface in
    Js.of_any (Js.Ffi.meth_call this "createEvent" [| interface |])

  let create_range this = Js.of_any (Js.Ffi.meth_call this "createRange" [||])

  let create_node_iterator ~root ?what_to_show ?filter this =
    let root = Js.to_any root in
    let what_to_show =
      (Js.Any.undefined_of_option Js.Any.of_int) what_to_show
    in
    let filter =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) filter
    in
    Js.of_any
      (Js.Ffi.meth_call this "createNodeIterator"
         [| root; what_to_show; filter |]
      )

  let create_tree_walker ~root ?what_to_show ?filter this =
    let root = Js.to_any root in
    let what_to_show =
      (Js.Any.undefined_of_option Js.Any.of_int) what_to_show
    in
    let filter =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) filter
    in
    Js.of_any
      (Js.Ffi.meth_call this "createTreeWalker" [| root; what_to_show; filter |])

  let evaluate ~expression ~context_node ?resolver ?type_ ?result this =
    let expression = Js.Any.of_string expression in
    let context_node = Js.to_any context_node in
    let resolver =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any))
        resolver
    in
    let type_ = (Js.Any.undefined_of_option Js.Any.of_int) type_ in
    let result =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) result
    in
    Js.of_any
      (Js.Ffi.meth_call this "evaluate"
         [| expression; context_node; resolver; type_; result |]
      )

  let create_ns_resolver ~node_resolver this =
    let node_resolver = Js.to_any node_resolver in
    Js.of_any (Js.Ffi.meth_call this "createNSResolver" [| node_resolver |])

  let create_expression ~expression ?resolver this =
    let expression = Js.Any.of_string expression in
    let resolver =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any))
        resolver
    in
    Js.of_any
      (Js.Ffi.meth_call this "createExpression" [| expression; resolver |])

  let query_selector_all ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Js.of_any (Js.Ffi.meth_call this "querySelectorAll" [| selectors |])

  let query_selector ~selectors this =
    let selectors = Js.Any.of_string selectors in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "querySelector" [| selectors |])

  let replace_children ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "replaceChildren" [| nodes |])

  let append ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "append" [| nodes |])

  let prepend ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "prepend" [| nodes |])

  let child_element_count this =
    Js.Any.to_int (Js.Ffi.get this "childElementCount")

  let last_element_child this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "lastElementChild")

  let first_element_child this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "firstElementChild")

  let children this = Js.of_any (Js.Ffi.get this "children")
end

and Xml_document : sig
  type t = [ `Xml_document ] Js.t

  val t : [ `Xml_document ] Js.constr
  val to_document : t -> [ `Document ] Js.t
end = struct
  type t = [ `Xml_document ] Js.t

  let t = Js.Ffi.constr "XMLDocument"
  let to_document this = Js.Ffi.magic this
end

and Element_creation_options : sig
  type t

  val make : ?is:string -> unit -> t
  val is : t -> string option
end = struct end

and Dom_implementation : sig
  type t = [ `Dom_implementation ] Js.t

  val t : [ `Dom_implementation ] Js.constr

  val create_document_type :
    qualified_name:string ->
    public_id:string ->
    system_id:string ->
    t ->
    [ `Document_type ] Js.t

  val create_document :
    namespace:string option ->
    qualified_name:string ->
    ?doctype:[ `Document_type ] Js.t option ->
    t ->
    [ `Xml_document ] Js.t

  val create_html_document : ?title:string -> t -> [ `Document ] Js.t
  val has_feature : t -> bool
end = struct
  type t = [ `Dom_implementation ] Js.t

  let t = Js.Ffi.constr "DOMImplementation"

  let create_document_type ~qualified_name ~public_id ~system_id this =
    let qualified_name = Js.Any.of_string qualified_name in
    let public_id = Js.Any.of_string public_id in
    let system_id = Js.Any.of_string system_id in
    Js.of_any
      (Js.Ffi.meth_call this "createDocumentType"
         [| qualified_name; public_id; system_id |]
      )

  let create_document ~namespace ~qualified_name ?doctype this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    let doctype =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) doctype
    in
    Js.of_any
      (Js.Ffi.meth_call this "createDocument"
         [| namespace; qualified_name; doctype |]
      )

  let create_html_document ?title this =
    let title = (Js.Any.undefined_of_option Js.Any.of_string) title in
    Js.of_any (Js.Ffi.meth_call this "createHTMLDocument" [| title |])

  let has_feature this = Js.Any.to_bool (Js.Ffi.meth_call this "hasFeature" [||])
end

and Document_type : sig
  type t = [ `Document_type ] Js.t

  val t : [ `Document_type ] Js.constr
  val to_node : t -> [ `Node ] Js.t
  val name : t -> string
  val public_id : t -> string
  val system_id : t -> string
end = struct
  type t = [ `Document_type ] Js.t

  let t = Js.Ffi.constr "DocumentType"
  let to_node this = Js.Ffi.magic this
  let name this = Js.Any.to_string (Js.Ffi.get this "name")
  let public_id this = Js.Any.to_string (Js.Ffi.get this "publicId")
  let system_id this = Js.Any.to_string (Js.Ffi.get this "systemId")
end

and Document_fragment : sig
  type t = [ `Document_fragment ] Js.t

  val t : [ `Document_fragment ] Js.constr
  val to_node : t -> [ `Node ] Js.t
  val make : unit -> t
  val query_selector_all : selectors:string -> t -> [ `Node_list ] Js.t
  val query_selector : selectors:string -> t -> [ `Element ] Js.t option

  val replace_children :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val append :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val prepend :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val child_element_count : t -> int
  val last_element_child : t -> [ `Element ] Js.t option
  val first_element_child : t -> [ `Element ] Js.t option
  val children : t -> [ `Html_collection ] Js.t
end = struct
  type t = [ `Document_fragment ] Js.t

  let t = Js.Ffi.constr "DocumentFragment"
  let to_node this = Js.Ffi.magic this
  let make () = Js.Ffi.obj_new t [||]

  let query_selector_all ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Js.of_any (Js.Ffi.meth_call this "querySelectorAll" [| selectors |])

  let query_selector ~selectors this =
    let selectors = Js.Any.of_string selectors in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "querySelector" [| selectors |])

  let replace_children ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "replaceChildren" [| nodes |])

  let append ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "append" [| nodes |])

  let prepend ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "prepend" [| nodes |])

  let child_element_count this =
    Js.Any.to_int (Js.Ffi.get this "childElementCount")

  let last_element_child this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "lastElementChild")

  let first_element_child this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "firstElementChild")

  let children this = Js.of_any (Js.Ffi.get this "children")
end

and Shadow_root : sig
  type t = [ `Shadow_root ] Js.t

  val t : [ `Shadow_root ] Js.constr
  val to_document_fragment : t -> [ `Document_fragment ] Js.t
  val mode : t -> [ `Shadow_root_mode ] Js.t
  val delegates_focus : t -> bool
  val slot_assignment : t -> [ `Slot_assignment_mode ] Js.t
  val clonable : t -> bool
  val serializable : t -> bool
  val host : t -> [ `Element ] Js.t
  val onslotchange : t -> [ `Event_handler ] Js.t
  val set_onslotchange : t -> [ `Event_handler ] Js.t -> unit
end = struct
  type t = [ `Shadow_root ] Js.t

  let t = Js.Ffi.constr "ShadowRoot"
  let to_document_fragment this = Js.Ffi.magic this
  let mode this = Js.of_any (Js.Ffi.get this "mode")
  let delegates_focus this = Js.Any.to_bool (Js.Ffi.get this "delegatesFocus")
  let slot_assignment this = Js.of_any (Js.Ffi.get this "slotAssignment")
  let clonable this = Js.Any.to_bool (Js.Ffi.get this "clonable")
  let serializable this = Js.Any.to_bool (Js.Ffi.get this "serializable")
  let host this = Js.of_any (Js.Ffi.get this "host")
  let onslotchange this = Js.of_any (Js.Ffi.get this "onslotchange")
  let set_onslotchange this x = Js.Ffi.set this "onslotchange" (Js.to_any x)
end

and Shadow_root_mode : sig
  type t

  val to_string : t -> Js.string
  val open_ : t
  val closed : t
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let open_ = Js.of_string "open"
  let closed = Js.of_string "closed"
end

and Slot_assignment_mode : sig
  type t

  val to_string : t -> Js.string
  val manual : t
  val named : t
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let manual = Js.of_string "manual"
  let named = Js.of_string "named"
end

and Element : sig
  type t = [ `Element ] Js.t

  val t : [ `Element ] Js.constr
  val to_node : t -> [ `Node ] Js.t
  val namespace_uri : t -> string option
  val prefix : t -> string option
  val local_name : t -> string
  val tag_name : t -> string
  val id : t -> string
  val set_id : t -> string -> unit
  val class_name : t -> string
  val set_class_name : t -> string -> unit
  val class_list : t -> [ `Dom_token_list ] Js.t
  val slot : t -> string
  val set_slot : t -> string -> unit
  val has_attributes : t -> bool
  val attributes : t -> [ `Named_node_map ] Js.t
  val get_attribute_names : t -> string array
  val get_attribute : qualified_name:string -> t -> string option

  val get_attribute_ns :
    namespace:string option -> local_name:string -> t -> string option

  val set_attribute : qualified_name:string -> value:string -> t -> unit

  val set_attribute_ns :
    namespace:string option ->
    qualified_name:string ->
    value:string ->
    t ->
    unit

  val remove_attribute : qualified_name:string -> t -> unit

  val remove_attribute_ns :
    namespace:string option -> local_name:string -> t -> unit

  val toggle_attribute : qualified_name:string -> ?force:bool -> t -> bool
  val has_attribute : qualified_name:string -> t -> bool

  val has_attribute_ns :
    namespace:string option -> local_name:string -> t -> bool

  val get_attribute_node : qualified_name:string -> t -> [ `Attr ] Js.t option

  val get_attribute_node_ns :
    namespace:string option -> local_name:string -> t -> [ `Attr ] Js.t option

  val set_attribute_node : attr:[ `Attr ] Js.t -> t -> [ `Attr ] Js.t option
  val set_attribute_node_ns : attr:[ `Attr ] Js.t -> t -> [ `Attr ] Js.t option
  val remove_attribute_node : attr:[ `Attr ] Js.t -> t -> [ `Attr ] Js.t

  val attach_shadow :
    init:[ `Shadow_root_init ] Js.t -> t -> [ `Shadow_root ] Js.t

  val shadow_root : t -> [ `Shadow_root ] Js.t option
  val closest : selectors:string -> t -> [ `Element ] Js.t option
  val matches : selectors:string -> t -> bool
  val webkit_matches_selector : selectors:string -> t -> bool

  val get_elements_by_tag_name :
    qualified_name:string -> t -> [ `Html_collection ] Js.t

  val get_elements_by_tag_name_ns :
    namespace:string option ->
    local_name:string ->
    t ->
    [ `Html_collection ] Js.t

  val get_elements_by_class_name :
    class_names:string -> t -> [ `Html_collection ] Js.t

  val insert_adjacent_element :
    where:string -> element:[ `Element ] Js.t -> t -> [ `Element ] Js.t option

  val insert_adjacent_text : where:string -> data:string -> t -> unit
  val assigned_slot : t -> [ `Html_slot_element ] Js.t option
  val next_element_sibling : t -> [ `Element ] Js.t option
  val previous_element_sibling : t -> [ `Element ] Js.t option
  val remove : t -> unit

  val replace_with :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val after :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val before :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit
end = struct
  type t = [ `Element ] Js.t

  let t = Js.Ffi.constr "Element"
  let to_node this = Js.Ffi.magic this

  let namespace_uri this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "namespaceURI")

  let prefix this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "prefix")

  let local_name this = Js.Any.to_string (Js.Ffi.get this "localName")
  let tag_name this = Js.Any.to_string (Js.Ffi.get this "tagName")
  let id this = Js.Any.to_string (Js.Ffi.get this "id")
  let set_id this x = Js.Ffi.set this "id" (Js.Any.of_string x)
  let class_name this = Js.Any.to_string (Js.Ffi.get this "className")
  let set_class_name this x = Js.Ffi.set this "className" (Js.Any.of_string x)
  let class_list this = Js.of_any (Js.Ffi.get this "classList")
  let slot this = Js.Any.to_string (Js.Ffi.get this "slot")
  let set_slot this x = Js.Ffi.set this "slot" (Js.Any.of_string x)

  let has_attributes this =
    Js.Any.to_bool (Js.Ffi.meth_call this "hasAttributes" [||])

  let attributes this = Js.of_any (Js.Ffi.get this "attributes")

  let get_attribute_names this =
    (Js.Any.to_array Js.Any.to_string)
      (Js.Ffi.meth_call this "getAttributeNames" [||])

  let get_attribute ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.Ffi.meth_call this "getAttribute" [| qualified_name |])

  let get_attribute_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    (Js.Any.nullable_to_option Js.Any.to_string)
      (Js.Ffi.meth_call this "getAttributeNS" [| namespace; local_name |])

  let set_attribute ~qualified_name ~value this =
    let qualified_name = Js.Any.of_string qualified_name in
    let value = Js.Any.of_string value in
    Js.to_unit (Js.Ffi.meth_call this "setAttribute" [| qualified_name; value |])

  let set_attribute_ns ~namespace ~qualified_name ~value this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let qualified_name = Js.Any.of_string qualified_name in
    let value = Js.Any.of_string value in
    Js.to_unit
      (Js.Ffi.meth_call this "setAttributeNS"
         [| namespace; qualified_name; value |]
      )

  let remove_attribute ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.to_unit (Js.Ffi.meth_call this "removeAttribute" [| qualified_name |])

  let remove_attribute_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.to_unit
      (Js.Ffi.meth_call this "removeAttributeNS" [| namespace; local_name |])

  let toggle_attribute ~qualified_name ?force this =
    let qualified_name = Js.Any.of_string qualified_name in
    let force = (Js.Any.undefined_of_option Js.Any.of_bool) force in
    Js.Any.to_bool
      (Js.Ffi.meth_call this "toggleAttribute" [| qualified_name; force |])

  let has_attribute ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.Any.to_bool (Js.Ffi.meth_call this "hasAttribute" [| qualified_name |])

  let has_attribute_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.Any.to_bool
      (Js.Ffi.meth_call this "hasAttributeNS" [| namespace; local_name |])

  let get_attribute_node ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "getAttributeNode" [| qualified_name |])

  let get_attribute_node_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "getAttributeNodeNS" [| namespace; local_name |])

  let set_attribute_node ~attr this =
    let attr = Js.to_any attr in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "setAttributeNode" [| attr |])

  let set_attribute_node_ns ~attr this =
    let attr = Js.to_any attr in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "setAttributeNodeNS" [| attr |])

  let remove_attribute_node ~attr this =
    let attr = Js.to_any attr in
    Js.of_any (Js.Ffi.meth_call this "removeAttributeNode" [| attr |])

  let attach_shadow ~init this =
    let init = Js.to_any init in
    Js.of_any (Js.Ffi.meth_call this "attachShadow" [| init |])

  let shadow_root this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "shadowRoot")

  let closest ~selectors this =
    let selectors = Js.Any.of_string selectors in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "closest" [| selectors |])

  let matches ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Js.Any.to_bool (Js.Ffi.meth_call this "matches" [| selectors |])

  let webkit_matches_selector ~selectors this =
    let selectors = Js.Any.of_string selectors in
    Js.Any.to_bool
      (Js.Ffi.meth_call this "webkitMatchesSelector" [| selectors |])

  let get_elements_by_tag_name ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.of_any (Js.Ffi.meth_call this "getElementsByTagName" [| qualified_name |])

  let get_elements_by_tag_name_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.of_any
      (Js.Ffi.meth_call this "getElementsByTagNameNS"
         [| namespace; local_name |]
      )

  let get_elements_by_class_name ~class_names this =
    let class_names = Js.Any.of_string class_names in
    Js.of_any (Js.Ffi.meth_call this "getElementsByClassName" [| class_names |])

  let insert_adjacent_element ~where ~element this =
    let where = Js.Any.of_string where in
    let element = Js.to_any element in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "insertAdjacentElement" [| where; element |])

  let insert_adjacent_text ~where ~data this =
    let where = Js.Any.of_string where in
    let data = Js.Any.of_string data in
    Js.to_unit (Js.Ffi.meth_call this "insertAdjacentText" [| where; data |])

  let assigned_slot this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "assignedSlot")

  let next_element_sibling this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "nextElementSibling")

  let previous_element_sibling this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.get this "previousElementSibling")

  let remove this = Js.to_unit (Js.Ffi.meth_call this "remove" [||])

  let replace_with ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "replaceWith" [| nodes |])

  let after ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "after" [| nodes |])

  let before ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "before" [| nodes |])
end

and Shadow_root_init : sig
  type t

  val make :
    mode:[ `Shadow_root_mode ] Js.t ->
    ?delegates_focus:bool ->
    ?slot_assignment:[ `Slot_assignment_mode ] Js.t ->
    ?clonable:bool ->
    ?serializable:bool ->
    unit ->
    t

  val mode : t -> [ `Shadow_root_mode ] Js.t
  val delegates_focus : t -> bool option
  val slot_assignment : t -> [ `Slot_assignment_mode ] Js.t option
  val clonable : t -> bool option
  val serializable : t -> bool option
end = struct end

and Named_node_map : sig
  type t = [ `Named_node_map ] Js.t

  val t : [ `Named_node_map ] Js.constr
  val length : t -> int
  val get_item : t -> index:int -> [ `Attr ] Js.t option
  val get_get_named_item : t -> qualified_name:string -> [ `Attr ] Js.t option

  val get_named_item_ns :
    namespace:string option -> local_name:string -> t -> [ `Attr ] Js.t option

  val set_named_item : attr:[ `Attr ] Js.t -> t -> [ `Attr ] Js.t option
  val set_named_item_ns : attr:[ `Attr ] Js.t -> t -> [ `Attr ] Js.t option
  val remove_named_item : qualified_name:string -> t -> [ `Attr ] Js.t

  val remove_named_item_ns :
    namespace:string option -> local_name:string -> t -> [ `Attr ] Js.t
end = struct
  type t = [ `Named_node_map ] Js.t

  let t = Js.Ffi.constr "NamedNodeMap"
  let length this = Js.Any.to_int (Js.Ffi.get this "length")

  let get_named_item_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "getNamedItemNS" [| namespace; local_name |])

  let set_named_item ~attr this =
    let attr = Js.to_any attr in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "setNamedItem" [| attr |])

  let set_named_item_ns ~attr this =
    let attr = Js.to_any attr in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "setNamedItemNS" [| attr |])

  let remove_named_item ~qualified_name this =
    let qualified_name = Js.Any.of_string qualified_name in
    Js.of_any (Js.Ffi.meth_call this "removeNamedItem" [| qualified_name |])

  let remove_named_item_ns ~namespace ~local_name this =
    let namespace = (Js.Any.nullable_of_option Js.Any.of_string) namespace in
    let local_name = Js.Any.of_string local_name in
    Js.of_any
      (Js.Ffi.meth_call this "removeNamedItemNS" [| namespace; local_name |])
end

and Attr : sig
  type t = [ `Attr ] Js.t

  val t : [ `Attr ] Js.constr
  val to_node : t -> [ `Node ] Js.t
  val namespace_uri : t -> string option
  val prefix : t -> string option
  val local_name : t -> string
  val name : t -> string
  val value : t -> string
  val set_value : t -> string -> unit
  val owner_element : t -> [ `Element ] Js.t option
  val specified : t -> bool
end = struct
  type t = [ `Attr ] Js.t

  let t = Js.Ffi.constr "Attr"
  let to_node this = Js.Ffi.magic this

  let namespace_uri this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "namespaceURI")

  let prefix this =
    (Js.Any.nullable_to_option Js.Any.to_string) (Js.Ffi.get this "prefix")

  let local_name this = Js.Any.to_string (Js.Ffi.get this "localName")
  let name this = Js.Any.to_string (Js.Ffi.get this "name")
  let value this = Js.Any.to_string (Js.Ffi.get this "value")
  let set_value this x = Js.Ffi.set this "value" (Js.Any.of_string x)

  let owner_element this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "ownerElement")

  let specified this = Js.Any.to_bool (Js.Ffi.get this "specified")
end

and Character_data : sig
  type t = [ `Character_data ] Js.t

  val t : [ `Character_data ] Js.constr
  val to_node : t -> [ `Node ] Js.t
  val data : t -> string
  val set_data : t -> string -> unit
  val length : t -> int
  val substring_data : offset:int -> count:int -> t -> string
  val append_data : data:string -> t -> unit
  val insert_data : offset:int -> data:string -> t -> unit
  val delete_data : offset:int -> count:int -> t -> unit
  val replace_data : offset:int -> count:int -> data:string -> t -> unit
  val remove : t -> unit

  val replace_with :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val after :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit

  val before :
    nodes:[ `Node | `Trusted_script | `String ] Js.t array -> t -> unit
end = struct
  type t = [ `Character_data ] Js.t

  let t = Js.Ffi.constr "CharacterData"
  let to_node this = Js.Ffi.magic this
  let data this = Js.Any.to_string (Js.Ffi.get this "data")
  let set_data this x = Js.Ffi.set this "data" (Js.Any.of_string x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")

  let substring_data ~offset ~count this =
    let offset = Js.Any.of_int offset in
    let count = Js.Any.of_int count in
    Js.Any.to_string (Js.Ffi.meth_call this "substringData" [| offset; count |])

  let append_data ~data this =
    let data = Js.Any.of_string data in
    Js.to_unit (Js.Ffi.meth_call this "appendData" [| data |])

  let insert_data ~offset ~data this =
    let offset = Js.Any.of_int offset in
    let data = Js.Any.of_string data in
    Js.to_unit (Js.Ffi.meth_call this "insertData" [| offset; data |])

  let delete_data ~offset ~count this =
    let offset = Js.Any.of_int offset in
    let count = Js.Any.of_int count in
    Js.to_unit (Js.Ffi.meth_call this "deleteData" [| offset; count |])

  let replace_data ~offset ~count ~data this =
    let offset = Js.Any.of_int offset in
    let count = Js.Any.of_int count in
    let data = Js.Any.of_string data in
    Js.to_unit (Js.Ffi.meth_call this "replaceData" [| offset; count; data |])

  let remove this = Js.to_unit (Js.Ffi.meth_call this "remove" [||])

  let replace_with ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "replaceWith" [| nodes |])

  let after ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "after" [| nodes |])

  let before ~nodes this =
    let nodes = (Js.Any.of_array Js.to_any) nodes in
    Js.to_unit (Js.Ffi.meth_call this "before" [| nodes |])
end

and Text : sig
  type t = [ `Text ] Js.t

  val t : [ `Text ] Js.constr
  val to_character_data : t -> [ `Character_data ] Js.t
  val make : ?data:string -> unit -> t
  val split_text : offset:int -> t -> [ `Text ] Js.t
  val whole_text : t -> string
end = struct
  type t = [ `Text ] Js.t

  let t = Js.Ffi.constr "Text"
  let to_character_data this = Js.Ffi.magic this

  let make ?data () =
    let data = (Js.Any.undefined_of_option Js.Any.of_string) data in
    Js.Ffi.obj_new t [| data |]

  let split_text ~offset this =
    let offset = Js.Any.of_int offset in
    Js.of_any (Js.Ffi.meth_call this "splitText" [| offset |])

  let whole_text this = Js.Any.to_string (Js.Ffi.get this "wholeText")
end

and Cdata_section : sig
  type t = [ `Cdata_section ] Js.t

  val t : [ `Cdata_section ] Js.constr
  val to_text : t -> [ `Text ] Js.t
end = struct
  type t = [ `Cdata_section ] Js.t

  let t = Js.Ffi.constr "CDATASection"
  let to_text this = Js.Ffi.magic this
end

and Processing_instruction : sig
  type t = [ `Processing_instruction ] Js.t

  val t : [ `Processing_instruction ] Js.constr
  val to_character_data : t -> [ `Character_data ] Js.t
  val target : t -> string
end = struct
  type t = [ `Processing_instruction ] Js.t

  let t = Js.Ffi.constr "ProcessingInstruction"
  let to_character_data this = Js.Ffi.magic this
  let target this = Js.Any.to_string (Js.Ffi.get this "target")
end

and Comment : sig
  type t = [ `Comment ] Js.t

  val t : [ `Comment ] Js.constr
  val to_character_data : t -> [ `Character_data ] Js.t
  val make : ?data:string -> unit -> t
end = struct
  type t = [ `Comment ] Js.t

  let t = Js.Ffi.constr "Comment"
  let to_character_data this = Js.Ffi.magic this

  let make ?data () =
    let data = (Js.Any.undefined_of_option Js.Any.of_string) data in
    Js.Ffi.obj_new t [| data |]
end

and Abstract_range : sig
  type t = [ `Abstract_range ] Js.t

  val t : [ `Abstract_range ] Js.constr
  val start_container : t -> [ `Node ] Js.t
  val start_offset : t -> int
  val end_container : t -> [ `Node ] Js.t
  val end_offset : t -> int
  val collapsed : t -> bool
end = struct
  type t = [ `Abstract_range ] Js.t

  let t = Js.Ffi.constr "AbstractRange"
  let start_container this = Js.of_any (Js.Ffi.get this "startContainer")
  let start_offset this = Js.Any.to_int (Js.Ffi.get this "startOffset")
  let end_container this = Js.of_any (Js.Ffi.get this "endContainer")
  let end_offset this = Js.Any.to_int (Js.Ffi.get this "endOffset")
  let collapsed this = Js.Any.to_bool (Js.Ffi.get this "collapsed")
end

and Static_range_init : sig
  type t

  val make :
    start_container:[ `Node ] Js.t ->
    start_offset:int ->
    end_container:[ `Node ] Js.t ->
    end_offset:int ->
    unit ->
    t

  val start_container : t -> [ `Node ] Js.t
  val start_offset : t -> int
  val end_container : t -> [ `Node ] Js.t
  val end_offset : t -> int
end = struct end

and Static_range : sig
  type t = [ `Static_range ] Js.t

  val t : [ `Static_range ] Js.constr
  val to_abstract_range : t -> [ `Abstract_range ] Js.t
  val make : init:[ `Static_range_init ] Js.t -> unit -> t
end = struct
  type t = [ `Static_range ] Js.t

  let t = Js.Ffi.constr "StaticRange"
  let to_abstract_range this = Js.Ffi.magic this

  let make ~init () =
    let init = Js.to_any init in
    Js.Ffi.obj_new t [| init |]
end

and Range : sig
  type t = [ `Range ] Js.t

  val t : [ `Range ] Js.constr
  val to_abstract_range : t -> [ `Abstract_range ] Js.t
  val make : unit -> t
  val common_ancestor_container : t -> [ `Node ] Js.t
  val set_start : node:[ `Node ] Js.t -> offset:int -> t -> unit
  val set_end : node:[ `Node ] Js.t -> offset:int -> t -> unit
  val set_start_before : node:[ `Node ] Js.t -> t -> unit
  val set_start_after : node:[ `Node ] Js.t -> t -> unit
  val set_end_before : node:[ `Node ] Js.t -> t -> unit
  val set_end_after : node:[ `Node ] Js.t -> t -> unit
  val collapse : ?to_start:bool -> t -> unit
  val select_node : node:[ `Node ] Js.t -> t -> unit
  val select_node_contents : node:[ `Node ] Js.t -> t -> unit
  val start_to_start : int
  val start_to_end : int
  val end_to_end : int
  val end_to_start : int

  val compare_boundary_points :
    how:int -> source_range:[ `Range ] Js.t -> t -> int

  val delete_contents : t -> unit
  val extract_contents : t -> [ `Document_fragment ] Js.t
  val clone_contents : t -> [ `Document_fragment ] Js.t
  val insert_node : node:[ `Node ] Js.t -> t -> unit
  val surround_contents : new_parent:[ `Node ] Js.t -> t -> unit
  val clone_range : t -> [ `Range ] Js.t
  val detach : t -> unit
  val is_point_in_range : node:[ `Node ] Js.t -> offset:int -> t -> bool
  val compare_point : node:[ `Node ] Js.t -> offset:int -> t -> int
  val intersects_node : node:[ `Node ] Js.t -> t -> bool
end = struct
  type t = [ `Range ] Js.t

  let t = Js.Ffi.constr "Range"
  let to_abstract_range this = Js.Ffi.magic this
  let make () = Js.Ffi.obj_new t [||]

  let common_ancestor_container this =
    Js.of_any (Js.Ffi.get this "commonAncestorContainer")

  let set_start ~node ~offset this =
    let node = Js.to_any node in
    let offset = Js.Any.of_int offset in
    Js.to_unit (Js.Ffi.meth_call this "setStart" [| node; offset |])

  let set_end ~node ~offset this =
    let node = Js.to_any node in
    let offset = Js.Any.of_int offset in
    Js.to_unit (Js.Ffi.meth_call this "setEnd" [| node; offset |])

  let set_start_before ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "setStartBefore" [| node |])

  let set_start_after ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "setStartAfter" [| node |])

  let set_end_before ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "setEndBefore" [| node |])

  let set_end_after ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "setEndAfter" [| node |])

  let collapse ?to_start this =
    let to_start = (Js.Any.undefined_of_option Js.Any.of_bool) to_start in
    Js.to_unit (Js.Ffi.meth_call this "collapse" [| to_start |])

  let select_node ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "selectNode" [| node |])

  let select_node_contents ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "selectNodeContents" [| node |])

  let start_to_start = 0
  let start_to_end = 1
  let end_to_end = 2
  let end_to_start = 3

  let compare_boundary_points ~how ~source_range this =
    let how = Js.Any.of_int how in
    let source_range = Js.to_any source_range in
    Js.Any.to_int
      (Js.Ffi.meth_call this "compareBoundaryPoints" [| how; source_range |])

  let delete_contents this =
    Js.to_unit (Js.Ffi.meth_call this "deleteContents" [||])

  let extract_contents this =
    Js.of_any (Js.Ffi.meth_call this "extractContents" [||])

  let clone_contents this =
    Js.of_any (Js.Ffi.meth_call this "cloneContents" [||])

  let insert_node ~node this =
    let node = Js.to_any node in
    Js.to_unit (Js.Ffi.meth_call this "insertNode" [| node |])

  let surround_contents ~new_parent this =
    let new_parent = Js.to_any new_parent in
    Js.to_unit (Js.Ffi.meth_call this "surroundContents" [| new_parent |])

  let clone_range this = Js.of_any (Js.Ffi.meth_call this "cloneRange" [||])
  let detach this = Js.to_unit (Js.Ffi.meth_call this "detach" [||])

  let is_point_in_range ~node ~offset this =
    let node = Js.to_any node in
    let offset = Js.Any.of_int offset in
    Js.Any.to_bool (Js.Ffi.meth_call this "isPointInRange" [| node; offset |])

  let compare_point ~node ~offset this =
    let node = Js.to_any node in
    let offset = Js.Any.of_int offset in
    Js.Any.to_int (Js.Ffi.meth_call this "comparePoint" [| node; offset |])

  let intersects_node ~node this =
    let node = Js.to_any node in
    Js.Any.to_bool (Js.Ffi.meth_call this "intersectsNode" [| node |])
end

and Node_iterator : sig
  type t = [ `Node_iterator ] Js.t

  val t : [ `Node_iterator ] Js.constr
  val root : t -> [ `Node ] Js.t
  val reference_node : t -> [ `Node ] Js.t
  val pointer_before_reference_node : t -> bool
  val what_to_show : t -> int
  val filter : t -> [ `Node_filter ] Js.t option
  val next_node : t -> [ `Node ] Js.t option
  val previous_node : t -> [ `Node ] Js.t option
  val detach : t -> unit
end = struct
  type t = [ `Node_iterator ] Js.t

  let t = Js.Ffi.constr "NodeIterator"
  let root this = Js.of_any (Js.Ffi.get this "root")
  let reference_node this = Js.of_any (Js.Ffi.get this "referenceNode")

  let pointer_before_reference_node this =
    Js.Any.to_bool (Js.Ffi.get this "pointerBeforeReferenceNode")

  let what_to_show this = Js.Any.to_int (Js.Ffi.get this "whatToShow")

  let filter this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "filter")

  let next_node this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.meth_call this "nextNode" [||])

  let previous_node this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "previousNode" [||])

  let detach this = Js.to_unit (Js.Ffi.meth_call this "detach" [||])
end

and Tree_walker : sig
  type t = [ `Tree_walker ] Js.t

  val t : [ `Tree_walker ] Js.constr
  val root : t -> [ `Node ] Js.t
  val what_to_show : t -> int
  val filter : t -> [ `Node_filter ] Js.t option
  val current_node : t -> [ `Node ] Js.t
  val set_current_node : t -> [ `Node ] Js.t -> unit
  val parent_node : t -> [ `Node ] Js.t option
  val first_child : t -> [ `Node ] Js.t option
  val last_child : t -> [ `Node ] Js.t option
  val previous_sibling : t -> [ `Node ] Js.t option
  val next_sibling : t -> [ `Node ] Js.t option
  val previous_node : t -> [ `Node ] Js.t option
  val next_node : t -> [ `Node ] Js.t option
end = struct
  type t = [ `Tree_walker ] Js.t

  let t = Js.Ffi.constr "TreeWalker"
  let root this = Js.of_any (Js.Ffi.get this "root")
  let what_to_show this = Js.Any.to_int (Js.Ffi.get this "whatToShow")

  let filter this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "filter")

  let current_node this = Js.of_any (Js.Ffi.get this "currentNode")
  let set_current_node this x = Js.Ffi.set this "currentNode" (Js.to_any x)

  let parent_node this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "parentNode" [||])

  let first_child this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "firstChild" [||])

  let last_child this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "lastChild" [||])

  let previous_sibling this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "previousSibling" [||])

  let next_sibling this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "nextSibling" [||])

  let previous_node this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "previousNode" [||])

  let next_node this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.meth_call this "nextNode" [||])
end

and Node_filter : sig
  type t = node:[ `Node ] Js.t -> int

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
end = struct end

and Dom_token_list : sig
  type t = [ `Dom_token_list ] Js.t

  val t : [ `Dom_token_list ] Js.constr
  val length : t -> int
  val get_item : t -> index:int -> string option
  val contains : token:string -> t -> bool
  val add : tokens:string array -> t -> unit
  val remove : tokens:string array -> t -> unit
  val toggle : token:string -> ?force:bool -> t -> bool
  val replace : token:string -> new_token:string -> t -> bool
  val supports : token:string -> t -> bool
  val to_string : t -> string
  val set_to_string : t -> string -> unit
  val value : t -> string
  val set_value : t -> string -> unit
  val to_iterable : t -> string Seq.t
end = struct
  type t = [ `Dom_token_list ] Js.t

  let t = Js.Ffi.constr "DOMTokenList"
  let length this = Js.Any.to_int (Js.Ffi.get this "length")

  let contains ~token this =
    let token = Js.Any.of_string token in
    Js.Any.to_bool (Js.Ffi.meth_call this "contains" [| token |])

  let add ~tokens this =
    let tokens = (Js.Any.of_array Js.Any.of_string) tokens in
    Js.to_unit (Js.Ffi.meth_call this "add" [| tokens |])

  let remove ~tokens this =
    let tokens = (Js.Any.of_array Js.Any.of_string) tokens in
    Js.to_unit (Js.Ffi.meth_call this "remove" [| tokens |])

  let toggle ~token ?force this =
    let token = Js.Any.of_string token in
    let force = (Js.Any.undefined_of_option Js.Any.of_bool) force in
    Js.Any.to_bool (Js.Ffi.meth_call this "toggle" [| token; force |])

  let replace ~token ~new_token this =
    let token = Js.Any.of_string token in
    let new_token = Js.Any.of_string new_token in
    Js.Any.to_bool (Js.Ffi.meth_call this "replace" [| token; new_token |])

  let supports ~token this =
    let token = Js.Any.of_string token in
    Js.Any.to_bool (Js.Ffi.meth_call this "supports" [| token |])
end

and X_path_result : sig
  type t = [ `X_path_result ] Js.t

  val t : [ `X_path_result ] Js.constr
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
  val number_value : t -> float
  val string_value : t -> string
  val boolean_value : t -> bool
  val single_node_value : t -> [ `Node ] Js.t option
  val invalid_iterator_state : t -> bool
  val snapshot_length : t -> int
  val iterate_next : t -> [ `Node ] Js.t option
  val snapshot_item : index:int -> t -> [ `Node ] Js.t option
end = struct
  type t = [ `X_path_result ] Js.t

  let t = Js.Ffi.constr "XPathResult"
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
  let result_type this = Js.Any.to_int (Js.Ffi.get this "resultType")
  let number_value this = Js.Any.to_float (Js.Ffi.get this "numberValue")
  let string_value this = Js.Any.to_string (Js.Ffi.get this "stringValue")
  let boolean_value this = Js.Any.to_bool (Js.Ffi.get this "booleanValue")

  let single_node_value this =
    (Js.Any.nullable_to_option Js.of_any) (Js.Ffi.get this "singleNodeValue")

  let invalid_iterator_state this =
    Js.Any.to_bool (Js.Ffi.get this "invalidIteratorState")

  let snapshot_length this = Js.Any.to_int (Js.Ffi.get this "snapshotLength")

  let iterate_next this =
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "iterateNext" [||])

  let snapshot_item ~index this =
    let index = Js.Any.of_int index in
    (Js.Any.nullable_to_option Js.of_any)
      (Js.Ffi.meth_call this "snapshotItem" [| index |])
end

and X_path_expression : sig
  type t = [ `X_path_expression ] Js.t

  val t : [ `X_path_expression ] Js.constr

  val evaluate :
    context_node:[ `Node ] Js.t ->
    ?type_:int ->
    ?result:[ `X_path_result ] Js.t option ->
    t ->
    [ `X_path_result ] Js.t
end = struct
  type t = [ `X_path_expression ] Js.t

  let t = Js.Ffi.constr "XPathExpression"

  let evaluate ~context_node ?type_ ?result this =
    let context_node = Js.to_any context_node in
    let type_ = (Js.Any.undefined_of_option Js.Any.of_int) type_ in
    let result =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) result
    in
    Js.of_any
      (Js.Ffi.meth_call this "evaluate" [| context_node; type_; result |])
end

and X_path_ns_resolver : sig
  type t = prefix:string option -> string option
end = struct end

and X_path_evaluator : sig
  type t = [ `X_path_evaluator ] Js.t

  val t : [ `X_path_evaluator ] Js.constr
  val make : unit -> t
end = struct
  type t = [ `X_path_evaluator ] Js.t

  let t = Js.Ffi.constr "XPathEvaluator"
  let make () = Js.Ffi.obj_new t [||]
end

and Xslt_processor : sig
  type t = [ `Xslt_processor ] Js.t

  val t : [ `Xslt_processor ] Js.constr
  val make : unit -> t
  val import_stylesheet : style:[ `Node ] Js.t -> t -> unit

  val transform_to_fragment :
    source:[ `Node ] Js.t ->
    output:[ `Document ] Js.t ->
    t ->
    [ `Document_fragment ] Js.t

  val transform_to_document : source:[ `Node ] Js.t -> t -> [ `Document ] Js.t

  val set_parameter :
    namespace_uri:string -> local_name:string -> value:Js.any -> t -> unit

  val get_parameter : namespace_uri:string -> local_name:string -> t -> Js.any
  val remove_parameter : namespace_uri:string -> local_name:string -> t -> unit
  val clear_parameters : t -> unit
  val reset : t -> unit
end = struct
  type t = [ `Xslt_processor ] Js.t

  let t = Js.Ffi.constr "XSLTProcessor"
  let make () = Js.Ffi.obj_new t [||]

  let import_stylesheet ~style this =
    let style = Js.to_any style in
    Js.to_unit (Js.Ffi.meth_call this "importStylesheet" [| style |])

  let transform_to_fragment ~source ~output this =
    let source = Js.to_any source in
    let output = Js.to_any output in
    Js.of_any (Js.Ffi.meth_call this "transformToFragment" [| source; output |])

  let transform_to_document ~source this =
    let source = Js.to_any source in
    Js.of_any (Js.Ffi.meth_call this "transformToDocument" [| source |])

  let set_parameter ~namespace_uri ~local_name ~value this =
    let namespace_uri = Js.Any.of_string namespace_uri in
    let local_name = Js.Any.of_string local_name in
    let value = Js.of_any value in
    Js.to_unit
      (Js.Ffi.meth_call this "setParameter"
         [| namespace_uri; local_name; value |]
      )

  let get_parameter ~namespace_uri ~local_name this =
    let namespace_uri = Js.Any.of_string namespace_uri in
    let local_name = Js.Any.of_string local_name in
    Js.to_any
      (Js.Ffi.meth_call this "getParameter" [| namespace_uri; local_name |])

  let remove_parameter ~namespace_uri ~local_name this =
    let namespace_uri = Js.Any.of_string namespace_uri in
    let local_name = Js.Any.of_string local_name in
    Js.to_unit
      (Js.Ffi.meth_call this "removeParameter" [| namespace_uri; local_name |])

  let clear_parameters this =
    Js.to_unit (Js.Ffi.meth_call this "clearParameters" [||])

  let reset this = Js.to_unit (Js.Ffi.meth_call this "reset" [||])
end
