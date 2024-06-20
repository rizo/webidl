module T1 (Js : sig
  type +'a t

  val of_string : string -> [ `String ] t
end) (Dom : sig
  module Document : sig
    type t

    val t : t

    val create_element :
      local_name:string ->
      ?options:[ `String | `Element_creation_options ] Js.t ->
      t ->
      [< `Element | `Node ] Js.t

    val create_text_node : data:string -> t -> [< `Text | `Node ] Js.t
    val create_document_fragment : t -> [< `Document_fragment | `Node ] Js.t
  end

  module Node : sig
    val node_name : [ `Node ] Js.t -> string
    val append_child : node:[ `Node ] Js.t -> [ `Node ] Js.t -> [ `Node ] Js.t
  end

  module Document_fragment : sig
    val append :
      nodes:[< `Node | `Trusted_script | `String ] Js.t array ->
      [ `Document_fragment ] Js.t ->
      unit
  end

  module Range : sig
    val make : unit -> [> `Range ] Js.t
  end
end) =
struct
  let doc = Dom.Document.t

  let base_meths () =
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let _ok = Dom.Node.node_name el1 in
    let _ok = Dom.Node.node_name txt1 in
    (* let _no = Dom.Node.node_name (Dom.Range.make ()) in *)
    ()

  let union_arg () =
    let frag1 = Dom.Document.create_document_fragment doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let str1 = Js.of_string "foo" in
    let _ok = Dom.Document_fragment.append ~nodes:[||] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1 |] frag1 in
    (* let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1; str1 |] frag1 in *)
    (* let _no = Dom.Node.node_name (Dom.Range.make ()) in *)
    ()
end

module T2 (Js : sig
  type +'a t
  type 'kind constr = [ `Constr of 'kind ] t constraint 'kind = [> ]

  val of_string : string -> [ `String ] t
  val make : 'kind constr -> 'kind t
end) (Dom : sig
  module rec Event_target : sig
    type t = [ `Event_target ] Js.t

    val t : [< `Event_target ] Js.constr
    val make : unit -> [< `Event_target ] Js.t

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

    val dispatch_event : event:[> `Event ] Js.t -> t -> bool
  end

  and Event_listener : sig
    type t = event:[ `Event ] Js.t -> unit

    val to_js : t -> [ `Event_listener ] Js.t
  end

  and Node : sig
    type t = [ `Node ] Js.t

    val make : unit -> [< `Node | `Event_target ] Js.t
    val node_name : t -> string
    val append_child : node:t -> t -> [< `Node | `Event_target ] Js.t
  end

  and Document : sig
    type t = [ `Document ] Js.t

    val t : t

    val create_element :
      local_name:string ->
      ?options:[ `String | `Element_creation_options ] Js.t ->
      t ->
      [< `Element | `Node | `Event_listener ] Js.t

    val create_text_node :
      data:string -> t -> [< `Text | `Node | `Event_listener ] Js.t

    val create_document_fragment :
      t -> [< `Document_fragment | `Node | `Event_listener ] Js.t
  end

  and Text : sig
    type t = [ `Text ] Js.t

    val t : [< `Text | `Node | `Event_listener ] Js.constr
    val make : ?data:string -> unit -> [< `Text | `Node | `Event_listener ] Js.t
    val whole_text : t -> string
  end

  and Element : sig
    type t = [ `Element ] Js.t
    type 'base sub = ([< `Element | `Node | `Event_listener ] as 'base) Js.t

    val t : [< `Element | `Node | `Event_listener ] Js.constr
  end

  and Document_fragment : sig
    type t = [ `Document_fragment ] Js.t

    val append :
      nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  end

  module Range : sig
    type t = [ `Range ] Js.t

    val make : unit -> [< `Range ] Js.t
  end

  module Document_fragment_ext : sig
    val make :
      unit ->
      [< `Document_fragment_ext | `Document_fragment | `Node | `Event_listener ]
      Js.t
  end
end) =
struct
  let doc = Dom.Document.t

  let base_meths () =
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let txt3 = Js.make Dom.Text.t in
    let _ok = Dom.Node.node_name el1 in
    let _ok = Dom.Node.node_name txt1 in
    let _ok = Dom.Node.node_name txt2 in
    let _ok = Dom.Node.node_name txt3 in
    let _ok = Dom.Text.whole_text txt1 in
    let _ok = Dom.Text.whole_text txt2 in
    let _ok = Dom.Text.whole_text txt3 in
    (* Element is not a subtype of text *)
    (* let _no = Dom.Text.whole_text el1 in *)
    (* Node is not a subtype of range *)
    (* let _no = Dom.Node.node_name (Dom.Range.make ()) in *)
    ()

  let union_arg () =
    let frag1 = Dom.Document.create_document_fragment doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let txt3 = Js.make Dom.Text.t in
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let str1 = Js.of_string "foo" in
    let str2 = Js.of_string "bar" in
    let _ok = Dom.Document_fragment.append ~nodes:[||] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt3 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1; str2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1 |] frag1 in
    (* Mixing distinct tags *)
    (* let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1; str1 |] frag1 in *)
    ()

  let derived_frag () =
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let frag_ext1 = Dom.Document_fragment_ext.make () in
    let _ok = Dom.Node.node_name frag_ext1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1 |] frag_ext1 in
    ()
end

(* Ok *)
module T3 (Js : sig
  type +'a t
  type 'kind constr = [ `Constr of 'kind ] t constraint 'kind = [> ]

  val of_string : string -> [ `String ] t
  val of_int : int -> [ `Int ] t
  val make : 'kind constr -> 'kind t
end) (Dom : sig
  module Event : sig
    type t = [ `Event ] Js.t
  end

  module Event_listener : sig
    type t = event:Event.t -> unit

    val to_any : t -> [ `Any ] Js.t
  end

  module Event_target : sig
    type t = [ `Event_target ] Js.t

    val add_event_listener :
      type_:string ->
      callback:Event_listener.t option ->
      ?options:[ `Add_event_listener_options | `Bool ] Js.t ->
      t ->
      unit
  end

  module Node : sig
    type 'a super = ([< `Node | `Event_target ] as 'a) Js.t
    type t = [ `Node ] Js.t

    val node_name : t -> string
  end

  module Text : sig
    type 'a super = ([< `Text | `Node | `Event_target ] as 'a) Js.t
    (* The type that can be converted into Text's super class. *)

    type t = [ `Text ] Js.t

    val to_super : t -> 'a super
    val make : ?data:string -> unit -> 'a super
    val whole_text : t -> string
  end

  module Element : sig
    type 'a super = ([< `Element | `Node | `Event_target ] as 'a) Js.t
    type t = [ `Element ] Js.t
  end

  module Document_fragment : sig
    type 'a super = ([< `Document_fragment | `Node | `Event_target ] as 'a) Js.t
    type t = [ `Document_fragment ] Js.t

    val append :
      nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  end

  module Document : sig
    type t = [ `Document ] Js.t

    val create_element :
      local_name:string ->
      ?options:[< `String | `Element_creation_options ] Js.t ->
      t ->
      'element Element.super

    val create_text_node : data:string -> t -> 'text Text.super

    val create_document_fragment :
      t -> 'document_fragment Document_fragment.super
  end

  module Element_creation_options : sig
    type t = [ `Element_creation_options ] Js.t

    val make : ?is:string -> unit -> t
    val is : t -> string option
  end

  val document : Document.t
end) =
struct
  let doc = Dom.document

  let base_meths () =
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let _ok = Dom.Node.node_name el1 in
    let _ok = Dom.Node.node_name txt1 in
    let _ok = Dom.Node.node_name txt2 in
    let _ok = Dom.Text.whole_text txt1 in
    let _ok = Dom.Text.whole_text txt2 in
    (* Element is not a subtype of text *)
    (* let _no = Dom.Text.whole_text el1 in *)
    (* Node is not a subtype of range *)
    (* let _no = Dom.Node.node_name (Dom.Range.make ()) in *)
    ()

  let union_arg_1 () =
    let frag1 = Dom.Document.create_document_fragment doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let str1 = Js.of_string "foo" in
    let str2 = Js.of_string "bar" in
    let _ok = Dom.Document_fragment.append ~nodes:[||] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1; str2 |] frag1 in
    (* let _ok = Dom.Document_fragment.append ~nodes:[| doc |] frag1 in *)
    (* Mixing distinct tags *)
    (* let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1; str1 |] frag1 in *)
    ()

  let union_arg_2 () =
    let _ok =
      Dom.Document.create_element ~options:(Js.of_string "str1")
        ~local_name:"div" doc
    in
    let _ok =
      Dom.Document.create_element
        ~options:(Dom.Element_creation_options.make ~is:"foo" ())
        ~local_name:"div" doc
    in
    (* let _no =
         Dom.Document.create_element ~options:(Js.of_int 42) ~local_name:"div" doc
       in *)
    ()
end

(* https://github.com/reasonml-community/bs-webapi-incubator/pull/23 *)
module T4 (M : sig
  type 'a node_like
  type node = unit node_like
  type 'a element_tag
  type 'a element_like = 'a element_tag node_like
  type element = unit element_like
  type htmlElement_tag
  type htmlElement = htmlElement_tag element_like
end) =
struct end

module T5 (Js : sig
  type +'a t
end) (M : sig
  module Node : sig
    type tag = [ `Node ]
    type 'a t = ([< tag ] as 'a) Js.t
  end

  module Element : sig
    type tag = [ `Element | Node.tag ]
    type 'a t = ([< tag ] as 'a) Js.t
  end

  module Html_element : sig
    type tag = [ `Html_element | Element.tag ]
    type 'a t = ([< tag ] as 'a) Js.t
  end
end) =
struct end

module T6 (Js : sig
  type +'a t = [> ] as 'a

  val of_string : string -> [ `String ] t
  val of_int : int -> [ `Int ] t
end) (Dom : sig
  module Event_target : sig
    type super = [ `Event_target ]
    type 'a like = ([> super ] as 'a) Js.t
    type 'a t = ([< super ] as 'a) Js.t
  end

  module Node : sig
    type super = [ `Node | Event_target.super ]
    type 'a like = ([> super ] as 'a) Js.t
    type 'a t = ([< super ] as 'a) Js.t

    val node_name : 'a like -> string
  end

  module Text : sig
    type super = [ `Text | Node.super ]
    type 'a like = ([> super ] as 'a) Js.t
    type 'a t = ([< super ] as 'a) Js.t

    val make : ?data:string -> unit -> [< super ] Js.t
    val whole_text : 'a like -> string
  end

  module Element : sig
    type super = [ `Element | Node.super ]
    type 'a like = ([> super ] as 'a) Js.t
    type 'a t = ([< super ] as 'a) Js.t
  end

  module Document_fragment : sig
    type super = [ `Document_fragment | Node.super ]
    type 'a like = ([> super ] as 'a) Js.t
    type 'a t = ([< super ] as 'a) Js.t

    val append :
      nodes:[< `Node | `Trusted_script | `String ] Js.t array -> 'a like -> unit
  end

  module Document : sig
    type super = [ `Document_fragment | Node.super ]
    type 'a like = ([> super ] as 'a) Js.t
    type 'a t = ([< super ] as 'a) Js.t

    val create_element :
      local_name:string ->
      ?options:[< `String | `Element_creation_options ] Js.t ->
      'doc_base t ->
      'el_base Element.t

    val create_text_node : data:string -> 'doc_base t -> 'text_base Text.t
    val create_document_fragment : 'doc_base t -> 'frag_base Document_fragment.t
  end

  val document : 'base Document.t
end) =
struct
  let doc = Dom.document

  let base_meths () =
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let _ok = Dom.Node.node_name el1 in
    let _ok = Dom.Node.node_name txt1 in
    let _ok = Dom.Node.node_name txt2 in
    let _ok = Dom.Text.whole_text txt1 in
    let _ok = Dom.Text.whole_text txt2 in
    (* Element is not a subtype of text *)
    (* let _no = Dom.Text.whole_text el1 in *)
    (* Node is not a subtype of range *)
    (* let _no = Dom.Node.node_name (Dom.Range.make ()) in *)
    ()

  let union_arg_1 () =
    let frag1 = Dom.Document.create_document_fragment doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let str1 = Js.of_string "foo" in
    let str2 = Js.of_string "bar" in
    let _ok = Dom.Document_fragment.append ~nodes:[||] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1; str2 |] frag1 in
    (* let _ok = Dom.Document_fragment.append ~nodes:[| doc |] frag1 in *)
    (* Mixing distinct tags *)
    (* let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1; str1 |] frag1 in *)
    ()
end

(* Ok *)
module T7 (Js : sig
  type +'a t
  type 'kind constr = [ `Constr of 'kind ] t constraint 'kind = [> ]

  val of_string : string -> [ `String ] t
  val of_int : int -> [ `Int ] t
  val make : 'kind constr -> 'kind t
end) (Dom : sig
  module Event : sig
    type super = [ `Event | `Any ]
    type t = [ `Event ] Js.t
  end

  module Event_listener : sig
    type t = event:Event.t -> unit

    val to_any : t -> [ `Any ] Js.t
  end

  module Event_target : sig
    type super = [ `Event_target ]
    type t = [ `Event_target ] Js.t

    val add_event_listener :
      type_:string ->
      callback:Event_listener.t option ->
      ?options:[ `Add_event_listener_options | `Bool ] Js.t ->
      t ->
      unit
  end

  module Node : sig
    type super = [ `Node | Event_target.super ]
    type t = [ `Node ] Js.t

    val node_name : t -> string
  end

  module Text : sig
    type super = [ `Text | Node.super ]
    type t = [ `Text ] Js.t

    val super : t -> [< super ] Js.t
    val make : ?data:string -> unit -> [< super ] Js.t
    val whole_text : t -> string
  end

  module Element : sig
    type super = [ `Element | Node.super ]
    type t = [ `Element ] Js.t
  end

  module Document_fragment : sig
    type super = [ `Document_fragment | Node.super ]
    type t = [ `Document_fragment ] Js.t

    val append :
      nodes:[< `Node | `Trusted_script | `String ] Js.t array -> t -> unit
  end

  module Document : sig
    type t = [ `Document ] Js.t

    val create_element :
      local_name:string ->
      ?options:[< `String | `Element_creation_options ] Js.t ->
      t ->
      [< Element.super ] Js.t

    val create_text_node : data:string -> t -> [< Text.super ] Js.t
    val create_document_fragment : t -> [< Document_fragment.super ] Js.t
  end

  module Element_creation_options : sig
    type t = [ `Element_creation_options ] Js.t

    val make : ?is:string -> unit -> t
    val is : t -> string option
  end

  val document : Document.t
end) =
struct
  let doc = Dom.document

  let base_meths () =
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let _ok = Dom.Node.node_name el1 in
    let _ok = Dom.Node.node_name txt1 in
    let _ok = Dom.Node.node_name txt2 in
    let _ok = Dom.Text.whole_text txt1 in
    let _ok = Dom.Text.whole_text txt2 in
    (* Element is not a subtype of text *)
    (* let _no = Dom.Text.whole_text el1 in *)
    (* Node is not a subtype of range *)
    (* let _no = Dom.Node.node_name (Dom.Range.make ()) in *)
    ()

  let union_arg_1 () =
    let frag1 = Dom.Document.create_document_fragment doc in
    let txt1 = Dom.Document.create_text_node ~data:"a" doc in
    let txt2 = Dom.Text.make () in
    let el1 = Dom.Document.create_element ~local_name:"div" doc in
    let str1 = Js.of_string "foo" in
    let str2 = Js.of_string "bar" in
    let _ok = Dom.Document_fragment.append ~nodes:[||] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| txt1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt2 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1 |] frag1 in
    let _ok = Dom.Document_fragment.append ~nodes:[| str1; str2 |] frag1 in
    (* let _ok = Dom.Document_fragment.append ~nodes:[| doc |] frag1 in *)
    (* Mixing distinct tags *)
    (* let _ok = Dom.Document_fragment.append ~nodes:[| el1; txt1; str1 |] frag1 in *)
    ()

  let union_arg_2 () =
    let _ok =
      Dom.Document.create_element ~options:(Js.of_string "str1")
        ~local_name:"div" doc
    in
    let _ok =
      Dom.Document.create_element
        ~options:(Dom.Element_creation_options.make ~is:"foo" ())
        ~local_name:"div" doc
    in
    (* let _no =
         Dom.Document.create_element ~options:(Js.of_int 42) ~local_name:"div" doc
       in *)
    ()
end
