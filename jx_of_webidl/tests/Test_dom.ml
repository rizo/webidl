let () =
  Js.log "Starting";
  let document = Js.global "document" `Document in
  let root = Dom.Document.query_selector ~selectors:"#root" document in
  let root = Option.get root in
  let button = Dom.Document.create_element ~local_name:"button" document in
  let text = Dom.Document.create_text_node ~data:"Click!" document in
  ignore
    (Dom.Node.append_child
       ~node:(text |> Dom.Text.to_character_data |> Dom.Character_data.to_node)
       (Dom.Element.to_node button)
    );
  ignore
    (Dom.Node.append_child
       ~node:(button |> Dom.Element.to_node)
       (Dom.Element.to_node root)
    );
  Js.log button
