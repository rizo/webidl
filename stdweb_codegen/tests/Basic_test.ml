open Basic

let () = Jx.log "Basic"

let test_2 =
  Types1.f6 ~cb:(Cb1.make (fun _null_int _bool -> Jx.ascii "hello")) ()

let test_3 this =
  let _ =
    Node_list.filter_by_func
      ~func:(Node_filter.make (fun _node -> Jx.true'))
      this
  in
  let _ =
    Node_list.filter_by_func_nullable
      ~func:(Jx.nullable (Node_filter.make (fun _node -> Jx.true')))
      this
  in
  let _ = Node_list.filter_by_name ~name:(Jx.string "div") this in
  let _ = Node_list.filter ~by:Jx.null this in
  let _ = Node_list.filter ~by:(Jx.string "div") this in
  ()

let test_5 this =
  Node_list.filter
    ~by:(Jx.nullable (Node_filter.make (fun _node -> Jx.true')))
    this

let test_6_1 this =
  Node_list.filter
    ~by:(Jx.nullable (Node_filter.make (fun _node -> Jx.true')))
    this

let test_6_2 this = Node_list.filter ~by:(Jx.string "div") this

let test_7 this =
  Node_list.filter_by_func ~func:(Node_filter.make (fun _node -> Jx.true')) this

let test_9 this = Node_list.filter_by_name ~name:(Jx.string "div") this
let any () : [> ] Jx.obj = Obj.magic 0

let get_input_value doc =
  let el_null =
    Document.query_selector ~selectors:(Jx.ascii "#counter_input")
  in
  if not Jx.Nullable.is_null el_null then
    let el = Jx.Nullable.get el_null in
    let el = Jx.cast HtmlElement.t el in
    let value = HtmlElement.value el in
    Jx.Ml.string value

let () =
  begin
    Jx.log (test_5 (any ()));
    Jx.log (test_6_1 (any ()));
    Jx.log (test_6_2 (any ()));
    Jx.log (test_7 (any ()));
    Jx.log (test_9 (any ()))
  end
