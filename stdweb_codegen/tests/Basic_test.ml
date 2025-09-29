open Basic

let () = Jx.log "Basic"

let test_2 =
  Types1.f6 ~cb:(Cb1.make (fun _null_int _bool -> Jx.ascii "hello")) ()

let test_3 this =
  let _ =
    Node_list.filter_by_func ~func:(Node_filter.make (fun _node -> true)) this
  in
  let _ =
    Node_list.filter_by_func_nullable
      ~func:(Jx.nullable (Node_filter.make (fun _node -> true)))
      this
  in
  let _ = Node_list.filter_by_name ~name:(Jx.string "div") this in
  let _ = Node_list.filter ~by:Jx.null this in
  let _ = Node_list.filter ~by:(Jx.string "div") this in
  ()

let test_5 this =
  Node_list.filter ~by:(Jx.nullable (Node_filter.make (fun _node -> true))) this

let test_6_1 this =
  Node_list.filter ~by:(Jx.nullable (Node_filter.make (fun _node -> true))) this

let test_6_2 this = Node_list.filter ~by:(Jx.string "div") this

let test_7 this =
  Node_list.filter_by_func ~func:(Node_filter.make (fun _node -> true)) this

let test_9 this = Node_list.filter_by_name ~name:(Jx.string "div") this
let any () : [> ] Jx.obj = Obj.magic 0

let () =
  begin
    Jx.log (test_5 (any ()));
    Jx.log (test_6_1 (any ()));
    Jx.log (test_6_2 (any ()));
    Jx.log (test_7 (any ()));
    Jx.log (test_9 (any ()))
  end
