module rec A : sig
  type t = [ `A ] Js.t

  val f0 : arg1:bool -> arg2:string -> arg3:float -> t -> unit
  val f1 : arg:[ `Bool | `String ] Js.t -> t -> unit
  val f2 : arg1:[ `Node | `Bool | `String ] Js.t -> arg2:float -> t -> unit

  val f3 :
    arg1:[ `Node | `Bool | `String ] Js.nullable ->
    arg2:float ->
    arg3:[ `Bool | `Float ] Js.t ->
    t ->
    unit

  val f4 : arg:[ `Node | `Nullable of [ `Bool ] | `String ] Js.t -> t -> unit
end = struct
  type t = [ `A ] Js.t

  let f0 ~arg1 ~arg2 ~arg3 this =
    let arg1 = Js.Any.of_bool arg1 in
    let arg2 = Js.Any.of_string arg2 in
    let arg3 = Js.Any.of_float arg3 in
    Js.to_unit (Js.Ffi.meth_call this "f0" [| arg1; arg2; arg3 |])

  let f1 ~arg this =
    let arg = Js.to_any arg in
    Js.to_unit (Js.Ffi.meth_call this "f1" [| arg |])

  let f2 ~arg1 ~arg2 this =
    let arg1 = Js.to_any arg1 in
    let arg2 = Js.Any.of_float arg2 in
    Js.to_unit (Js.Ffi.meth_call this "f2" [| arg1; arg2 |])

  let f3 ~arg1 ~arg2 ~arg3 this =
    let arg1 = Js.to_any arg1 in
    let arg2 = Js.Any.of_float arg2 in
    let arg3 = Js.to_any arg3 in
    Js.to_unit (Js.Ffi.meth_call this "f3" [| arg1; arg2; arg3 |])

  let f4 ~arg this =
    let arg = Js.to_any arg in
    Js.to_unit (Js.Ffi.meth_call this "f4" [| arg |])
end

and Node : sig
  type t = [ `Node ] Js.t
end = struct
  type t = [ `Node ] Js.t
end
