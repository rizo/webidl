let document = Js.global "document" `Document

let _f () =
  let frag = Dom.Document.create_document_fragment document in
  let el = Dom.Document.create_element ~local_name:"div" document in
  let txt = Dom.Document.create_text_node ~data:"foo" document in
  let nodes = [| txt; el; frag |] in
  (* let err = [| txt; el; frag; Js.of_string "foo" |] in *)
  Dom.Document_fragment.append ~nodes frag

let mix_kinds () =
  let el1 = Dom.Document.create_element ~local_name:"h1" document in
  let text1 = Dom.Document.create_text_node ~data:"hello" document in
  let frag1 = Dom.Document.create_document_fragment document in
  [ el1; text1; frag1 ]

let call_parent_meth () =
  let el1 = Dom.Document.create_element ~local_name:"h1" document in
  let text1 = Dom.Document.create_text_node ~data:"hello" document in
  let frag1 = Dom.Document.create_document_fragment document in
  let _ok = Dom.Node.node_name el1 in
  let _ok = Dom.Node.node_name text1 in
  let _ok = Dom.Node.node_name frag1 in
  (* let _er = Dom.Node.node_name (Dom.Range.make ()) in *)
  ()

let frag_append_children () =
  let frag1 = Dom.Document.create_document_fragment document in
  let text1 = Dom.Document.create_text_node ~data:"hello" document in
  let text2 = Dom.Document.create_text_node ~data:"world" document in
  let el1 = Dom.Document.create_element ~local_name:"h1" document in
  ignore (Dom.Node.append_child ~node:text2 el1);
  let str1 = Js.of_string "test" in
  Dom.Document_fragment.append ~nodes:[| text1; el1 |] frag1;
  Dom.Document_fragment.append ~nodes:[| str1; str1 |] frag1;
  (* Dom.Document_fragment.append ~nodes:[| text1; el1; str1 |] frag1; *)
  (* Dom.Document_fragment.append ~nodes:[| text1; el1 |] el1; *)
  frag1

let () =
  Js.log "Starting";
  let root = Dom.Document.query_selector ~selectors:"#root" document in
  let root = Option.get root in
  let button = Dom.Document.create_element ~local_name:"button" document in
  let text = Dom.Document.create_text_node ~data:"Click!" document in
  ignore (Dom.Node.append_child ~node:text button);
  ignore (Dom.Node.append_child ~node:button root);
  Dom.Event_target.add_event_listener ~type':"click"
    ~callback:(Some (fun event -> Js.log event))
    button;
  Js.log button
