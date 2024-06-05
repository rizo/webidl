module Js = struct
  type 'a t
  type any
  type 'a obj
end

module type S = sig
  module Evented : sig
    type super = [ `Evented ]
    type 'cls t = ([< super ] as 'cls) Js.t
  end

  module Camera : sig
    type super = [ `Camera | Evented.super ]
    type t = [ `Camera ] Js.t
  end

  module Map : sig
    type super = [ `Map | Camera.super ]
    type t = [ `Map ] Js.t

    val super : t -> [< super ] Js.t
    val make : options:unit -> t
    val get_pixel_ratio : t -> float
  end
end
