module rec T : sig
  type nonrec t = float

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  T

and A : sig
  type t = [ `A ] Js.t
  [@@ocaml.doc
    "The type for the {{: https://developer.mozilla.org/en-US/docs/Web/API/A} \
     [A]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val b1 : x:bool -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/b1} [b1] on \
     MDN}."]

  val f1 : x:float -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/f1} [f1] on \
     MDN}."]

  val s1 : x:string -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/s1} [s1] on \
     MDN}."]

  val t1 : x:T.t -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/t1} [t1] on \
     MDN}."]

  val a1 : x:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/a1} [a1] on \
     MDN}."]

  val bn1 : x:bool option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/bn1} [bn1] on \
     MDN}."]

  val tn1 : x:T.t option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/tn1} [tn1] on \
     MDN}."]

  val bo1 : ?x:bool -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/bo1} [bo1] on \
     MDN}."]

  val bo2 : ?x:bool -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/bo2} [bo2] on \
     MDN}."]

  val bo3 : ?x:bool option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/bo3} [bo3] on \
     MDN}."]

  val bo4 : ?x:bool option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/bo4} [bo4] on \
     MDN}."]

  val bo5 : ?x:bool option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/bo5} [bo5] on \
     MDN}."]

  val to1 : ?x:T.t -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/to1} [to1] on \
     MDN}."]

  val to2 : ?x:T.t option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/to2} [to2] on \
     MDN}."]

  val to3 : ?x:T.t option -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/to3} [to3] on \
     MDN}."]

  val ao1 : ?x:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ao1} [ao1] on \
     MDN}."]

  val ao2 : ?x:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ao2} [ao2] on \
     MDN}."]

  val ao3 : ?x:Js.any -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ao3} [ao3] on \
     MDN}."]

  val ou1 : ?x:[< `Bool | `String ] Js.t -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ou1} [ou1] on \
     MDN}."]

  val ou2 : ?x:[< `Nullable of [ `Bool ] | `String ] Js.t -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ou2} [ou2] on \
     MDN}."]

  val ou3 : ?x:[< `Bool | `String ] Js.nullable -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ou3} [ou3] on \
     MDN}."]

  val ou4 : ?x:[< `Bool | `String ] Js.nullable -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ou4} [ou4] on \
     MDN}."]

  val ou5 : ?x:[< `Bool | `String ] Js.nullable -> t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A/ou5} [ou5] on \
     MDN}."]
end = struct
  type t = [ `A ] Js.t

  let t = Js.raw "A"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let b1 ~x this =
    let x = Js.Any.of_bool x in
    Js.to_unit (Js.meth_call this "b1" [| x |])

  let f1 ~x this =
    let x = Js.Any.of_float x in
    Js.to_unit (Js.meth_call this "f1" [| x |])

  let s1 ~x this =
    let x = Js.Any.of_string x in
    Js.to_unit (Js.meth_call this "s1" [| x |])

  let t1 ~x this =
    let x = T.to_any x in
    Js.to_unit (Js.meth_call this "t1" [| x |])

  let a1 ~x this =
    let x = Js.of_any x in
    Js.to_unit (Js.meth_call this "a1" [| x |])

  let bn1 ~x this =
    let x = (Js.Any.nullable_of_option Js.Any.of_bool) x in
    Js.to_unit (Js.meth_call this "bn1" [| x |])

  let tn1 ~x this =
    let x = (Js.Any.nullable_of_option T.to_any) x in
    Js.to_unit (Js.meth_call this "tn1" [| x |])

  let bo1 ?x this =
    let x = (Js.Any.undefined_of_option Js.Any.of_bool) x in
    Js.to_unit (Js.meth_call this "bo1" [| x |])

  let bo2 ?x this =
    let x = (Js.Any.undefined_of_option Js.Any.of_bool) x in
    Js.to_unit (Js.meth_call this "bo2" [| x |])

  let bo3 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.Any.of_bool)) x
    in
    Js.to_unit (Js.meth_call this "bo3" [| x |])

  let bo4 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.Any.of_bool)) x
    in
    Js.to_unit (Js.meth_call this "bo4" [| x |])

  let bo5 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option Js.Any.of_bool)) x
    in
    Js.to_unit (Js.meth_call this "bo5" [| x |])

  let to1 ?x this =
    let x = (Js.Any.undefined_of_option T.to_any) x in
    Js.to_unit (Js.meth_call this "to1" [| x |])

  let to2 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option T.to_any)) x
    in
    Js.to_unit (Js.meth_call this "to2" [| x |])

  let to3 ?x this =
    let x =
      (Js.Any.undefined_of_option (Js.Any.nullable_of_option T.to_any)) x
    in
    Js.to_unit (Js.meth_call this "to3" [| x |])

  let ao1 ?x this =
    let x = (Js.Any.undefined_of_option Js.of_any) x in
    Js.to_unit (Js.meth_call this "ao1" [| x |])

  let ao2 ?x this =
    let x = (Js.Any.undefined_of_option Js.of_any) x in
    Js.to_unit (Js.meth_call this "ao2" [| x |])

  let ao3 ?x this =
    let x = (Js.Any.undefined_of_option Js.of_any) x in
    Js.to_unit (Js.meth_call this "ao3" [| x |])

  let ou1 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.meth_call this "ou1" [| x |])

  let ou2 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.meth_call this "ou2" [| x |])

  let ou3 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.meth_call this "ou3" [| x |])

  let ou4 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.meth_call this "ou4" [| x |])

  let ou5 ?x this =
    let x = (Js.Any.undefined_of_option Js.to_any) x in
    Js.to_unit (Js.meth_call this "ou5" [| x |])
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/A} [A] on MDN}."]
