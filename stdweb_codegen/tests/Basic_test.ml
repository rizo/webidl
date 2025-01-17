open Basic

let test_3 () = Jx.log "Basic"
let test_2 () = Types1.f6 (Cb1.make (fun a b -> "hello"))

let test_3 this =
  let _ = Node_list.filter_by_func (fun _node -> true) this in
  let _ =
    Node_list.filter_by_func_nullable
      (Jx.nullable (Node_filter.make (fun _node -> true)))
      this
  in
  let _ = Node_list.filter_by_name "div" this in
  let _ = Node_list.filter ~by:Jx.null this in
  let _ = Node_list.filter ~by:(Jx.string "div") this in
  ()

let test_5 this =
  Node_list.filter ~by:(Node_filter.make (fun _node -> true)) this

let test_6 this =
  Node_list.filter ~by:(Node_filter.make (fun _node -> true)) this

let test_7 this = Node_list.filter_by_func (fun _node -> true) this
let test_9 this = Node_list.filter_by_name "div" this
