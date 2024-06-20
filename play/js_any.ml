module Js : sig
  type +'kind t constraint 'kind = [> ]
  type any = [ `Any ] t

  val to_any : 'kind t -> any
  val int : int -> [ `Int ] t
end = struct
  type +'kind t constraint 'kind = [> ]
  type any = [ `Any ] t

  let to_any x = Obj.magic x
  let int x = Obj.magic x
end

module M1 : sig
  val f1 : [ `Int ] Js.t -> unit
  val f2 : [ `Int ] Js.t -> unit
end = struct
  let f1 x =
    let a1 = Js.to_any x in
    ignore a1

  let f2 x =
    let a1 = Js.to_any x in
    ignore a1
end
