module rec A : sig
  type t = [ `A ] Js.t

  val t : [ `A ] Js.constr
  val b1 : x:bool -> t -> unit
  val f1 : x:float -> t -> unit
  val s1 : x:string -> t -> unit
  val t1 : x:[ `T ] Js.t -> t -> unit
  val a1 : x:Js.any -> t -> unit
  val bn1 : x:bool option -> t -> unit
  val tn1 : x:[ `T ] Js.t option -> t -> unit
  val bo1 : ?x:bool -> t -> unit
  val bo2 : ?x:bool -> t -> unit
  val bo3 : ?x:bool option -> t -> unit
  val bo4 : ?x:bool option -> t -> unit
  val bo5 : ?x:bool option -> t -> unit
  val to1 : ?x:[ `T ] Js.t -> t -> unit
  val to2 : ?x:[ `T ] Js.t option -> t -> unit
  val to3 : ?x:[ `T ] Js.t option -> t -> unit
  val ao1 : ?x:Js.any -> t -> unit
  val ao2 : ?x:Js.any -> t -> unit
  val ao3 : ?x:Js.any -> t -> unit
  val ou1 : ?x:[ `Bool | `String ] Js.t -> t -> unit
  val ou2 : ?x:[ `Nullable of [ `Bool ] | `String ] Js.t -> t -> unit
  val ou3 : ?x:[ `Bool | `String ] Js.nullable -> t -> unit
  val ou4 : ?x:[ `Bool | `String ] Js.nullable -> t -> unit
  val ou5 : ?x:[ `Bool | `String ] Js.nullable -> t -> unit
end = struct
  type t = [ `A ] Js.t

  let t = Js.Ffi.constr "A"

  let b1 ~x this =
    let x = Js.Any.of_bool x in
    Js.to_unit (Js.Ffi.meth_call this "b1" [| x |])

  let f1 ~x this =
    let x = Js.Any.of_float x in
    Js.to_unit (Js.Ffi.meth_call this "f1" [| x |])

  let s1 ~x this =
    let x = Js.Any.of_string x in
    Js.to_unit (Js.Ffi.meth_call this "s1" [| x |])

  let t1 ~x this =
    let x = Js.to_any x in
    Js.to_unit (Js.Ffi.meth_call this "t1" [| x |])

  let a1 ~x this =
    let x = Js.of_any x in
    Js.to_unit (Js.Ffi.meth_call this "a1" [| x |])

  let bn1 ~x this =
    let x = (Js.Any.nullable_of_option Js.Any.of_bool) x in
    Js.to_unit (Js.Ffi.meth_call this "bn1" [| x |])

  let tn1 ~x this =
    let x = (Js.Any.nullable_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "tn1" [| x |])

  let bo1 ?x this =
    let x = (Js.Any.undefined_of_option Js.Any.of_bool) x in
    Js.to_unit (Js.Ffi.meth_call this "bo1" [| x |])

  let bo2 ?x this =
    let x = (Js.Any.undefined_of_option Js.Any.of_bool) x in
    Js.to_unit (Js.Ffi.meth_call this "bo2" [| x |])

  let bo3 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.Any.of_bool)) x
    in
    Js.to_unit (Js.Ffi.meth_call this "bo3" [| x |])

  let bo4 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.Any.of_bool)) x
    in
    Js.to_unit (Js.Ffi.meth_call this "bo4" [| x |])

  let bo5 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.Any.of_bool)) x
    in
    Js.to_unit (Js.Ffi.meth_call this "bo5" [| x |])

  let to1 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "to1" [| x |])

  let to2 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) x
    in
    Js.to_unit (Js.Ffi.meth_call this "to2" [| x |])

  let to3 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.to_any)) x
    in
    Js.to_unit (Js.Ffi.meth_call this "to3" [| x |])

  let ao1 ?x this =
    let x = (Js.Any.undefined_of_option Js.of_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ao1" [| x |])

  let ao2 ?x this =
    let x = (Js.Any.undefined_of_option Js.of_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ao2" [| x |])

  let ao3 ?x this =
    let x = (Js.Any.undefined_of_option Js.of_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ao3" [| x |])

  let ou1 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ou1" [| x |])

  let ou2 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ou2" [| x |])

  let ou3 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ou3" [| x |])

  let ou4 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ou4" [| x |])

  let ou5 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.Ffi.meth_call this "ou5" [| x |])
end
