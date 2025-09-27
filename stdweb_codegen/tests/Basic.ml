open struct
  module E_jx = Jx.Encode
  module D_jx = Jx.Decode
end

module rec T1 : sig
  type t = [ `T1 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `T1 ] Jx.obj

  let t = Jx.expr "T1"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and Types1 : sig
  type t = [ `Types1 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val u1 : t -> unit
  val set_u1 : t -> unit -> unit
  val obj1 : t -> [> ] Jx.obj
  val set_obj1 : t -> [> ] Jx.obj -> unit
  val a1 : t -> Jx.any
  val set_a1 : t -> Jx.any -> unit
  val bl1 : t -> Jx.boolean
  val set_bl1 : t -> Jx.boolean -> unit
  val bt1 : t -> char
  val set_bt1 : t -> char -> unit
  val oc1 : t -> char
  val set_oc1 : t -> char -> unit
  val n1 : t -> Jx.number
  val set_n1 : t -> Jx.number -> unit
  val n2 : t -> Jx.number
  val set_n2 : t -> Jx.number -> unit
  val n3 : t -> Jx.number
  val set_n3 : t -> Jx.number -> unit
  val n4 : t -> Jx.number
  val set_n4 : t -> Jx.number -> unit
  val n5 : t -> Jx.number
  val set_n5 : t -> Jx.number -> unit
  val n6 : t -> Jx.number
  val set_n6 : t -> Jx.number -> unit
  val n7 : t -> Jx.number
  val set_n7 : t -> Jx.number -> unit
  val n8 : t -> Jx.number
  val set_n8 : t -> Jx.number -> unit
  val n9 : t -> Jx.number
  val set_n9 : t -> Jx.number -> unit
  val bi1 : t -> Jx.bigint
  val set_bi1 : t -> Jx.bigint -> unit
  val s1 : t -> Jx.string
  val set_s1 : t -> Jx.string -> unit
  val s2 : t -> Jx.string
  val set_s2 : t -> Jx.string -> unit
  val s3 : t -> Jx.string
  val set_s3 : t -> Jx.string -> unit
  val sy1 : t -> Jx.symbol
  val set_sy1 : t -> Jx.symbol -> unit
  val c1 : t -> T1.t
  val set_c1 : t -> T1.t -> unit
  val c2 : t -> T2.t
  val set_c2 : t -> T2.t -> unit
  val nul1 : t -> [> ] Jx.obj Jx.nullable
  val set_nul1 : t -> [> ] Jx.obj Jx.nullable -> unit
  val nul2 : t -> Jx.number Jx.nullable
  val set_nul2 : t -> Jx.number Jx.nullable -> unit
  val nul3 : t -> Jx.number Jx.nullable
  val set_nul3 : t -> Jx.number Jx.nullable -> unit
  val nul4 : t -> Jx.bigint Jx.nullable
  val set_nul4 : t -> Jx.bigint Jx.nullable -> unit
  val nul5 : t -> Jx.string Jx.nullable
  val set_nul5 : t -> Jx.string Jx.nullable -> unit
  val nul6 : t -> T1.t Jx.nullable
  val set_nul6 : t -> T1.t Jx.nullable -> unit
  val s2 : t -> Jx.number Jx.promise Jx.array
  val set_s2 : t -> Jx.number Jx.promise Jx.array -> unit
  val s3 : t -> Jx.string Jx.promise Jx.array
  val set_s3 : t -> Jx.string Jx.promise Jx.array -> unit
  val r1 : t -> Jx.number Jx.dict
  val set_r1 : t -> Jx.number Jx.dict -> unit
  val r2 : t -> Jx.boolean Jx.promise Jx.array Jx.dict
  val set_r2 : t -> Jx.boolean Jx.promise Jx.array Jx.dict -> unit
  val p1 : t -> Jx.number Jx.promise
  val set_p1 : t -> Jx.number Jx.promise -> unit
  val p2 : t -> Jx.number Jx.promise
  val set_p2 : t -> Jx.number Jx.promise -> unit
  val p3 : t -> unit Jx.promise
  val set_p3 : t -> unit Jx.promise -> unit
  val p4 : t -> Jx.number Jx.array Jx.promise
  val set_p4 : t -> Jx.number Jx.array Jx.promise -> unit
  val p5 : t -> Jx.number Jx.promise Jx.promise
  val set_p5 : t -> Jx.number Jx.promise Jx.promise -> unit
  val fa1 : t -> Jx.number Jx.array
  val set_fa1 : t -> Jx.number Jx.array -> unit
  val cb1 : t -> Cb1.t
  val set_cb1 : t -> Cb1.t -> unit
  val u1 : t -> [< `Number ] Jx.obj
  val set_u1 : t -> [< `Number ] Jx.obj -> unit
  val u2 : t -> [< `Number ] Jx.obj
  val set_u2 : t -> [< `Number ] Jx.obj -> unit
  val u3 : t -> [< `Number | `String ] Jx.obj
  val set_u3 : t -> [< `Number | `String ] Jx.obj -> unit
  val u4 : t -> [< `Number | `String ] Jx.obj
  val set_u4 : t -> [< `Number | `String ] Jx.obj -> unit
  val u5 : t -> [< `Array | `Number ] Jx.obj
  val set_u5 : t -> [< `Array | `Number ] Jx.obj -> unit
  val u6 : t -> [< `Array | `Number | `String ] Jx.obj
  val set_u6 : t -> [< `Array | `Number | `String ] Jx.obj -> unit
  val u7 : t -> [< `Cb1 | `Number ] Jx.obj
  val set_u7 : t -> [< `Cb1 | `Number ] Jx.obj -> unit
  val f1 : unit -> unit
  val f2 : unit -> Jx.any
  val f3 : a:Jx.number -> b:Jx.number -> c:Jx.number -> unit -> Jx.any
  val f4 : a:Jx.boolean -> b:Jx.string Jx.promise Jx.array -> unit -> Jx.any
  val f5 : x:Jx.number Jx.array -> unit -> Jx.number Jx.promise
  val f6 : cb:Cb1.t -> unit -> Jx.any
  val f7 : cb:Cb1.t Jx.nullable -> unit -> Jx.any
  val f8 : a:[< `Boolean | `Cb1 ] Jx.obj -> unit -> Jx.any
  val f9 : a:[< `Nullable of [ `Cb1 ] | `String ] Jx.obj -> unit -> Jx.any
  val f10 : unit -> Cb1.t
end = struct
  type t = [ `Types1 ] Jx.obj

  let t = Jx.expr "Types1"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let u1 this = D_jx.unit (Jx.get this "u1")
  let set_u1 this = fun x -> Jx.set this "u1" (E_jx.unit x)
  let obj1 this = D_jx.obj (Jx.get this "obj1")
  let set_obj1 this = fun x -> Jx.set this "obj1" (E_jx.obj x)
  let a1 this = D_jx.obj (Jx.get this "a1")
  let set_a1 this = fun x -> Jx.set this "a1" (E_jx.obj x)
  let bl1 this = D_jx.obj (Jx.get this "bl1")
  let set_bl1 this = fun x -> Jx.set this "bl1" (E_jx.obj x)
  let bt1 this = D_jx.char (Jx.get this "bt1")
  let set_bt1 this = fun x -> Jx.set this "bt1" (E_jx.char x)
  let oc1 this = D_jx.char (Jx.get this "oc1")
  let set_oc1 this = fun x -> Jx.set this "oc1" (E_jx.char x)
  let n1 this = D_jx.obj (Jx.get this "n1")
  let set_n1 this = fun x -> Jx.set this "n1" (E_jx.obj x)
  let n2 this = D_jx.obj (Jx.get this "n2")
  let set_n2 this = fun x -> Jx.set this "n2" (E_jx.obj x)
  let n3 this = D_jx.obj (Jx.get this "n3")
  let set_n3 this = fun x -> Jx.set this "n3" (E_jx.obj x)
  let n4 this = D_jx.obj (Jx.get this "n4")
  let set_n4 this = fun x -> Jx.set this "n4" (E_jx.obj x)
  let n5 this = D_jx.obj (Jx.get this "n5")
  let set_n5 this = fun x -> Jx.set this "n5" (E_jx.obj x)
  let n6 this = D_jx.obj (Jx.get this "n6")
  let set_n6 this = fun x -> Jx.set this "n6" (E_jx.obj x)
  let n7 this = D_jx.obj (Jx.get this "n7")
  let set_n7 this = fun x -> Jx.set this "n7" (E_jx.obj x)
  let n8 this = D_jx.obj (Jx.get this "n8")
  let set_n8 this = fun x -> Jx.set this "n8" (E_jx.obj x)
  let n9 this = D_jx.obj (Jx.get this "n9")
  let set_n9 this = fun x -> Jx.set this "n9" (E_jx.obj x)
  let bi1 this = D_jx.obj (Jx.get this "bi1")
  let set_bi1 this = fun x -> Jx.set this "bi1" (E_jx.obj x)
  let s1 this = D_jx.obj (Jx.get this "s1")
  let set_s1 this = fun x -> Jx.set this "s1" (E_jx.obj x)
  let s2 this = D_jx.obj (Jx.get this "s2")
  let set_s2 this = fun x -> Jx.set this "s2" (E_jx.obj x)
  let s3 this = D_jx.obj (Jx.get this "s3")
  let set_s3 this = fun x -> Jx.set this "s3" (E_jx.obj x)
  let sy1 this = D_jx.obj (Jx.get this "sy1")
  let set_sy1 this = fun x -> Jx.set this "sy1" (E_jx.obj x)
  let c1 this = T1.of_any (Jx.get this "c1")
  let set_c1 this = fun x -> Jx.set this "c1" (T1.to_any x)
  let c2 this = T2.of_any (Jx.get this "c2")
  let set_c2 this = fun x -> Jx.set this "c2" (T2.to_any x)
  let nul1 this = D_jx.obj (Jx.get this "nul1")
  let set_nul1 this = fun x -> Jx.set this "nul1" (E_jx.obj x)
  let nul2 this = D_jx.obj (Jx.get this "nul2")
  let set_nul2 this = fun x -> Jx.set this "nul2" (E_jx.obj x)
  let nul3 this = D_jx.obj (Jx.get this "nul3")
  let set_nul3 this = fun x -> Jx.set this "nul3" (E_jx.obj x)
  let nul4 this = D_jx.obj (Jx.get this "nul4")
  let set_nul4 this = fun x -> Jx.set this "nul4" (E_jx.obj x)
  let nul5 this = D_jx.obj (Jx.get this "nul5")
  let set_nul5 this = fun x -> Jx.set this "nul5" (E_jx.obj x)
  let nul6 this = D_jx.obj (Jx.get this "nul6")
  let set_nul6 this = fun x -> Jx.set this "nul6" (E_jx.obj x)
  let s2 this = D_jx.obj (Jx.get this "s2")
  let set_s2 this = fun x -> Jx.set this "s2" (E_jx.obj x)
  let s3 this = D_jx.obj (Jx.get this "s3")
  let set_s3 this = fun x -> Jx.set this "s3" (E_jx.obj x)
  let r1 this = D_jx.obj (Jx.get this "r1")
  let set_r1 this = fun x -> Jx.set this "r1" (E_jx.obj x)
  let r2 this = D_jx.obj (Jx.get this "r2")
  let set_r2 this = fun x -> Jx.set this "r2" (E_jx.obj x)
  let p1 this = D_jx.obj (Jx.get this "p1")
  let set_p1 this = fun x -> Jx.set this "p1" (E_jx.obj x)
  let p2 this = D_jx.obj (Jx.get this "p2")
  let set_p2 this = fun x -> Jx.set this "p2" (E_jx.obj x)
  let p3 this = D_jx.obj (Jx.get this "p3")
  let set_p3 this = fun x -> Jx.set this "p3" (E_jx.obj x)
  let p4 this = D_jx.obj (Jx.get this "p4")
  let set_p4 this = fun x -> Jx.set this "p4" (E_jx.obj x)
  let p5 this = D_jx.obj (Jx.get this "p5")
  let set_p5 this = fun x -> Jx.set this "p5" (E_jx.obj x)
  let fa1 this = D_jx.obj (Jx.get this "fa1")
  let set_fa1 this = fun x -> Jx.set this "fa1" (E_jx.obj x)
  let cb1 this = Cb1.of_any (Jx.get this "cb1")
  let set_cb1 this = fun x -> Jx.set this "cb1" (Cb1.to_any x)
  let u1 this = D_jx.obj (Jx.get this "u1")
  let set_u1 this = fun x -> Jx.set this "u1" (E_jx.obj x)
  let u2 this = D_jx.obj (Jx.get this "u2")
  let set_u2 this = fun x -> Jx.set this "u2" (E_jx.obj x)
  let u3 this = D_jx.obj (Jx.get this "u3")
  let set_u3 this = fun x -> Jx.set this "u3" (E_jx.obj x)
  let u4 this = D_jx.obj (Jx.get this "u4")
  let set_u4 this = fun x -> Jx.set this "u4" (E_jx.obj x)
  let u5 this = D_jx.obj (Jx.get this "u5")
  let set_u5 this = fun x -> Jx.set this "u5" (E_jx.obj x)
  let u6 this = D_jx.obj (Jx.get this "u6")
  let set_u6 this = fun x -> Jx.set this "u6" (E_jx.obj x)
  let u7 this = D_jx.obj (Jx.get this "u7")
  let set_u7 this = fun x -> Jx.set this "u7" (E_jx.obj x)
  let f1 () = D_jx.unit (D_jx.meth t "f1" [||])
  let f2 () = D_jx.obj (D_jx.meth t "f2" [||])

  let f3 ~a =
   fun ~b ->
    fun ~c ->
     fun () ->
      let a = E_jx.obj a in
      let b = E_jx.obj b in
      let c = E_jx.obj c in
      D_jx.obj (D_jx.meth t "f3" [| a; b; c |])

  let f4 ~a =
   fun ~b ->
    fun () ->
     let a = E_jx.obj a in
     let b = E_jx.obj b in
     D_jx.obj (D_jx.meth t "f4" [| a; b |])

  let f5 ~x =
   fun () ->
    let x = E_jx.obj x in
    D_jx.obj (D_jx.meth t "f5" [| x |])

  let f6 ~cb =
   fun () ->
    let cb = Cb1.to_any cb in
    D_jx.obj (D_jx.meth t "f6" [| cb |])

  let f7 ~cb =
   fun () ->
    let cb = E_jx.obj cb in
    D_jx.obj (D_jx.meth t "f7" [| cb |])

  let f8 ~a =
   fun () ->
    let a = E_jx.obj a in
    D_jx.obj (D_jx.meth t "f8" [| a |])

  let f9 ~a =
   fun () ->
    let a = E_jx.obj a in
    D_jx.obj (D_jx.meth t "f9" [| a |])

  let f10 () = Cb1.of_any (D_jx.meth t "f10" [||])
end

and T2 : sig
  type t = [ `T2 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `T2 ] Jx.obj

  let t = Jx.expr "T2"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and Cb1 : sig
  type t = [ `Cb1 ] Jx.obj

  val make : (Jx.number Jx.nullable -> Jx.boolean -> Jx.string) -> t
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Cb1 ] Jx.obj

  let make f = D_jx.obj (E_jx.func 1 f)
  let of_any any = D_jx.obj any
  (* let __func = D_jx.func any in *)
  (* fun a b -> *)
  (*   let a = Jx.Nullable.to_any E_jx.int a in *)
  (*   let b = E_jx.bool b in *)
  (*   D_jx.string (__func [| a; b |]) *)

  let to_any = E_jx.obj
end

and Attr1 : sig
  type t = [ `Attr1 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val a1 : t -> Jx.number
  val set_a1 : t -> Jx.number -> unit
  val a2 : t -> Jx.number
  val set_a2 : t -> Jx.number -> unit
  val a3 : t -> Jx.boolean
  val set_a3 : t -> Jx.boolean -> unit
  val a4 : t -> Jx.string
  val set_a4 : t -> Jx.string -> unit
  val a5 : t -> Attr2.t
  val set_a5 : t -> Attr2.t -> unit
  val a6 : t -> Attr3.t Jx.nullable
  val set_a6 : t -> Attr3.t Jx.nullable -> unit
  val a7 : t -> Jx.string Jx.array
  val set_a7 : t -> Jx.string Jx.array -> unit
end = struct
  type t = [ `Attr1 ] Jx.obj

  let t = Jx.expr "Attr1"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let a1 this = D_jx.obj (Jx.get this "a1")
  let set_a1 this = fun x -> Jx.set this "a1" (E_jx.obj x)
  let a2 this = D_jx.obj (Jx.get this "a2")
  let set_a2 this = fun x -> Jx.set this "a2" (E_jx.obj x)
  let a3 this = D_jx.obj (Jx.get this "a3")
  let set_a3 this = fun x -> Jx.set this "a3" (E_jx.obj x)
  let a4 this = D_jx.obj (Jx.get this "a4")
  let set_a4 this = fun x -> Jx.set this "a4" (E_jx.obj x)
  let a5 this = Attr2.of_any (Jx.get this "a5")
  let set_a5 this = fun x -> Jx.set this "a5" (Attr2.to_any x)
  let a6 this = D_jx.obj (Jx.get this "a6")
  let set_a6 this = fun x -> Jx.set this "a6" (E_jx.obj x)
  let a7 this = D_jx.obj (Jx.get this "a7")
  let set_a7 this = fun x -> Jx.set this "a7" (E_jx.obj x)
end

and Attr2 : sig
  type t = [ `Attr2 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Attr2 ] Jx.obj

  let t = Jx.expr "Attr2"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and Attr3 : sig
  type t = [ `Attr3 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Attr3 ] Jx.obj

  let t = Jx.expr "Attr3"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and Ops1 : sig
  type t = [ `Ops1 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val f1 : t -> Jx.number
  val f2 : x:Jx.number -> y:Jx.number -> t -> Jx.number
  val f3 : x:T1.t -> t -> T1.t
  val f4 : t -> unit

  val f5 :
    x:Jx.string -> y:Jx.boolean -> ?a:Jx.string -> ?b:Jx.boolean -> t -> unit
end = struct
  type t = [ `Ops1 ] Jx.obj

  let t = Jx.expr "Ops1"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let f1 this = D_jx.obj (D_jx.meth this "f1" [||])

  let f2 ~x =
   fun ~y ->
    fun this ->
     let x = E_jx.obj x in
     let y = E_jx.obj y in
     D_jx.obj (D_jx.meth this "f2" [| x; y |])

  let f3 ~x =
   fun this ->
    let x = T1.to_any x in
    T1.of_any (D_jx.meth this "f3" [| x |])

  let f4 this = D_jx.unit (D_jx.meth this "f4" [||])

  let f5 ~x =
   fun ~y ->
    fun ?a ->
     fun ?b ->
      fun this ->
       let x = E_jx.obj x in
       let y = E_jx.obj y in
       let a = E_jx.undefined E_jx.obj a in
       let b = E_jx.undefined E_jx.obj b in
       D_jx.unit (D_jx.meth this "f5" [| x; y; a; b |])
end

and A3 : sig
  type t = [ `A3 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val event1 : t -> A_callback.t
  val set_event1 : t -> A_callback.t -> unit
  val event2 : t -> A_callback.t Jx.nullable
  val set_event2 : t -> A_callback.t Jx.nullable -> unit
end = struct
  type t = [ `A3 ] Jx.obj

  let t = Jx.expr "A3"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let event1 this = A_callback.of_any (Jx.get this "event1")
  let set_event1 this = fun x -> Jx.set this "event1" (A_callback.to_any x)
  let event2 this = D_jx.obj (Jx.get this "event2")
  let set_event2 this = fun x -> Jx.set this "event2" (E_jx.obj x)
end

and A_callback : sig
  type t = [ `A_callback ] Jx.obj

  val make : (T1.t Jx.nullable -> Jx.number -> unit) -> t
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `A_callback ] Jx.obj

  let make f = D_jx.obj (E_jx.func 2 f)
  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and A4 : sig
  type t = [ `A4 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val behavior : t -> Scroll_behavior.t
  val set_behavior : t -> Scroll_behavior.t -> unit
end = struct
  type t = [ `A4 ] Jx.obj

  let t = Jx.expr "A4"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let behavior this = Scroll_behavior.of_any (Jx.get this "behavior")

  let set_behavior this =
   fun x -> Jx.set this "behavior" (Scroll_behavior.to_any x)
end

and Scroll_behavior : sig
  type t

  val to_string : t -> string
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val auto : t [@@ocaml.doc "The [\"auto\"] enum value."]

  val instant : t [@@ocaml.doc "The [\"instant\"] enum value."]

  val smooth : t [@@ocaml.doc "The [\"smooth\"] enum value."]
end = struct
  type t = string

  let to_string = Stdlib.Fun.id
  let of_any = D_jx.string
  let to_any = E_jx.string
  let auto = "auto"
  let instant = "instant"
  let smooth = "smooth"
end

and Style_enum : sig
  type t

  val to_string : t -> string
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val empty : t [@@ocaml.doc "The [\"\"] enum value."]

  val first_hyphenvalue : t [@@ocaml.doc "The [\"first-value\"] enum value."]

  val second_hyphen_value : t [@@ocaml.doc "The [\"SECOND-VALUE\"] enum value."]
end = struct
  type t = string

  let to_string = Stdlib.Fun.id
  let of_any = D_jx.string
  let to_any = E_jx.string
  let empty = ""
  let first_hyphenvalue = "first-value"
  let second_hyphen_value = "SECOND-VALUE"
end

and A5 : sig
  type t = [ `A5 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val x : t -> Jx.number
  val set_x : t -> Jx.number -> unit
  val y : t -> Jx.number
  val set_y : t -> Jx.number -> unit
  val z : Jx.number
  val f : t -> unit
end = struct
  type t = [ `A5 ] Jx.obj

  let t = Jx.expr "A5"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let x this = D_jx.obj (Jx.get this "x")
  let set_x this = fun x -> Jx.set this "x" (E_jx.obj x)
  let y this = D_jx.obj (Jx.get this "y")
  let set_y this = fun x -> Jx.set this "y" (E_jx.obj x)
  let z = Jx.int 5
  let f this = D_jx.unit (D_jx.meth this "f" [||])
end

and A7 : sig
  type t = [ `A7 ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val g : t -> unit
end = struct
  type t = [ `A7 ] Jx.obj

  let t = Jx.expr "A7"
  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let g this = D_jx.unit (D_jx.meth this "g" [||])
end

and D1 : sig
  type t [@@ocaml.doc "The type for the [D1] dictionary."]

  val make : ?a:Jx.boolean -> unit -> t
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val a : t -> Jx.boolean Jx.nullable
end = struct
  type t = Jx.any

  let make ?a =
   fun () ->
    let a = (E_jx.nullable E_jx.obj) a in
    Jx.obj [| ("a", a) |]

  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let a this = D_jx.obj (Jx.get this "a")
end

and D2 : sig
  type t [@@ocaml.doc "The type for the [D2] dictionary."]

  val make : ?a:Jx.boolean -> b:Jx.number -> unit -> t
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
  val a : t -> Jx.boolean Jx.nullable
  val b : t -> Jx.number
end = struct
  type t = Jx.any

  let make ?a =
   fun ~b ->
    fun () ->
     let a = (E_jx.nullable E_jx.obj) a in
     let b = E_jx.obj b in
     Jx.obj [| ("a", a); ("b", b) |]

  let of_any = D_jx.obj
  let to_any = E_jx.obj
  let a this = D_jx.obj (Jx.get this "a")
  let b this = D_jx.obj (Jx.get this "b")
end

and N2 : sig
  val x : Jx.number
  val f : unit -> unit
end = struct
  let t = Jx.expr "N2"
  let x = D_jx.obj (Jx.get t "x")
  let f () = D_jx.unit (D_jx.meth t "f" [||])
end

and Event : sig
  type t = [ `Event ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Event ] Jx.obj

  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and Event_listener : sig
  type t = Event.t -> unit

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = Event.t -> unit

  let to_any this = E_jx.func 1 this

  let of_any any =
    let __f_js = D_jx.func any in
    fun event ->
      let event = Event.to_any event in
      D_jx.unit (__f_js [| event |])
end

and Event_target : sig
  type t = [ `Event_target ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val add_event_listener :
    type':Jx.string ->
    callback:Event_listener.t Jx.nullable ->
    ?options:[< `Add_event_listener_options | `Boolean ] Jx.obj ->
    t ->
    unit
end = struct
  type t = [ `Event_target ] Jx.obj

  let t = Jx.expr "EventTarget"
  let of_any = D_jx.obj
  let to_any = E_jx.obj

  let add_event_listener ~type' =
   fun ~callback ->
    fun ?options ->
     fun this ->
      let type' = E_jx.obj type' in
      let callback = E_jx.obj callback in
      let options = E_jx.obj_undefined options in
      D_jx.unit
        (D_jx.meth this "addEventListener" [| type'; callback; options |])
end

and Node : sig
  type t = [ `Node ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Node ] Jx.obj

  let of_any = D_jx.obj
  let to_any = E_jx.obj
end

and Node_list : sig
  type t = [ `Node_list ] Jx.obj

  val of_any : Jx.any -> t
  val to_any : t -> Jx.any

  val filter :
    by:[< `Nullable of [ `Node_filter ] | `String ] Jx.obj ->
    t ->
    Node.t Jx.array

  val filter_by_func : func:Node_filter.t -> t -> Node.t Jx.array

  val filter_by_func_nullable :
    func:[ `Node_filter ] Jx.nullable -> t -> Node.t Jx.array

  val filter_by_name : name:Jx.string -> t -> Node.t Jx.array
end = struct
  type t = [ `Node_list ] Jx.obj

  let t = Jx.expr "NodeList"
  let of_any = D_jx.obj
  let to_any = E_jx.obj

  let filter ~by =
   fun this ->
    let by = E_jx.obj by in
    D_jx.obj (D_jx.meth this "filter" [| by |])

  let filter_by_func ~func =
   fun this ->
    let func = Node_filter.to_any func in
    D_jx.obj (D_jx.meth this "filterByFunc" [| func |])

  let filter_by_func_nullable ~func =
   fun this ->
    let func = E_jx.obj func in
    D_jx.obj (D_jx.meth this "filterByFuncNullable" [| func |])

  let filter_by_name ~name =
   fun this ->
    let name = E_jx.obj name in
    D_jx.obj (D_jx.meth this "filterByName" [| name |])
end

and Node_filter : sig
  type t = [ `Node_filter ] Jx.obj

  val make : (Node.t -> bool) -> t
  val of_any : Jx.any -> t
  val to_any : t -> Jx.any
end = struct
  type t = [ `Node_filter ] Jx.obj

  let make f = D_jx.obj (E_jx.func 1 f)
  let of_any = D_jx.obj
  let to_any = E_jx.obj
end
