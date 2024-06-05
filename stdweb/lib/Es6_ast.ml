module rec Arguments : sig
  type nonrec t = [< `Spread_element | `Expression ] Js.t array

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Arguments

and String : sig
  type nonrec t = string

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  String

and Identifier : sig
  type nonrec t = String.t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Identifier

and Identifier_name : sig
  type nonrec t = String.t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Identifier_name

and Property_key : sig
  type nonrec t = String.t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Property_key

and Label : sig
  type nonrec t = String.t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Label

and Type : sig
  type nonrec t = String.t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Type

and Variable_declaration_kind : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val var : t [@@ocaml.doc "The [var] enum value."]

  val let' : t [@@ocaml.doc "The [let] enum value."]

  val const : t [@@ocaml.doc "The [const] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let var = Js.of_string "var"
  let let' = Js.of_string "let"
  let const = Js.of_string "const"
end

and Compound_assignment_operator : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val plus_eq : t [@@ocaml.doc "The [+=] enum value."]

  val hyphen_eq : t [@@ocaml.doc "The [-=] enum value."]

  val astr_eq : t [@@ocaml.doc "The [*=] enum value."]

  val slsh_eq : t [@@ocaml.doc "The [/=] enum value."]

  val pct_eq : t [@@ocaml.doc "The [%=] enum value."]

  val astr_astr_eq : t [@@ocaml.doc "The [**=] enum value."]

  val lt_lt_eq : t [@@ocaml.doc "The [<<=] enum value."]

  val gt_gt_eq : t [@@ocaml.doc "The [>>=] enum value."]

  val gt_gt_gt_eq : t [@@ocaml.doc "The [>>>=] enum value."]

  val bar_eq : t [@@ocaml.doc "The [|=] enum value."]

  val caret_eq : t [@@ocaml.doc "The [^=] enum value."]

  val amp_eq : t [@@ocaml.doc "The [&=] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let plus_eq = Js.of_string "+="
  let hyphen_eq = Js.of_string "-="
  let astr_eq = Js.of_string "*="
  let slsh_eq = Js.of_string "/="
  let pct_eq = Js.of_string "%="
  let astr_astr_eq = Js.of_string "**="
  let lt_lt_eq = Js.of_string "<<="
  let gt_gt_eq = Js.of_string ">>="
  let gt_gt_gt_eq = Js.of_string ">>>="
  let bar_eq = Js.of_string "|="
  let caret_eq = Js.of_string "^="
  let amp_eq = Js.of_string "&="
end

and Binary_operator : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val comm : t [@@ocaml.doc "The [,] enum value."]

  val bar_bar : t [@@ocaml.doc "The [||] enum value."]

  val amp_amp : t [@@ocaml.doc "The [&&] enum value."]

  val bar : t [@@ocaml.doc "The [|] enum value."]

  val caret : t [@@ocaml.doc "The [^] enum value."]

  val amp : t [@@ocaml.doc "The [&] enum value."]

  val eq_eq : t [@@ocaml.doc "The [==] enum value."]

  val exclm_eq : t [@@ocaml.doc "The [!=] enum value."]

  val eq_eq_eq : t [@@ocaml.doc "The [===] enum value."]

  val exclm_eq_eq : t [@@ocaml.doc "The [!==] enum value."]

  val lt : t [@@ocaml.doc "The [<] enum value."]

  val lt_eq : t [@@ocaml.doc "The [<=] enum value."]

  val gt : t [@@ocaml.doc "The [>] enum value."]

  val gt_eq : t [@@ocaml.doc "The [>=] enum value."]

  val in' : t [@@ocaml.doc "The [in] enum value."]

  val instanceof : t [@@ocaml.doc "The [instanceof] enum value."]

  val lt_lt : t [@@ocaml.doc "The [<<] enum value."]

  val gt_gt : t [@@ocaml.doc "The [>>] enum value."]

  val gt_gt_gt : t [@@ocaml.doc "The [>>>] enum value."]

  val plus : t [@@ocaml.doc "The [+] enum value."]

  val hyphen : t [@@ocaml.doc "The [-] enum value."]

  val astr : t [@@ocaml.doc "The [*] enum value."]

  val slsh : t [@@ocaml.doc "The [/] enum value."]

  val pct : t [@@ocaml.doc "The [%] enum value."]

  val astr_astr : t [@@ocaml.doc "The [**] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let comm = Js.of_string ","
  let bar_bar = Js.of_string "||"
  let amp_amp = Js.of_string "&&"
  let bar = Js.of_string "|"
  let caret = Js.of_string "^"
  let amp = Js.of_string "&"
  let eq_eq = Js.of_string "=="
  let exclm_eq = Js.of_string "!="
  let eq_eq_eq = Js.of_string "==="
  let exclm_eq_eq = Js.of_string "!=="
  let lt = Js.of_string "<"
  let lt_eq = Js.of_string "<="
  let gt = Js.of_string ">"
  let gt_eq = Js.of_string ">="
  let in' = Js.of_string "in"
  let instanceof = Js.of_string "instanceof"
  let lt_lt = Js.of_string "<<"
  let gt_gt = Js.of_string ">>"
  let gt_gt_gt = Js.of_string ">>>"
  let plus = Js.of_string "+"
  let hyphen = Js.of_string "-"
  let astr = Js.of_string "*"
  let slsh = Js.of_string "/"
  let pct = Js.of_string "%"
  let astr_astr = Js.of_string "**"
end

and Unary_operator : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val plus : t [@@ocaml.doc "The [+] enum value."]

  val hyphen : t [@@ocaml.doc "The [-] enum value."]

  val exclm : t [@@ocaml.doc "The [!] enum value."]

  val tild : t [@@ocaml.doc "The [~] enum value."]

  val typeof : t [@@ocaml.doc "The [typeof] enum value."]

  val void : t [@@ocaml.doc "The [void] enum value."]

  val delete : t [@@ocaml.doc "The [delete] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let plus = Js.of_string "+"
  let hyphen = Js.of_string "-"
  let exclm = Js.of_string "!"
  let tild = Js.of_string "~"
  let typeof = Js.of_string "typeof"
  let void = Js.of_string "void"
  let delete = Js.of_string "delete"
end

and Update_operator : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val plus_plus : t [@@ocaml.doc "The [++] enum value."]

  val hyphen_hyphen : t [@@ocaml.doc "The [--] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let plus_plus = Js.of_string "++"
  let hyphen_hyphen = Js.of_string "--"
end

and Asserted_declared_kind : sig
  type t

  val to_string : t -> string
  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val var : t [@@ocaml.doc "The [var] enum value."]

  val non_hyphenconst_lexical : t
  [@@ocaml.doc "The [non-const lexical] enum value."]

  val const_lexical : t [@@ocaml.doc "The [const lexical] enum value."]
end = struct
  type t = Js.string

  let to_string = Js.to_string
  let to_any = Js.to_any
  let of_any = Js.of_any
  let var = Js.of_string "var"
  let non_hyphenconst_lexical = Js.of_string "non-const lexical"
  let const_lexical = Js.of_string "const lexical"
end

and Asserted_declared_name : sig
  type t = [ `Asserted_declared_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName} \
     [AssertedDeclaredName]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val name : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName/name} \
     [name] on MDN}."]

  val kind : t -> Asserted_declared_kind.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName/kind} \
     [kind] on MDN}."]

  val set_kind : t -> Asserted_declared_kind.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName/kind} \
     [kind] on MDN}."]

  val is_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName/isCaptured} \
     [isCaptured] on MDN}."]

  val set_is_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName/isCaptured} \
     [isCaptured] on MDN}."]
end = struct
  type t = [ `Asserted_declared_name ] Js.t

  let t = Js.Ffi.constr "AssertedDeclaredName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let name this = Identifier_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_name.to_any x)
  let kind this = Asserted_declared_kind.of_any (Js.Ffi.get this "kind")
  let set_kind this x = Js.Ffi.set this "kind" (Asserted_declared_kind.to_any x)
  let is_captured this = Js.Any.to_bool (Js.Ffi.get this "isCaptured")
  let set_is_captured this x = Js.Ffi.set this "isCaptured" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedDeclaredName} \
   [AssertedDeclaredName] on MDN}."]

and Asserted_positional_parameter_name : sig
  type t = [ `Asserted_positional_parameter_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName} \
     [AssertedPositionalParameterName]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val index : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName/index} \
     [index] on MDN}."]

  val set_index : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName/index} \
     [index] on MDN}."]

  val name : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName/name} \
     [name] on MDN}."]

  val is_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName/isCaptured} \
     [isCaptured] on MDN}."]

  val set_is_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName/isCaptured} \
     [isCaptured] on MDN}."]
end = struct
  type t = [ `Asserted_positional_parameter_name ] Js.t

  let t = Js.Ffi.constr "AssertedPositionalParameterName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let index this = Js.Any.to_int (Js.Ffi.get this "index")
  let set_index this x = Js.Ffi.set this "index" (Js.Any.of_int x)
  let name this = Identifier_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_name.to_any x)
  let is_captured this = Js.Any.to_bool (Js.Ffi.get this "isCaptured")
  let set_is_captured this x = Js.Ffi.set this "isCaptured" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedPositionalParameterName} \
   [AssertedPositionalParameterName] on MDN}."]

and Asserted_rest_parameter_name : sig
  type t = [ `Asserted_rest_parameter_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedRestParameterName} \
     [AssertedRestParameterName]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val name : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedRestParameterName/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedRestParameterName/name} \
     [name] on MDN}."]

  val is_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedRestParameterName/isCaptured} \
     [isCaptured] on MDN}."]

  val set_is_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedRestParameterName/isCaptured} \
     [isCaptured] on MDN}."]
end = struct
  type t = [ `Asserted_rest_parameter_name ] Js.t

  let t = Js.Ffi.constr "AssertedRestParameterName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let name this = Identifier_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_name.to_any x)
  let is_captured this = Js.Any.to_bool (Js.Ffi.get this "isCaptured")
  let set_is_captured this x = Js.Ffi.set this "isCaptured" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedRestParameterName} \
   [AssertedRestParameterName] on MDN}."]

and Asserted_parameter_name : sig
  type t = [ `Asserted_parameter_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterName} \
     [AssertedParameterName]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val name : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterName/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterName/name} \
     [name] on MDN}."]

  val is_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterName/isCaptured} \
     [isCaptured] on MDN}."]

  val set_is_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterName/isCaptured} \
     [isCaptured] on MDN}."]
end = struct
  type t = [ `Asserted_parameter_name ] Js.t

  let t = Js.Ffi.constr "AssertedParameterName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let name this = Identifier_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_name.to_any x)
  let is_captured this = Js.Any.to_bool (Js.Ffi.get this "isCaptured")
  let set_is_captured this x = Js.Ffi.set this "isCaptured" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterName} \
   [AssertedParameterName] on MDN}."]

and Asserted_maybe_positional_parameter_name : sig
  type t

  val with_asserted_positional_parameter_name :
    Asserted_positional_parameter_name.t -> t

  val with_asserted_rest_parameter_name : Asserted_rest_parameter_name.t -> t
  val with_asserted_parameter_name : Asserted_parameter_name.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_asserted_positional_parameter_name = Js.repr
  let with_asserted_rest_parameter_name = Js.repr
  let with_asserted_parameter_name = Js.repr
end

and Asserted_bound_name : sig
  type t = [ `Asserted_bound_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundName} \
     [AssertedBoundName]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val name : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundName/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundName/name} \
     [name] on MDN}."]

  val is_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundName/isCaptured} \
     [isCaptured] on MDN}."]

  val set_is_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundName/isCaptured} \
     [isCaptured] on MDN}."]
end = struct
  type t = [ `Asserted_bound_name ] Js.t

  let t = Js.Ffi.constr "AssertedBoundName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let name this = Identifier_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_name.to_any x)
  let is_captured this = Js.Any.to_bool (Js.Ffi.get this "isCaptured")
  let set_is_captured this x = Js.Ffi.set this "isCaptured" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundName} \
   [AssertedBoundName] on MDN}."]

and Asserted_block_scope : sig
  type t = [ `Asserted_block_scope ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBlockScope} \
     [AssertedBlockScope]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val declared_names : t -> Asserted_declared_name.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBlockScope/declaredNames} \
     [declaredNames] on MDN}."]

  val set_declared_names : t -> Asserted_declared_name.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBlockScope/declaredNames} \
     [declaredNames] on MDN}."]

  val has_direct_eval : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBlockScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]

  val set_has_direct_eval : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBlockScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]
end = struct
  type t = [ `Asserted_block_scope ] Js.t

  let t = Js.Ffi.constr "AssertedBlockScope"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let declared_names this =
    (Js.Any.to_array Asserted_declared_name.of_any)
      (Js.Ffi.get this "declaredNames")

  let set_declared_names this x =
    Js.Ffi.set this "declaredNames"
      ((Js.Any.of_array Asserted_declared_name.to_any) x)

  let has_direct_eval this = Js.Any.to_bool (Js.Ffi.get this "hasDirectEval")

  let set_has_direct_eval this x =
    Js.Ffi.set this "hasDirectEval" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedBlockScope} \
   [AssertedBlockScope] on MDN}."]

and Asserted_script_global_scope : sig
  type t = [ `Asserted_script_global_scope ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedScriptGlobalScope} \
     [AssertedScriptGlobalScope]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val declared_names : t -> Asserted_declared_name.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedScriptGlobalScope/declaredNames} \
     [declaredNames] on MDN}."]

  val set_declared_names : t -> Asserted_declared_name.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedScriptGlobalScope/declaredNames} \
     [declaredNames] on MDN}."]

  val has_direct_eval : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedScriptGlobalScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]

  val set_has_direct_eval : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedScriptGlobalScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]
end = struct
  type t = [ `Asserted_script_global_scope ] Js.t

  let t = Js.Ffi.constr "AssertedScriptGlobalScope"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let declared_names this =
    (Js.Any.to_array Asserted_declared_name.of_any)
      (Js.Ffi.get this "declaredNames")

  let set_declared_names this x =
    Js.Ffi.set this "declaredNames"
      ((Js.Any.of_array Asserted_declared_name.to_any) x)

  let has_direct_eval this = Js.Any.to_bool (Js.Ffi.get this "hasDirectEval")

  let set_has_direct_eval this x =
    Js.Ffi.set this "hasDirectEval" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedScriptGlobalScope} \
   [AssertedScriptGlobalScope] on MDN}."]

and Asserted_var_scope : sig
  type t = [ `Asserted_var_scope ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedVarScope} \
     [AssertedVarScope]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val declared_names : t -> Asserted_declared_name.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedVarScope/declaredNames} \
     [declaredNames] on MDN}."]

  val set_declared_names : t -> Asserted_declared_name.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedVarScope/declaredNames} \
     [declaredNames] on MDN}."]

  val has_direct_eval : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedVarScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]

  val set_has_direct_eval : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedVarScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]
end = struct
  type t = [ `Asserted_var_scope ] Js.t

  let t = Js.Ffi.constr "AssertedVarScope"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let declared_names this =
    (Js.Any.to_array Asserted_declared_name.of_any)
      (Js.Ffi.get this "declaredNames")

  let set_declared_names this x =
    Js.Ffi.set this "declaredNames"
      ((Js.Any.of_array Asserted_declared_name.to_any) x)

  let has_direct_eval this = Js.Any.to_bool (Js.Ffi.get this "hasDirectEval")

  let set_has_direct_eval this x =
    Js.Ffi.set this "hasDirectEval" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/AssertedVarScope} \
   [AssertedVarScope] on MDN}."]

and Asserted_parameter_scope : sig
  type t = [ `Asserted_parameter_scope ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope} \
     [AssertedParameterScope]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val param_names : t -> Asserted_maybe_positional_parameter_name.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope/paramNames} \
     [paramNames] on MDN}."]

  val set_param_names :
    t -> Asserted_maybe_positional_parameter_name.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope/paramNames} \
     [paramNames] on MDN}."]

  val has_direct_eval : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]

  val set_has_direct_eval : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]

  val is_simple_parameter_list : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope/isSimpleParameterList} \
     [isSimpleParameterList] on MDN}."]

  val set_is_simple_parameter_list : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope/isSimpleParameterList} \
     [isSimpleParameterList] on MDN}."]
end = struct
  type t = [ `Asserted_parameter_scope ] Js.t

  let t = Js.Ffi.constr "AssertedParameterScope"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let param_names this =
    (Js.Any.to_array Asserted_maybe_positional_parameter_name.of_any)
      (Js.Ffi.get this "paramNames")

  let set_param_names this x =
    Js.Ffi.set this "paramNames"
      ((Js.Any.of_array Asserted_maybe_positional_parameter_name.to_any) x)

  let has_direct_eval this = Js.Any.to_bool (Js.Ffi.get this "hasDirectEval")

  let set_has_direct_eval this x =
    Js.Ffi.set this "hasDirectEval" (Js.Any.of_bool x)

  let is_simple_parameter_list this =
    Js.Any.to_bool (Js.Ffi.get this "isSimpleParameterList")

  let set_is_simple_parameter_list this x =
    Js.Ffi.set this "isSimpleParameterList" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedParameterScope} \
   [AssertedParameterScope] on MDN}."]

and Asserted_bound_names_scope : sig
  type t = [ `Asserted_bound_names_scope ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundNamesScope} \
     [AssertedBoundNamesScope]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val bound_names : t -> Asserted_bound_name.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundNamesScope/boundNames} \
     [boundNames] on MDN}."]

  val set_bound_names : t -> Asserted_bound_name.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundNamesScope/boundNames} \
     [boundNames] on MDN}."]

  val has_direct_eval : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundNamesScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]

  val set_has_direct_eval : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundNamesScope/hasDirectEval} \
     [hasDirectEval] on MDN}."]
end = struct
  type t = [ `Asserted_bound_names_scope ] Js.t

  let t = Js.Ffi.constr "AssertedBoundNamesScope"
  let to_any = Js.to_any
  let of_any = Js.of_any

  let bound_names this =
    (Js.Any.to_array Asserted_bound_name.of_any) (Js.Ffi.get this "boundNames")

  let set_bound_names this x =
    Js.Ffi.set this "boundNames" ((Js.Any.of_array Asserted_bound_name.to_any) x)

  let has_direct_eval this = Js.Any.to_bool (Js.Ffi.get this "hasDirectEval")

  let set_has_direct_eval this x =
    Js.Ffi.set this "hasDirectEval" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssertedBoundNamesScope} \
   [AssertedBoundNamesScope] on MDN}."]

and Node : sig
  type t = [ `Node ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Node} [Node]} interface."]

  val of_any : Js.any -> t
  val to_any : t -> Js.any

  val type' : t -> Type.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node/type} \
     [type] on MDN}."]
end = struct
  type t = [ `Node ] Js.t

  let t = Js.Ffi.constr "Node"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let type' this = Type.of_any (Js.Ffi.get this "type")
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Node} [Node] on \
   MDN}."]

and Program : sig
  type t

  val with_script : Script.t -> t
  val with_module : Module.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_script = Js.repr
  let with_module = Js.repr
end

and Iteration_statement : sig
  type t

  val with_do_while_statement : Do_while_statement.t -> t
  val with_for_in_statement : For_in_statement.t -> t
  val with_for_of_statement : For_of_statement.t -> t
  val with_for_statement : For_statement.t -> t
  val with_while_statement : While_statement.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_do_while_statement = Js.repr
  let with_for_in_statement = Js.repr
  let with_for_of_statement = Js.repr
  let with_for_statement = Js.repr
  let with_while_statement = Js.repr
end

and Statement : sig
  type t

  val with_block : Block.t -> t
  val with_break_statement : Break_statement.t -> t
  val with_continue_statement : Continue_statement.t -> t
  val with_class_declaration : Class_declaration.t -> t
  val with_debugger_statement : Debugger_statement.t -> t
  val with_empty_statement : Empty_statement.t -> t
  val with_expression_statement : Expression_statement.t -> t
  val with_function_declaration : Function_declaration.t -> t
  val with_if_statement : If_statement.t -> t
  val with_iteration_statement : Iteration_statement.t -> t
  val with_labelled_statement : Labelled_statement.t -> t
  val with_return_statement : Return_statement.t -> t
  val with_switch_statement : Switch_statement.t -> t
  val with_switch_statement_with_default : Switch_statement_with_default.t -> t
  val with_throw_statement : Throw_statement.t -> t
  val with_try_catch_statement : Try_catch_statement.t -> t
  val with_try_finally_statement : Try_finally_statement.t -> t
  val with_variable_declaration : Variable_declaration.t -> t
  val with_with_statement : With_statement.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_block = Js.repr
  let with_break_statement = Js.repr
  let with_continue_statement = Js.repr
  let with_class_declaration = Js.repr
  let with_debugger_statement = Js.repr
  let with_empty_statement = Js.repr
  let with_expression_statement = Js.repr
  let with_function_declaration = Js.repr
  let with_if_statement = Js.repr
  let with_iteration_statement = Js.repr
  let with_labelled_statement = Js.repr
  let with_return_statement = Js.repr
  let with_switch_statement = Js.repr
  let with_switch_statement_with_default = Js.repr
  let with_throw_statement = Js.repr
  let with_try_catch_statement = Js.repr
  let with_try_finally_statement = Js.repr
  let with_variable_declaration = Js.repr
  let with_with_statement = Js.repr
end

and Literal : sig
  type t

  val with_literal_boolean_expression : Literal_boolean_expression.t -> t
  val with_literal_infinity_expression : Literal_infinity_expression.t -> t
  val with_literal_null_expression : Literal_null_expression.t -> t
  val with_literal_numeric_expression : Literal_numeric_expression.t -> t
  val with_literal_string_expression : Literal_string_expression.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_literal_boolean_expression = Js.repr
  let with_literal_infinity_expression = Js.repr
  let with_literal_null_expression = Js.repr
  let with_literal_numeric_expression = Js.repr
  let with_literal_string_expression = Js.repr
end

and Expression : sig
  type t

  val with_literal : Literal.t -> t
  val with_literal_reg_exp_expression : Literal_reg_exp_expression.t -> t
  val with_array_expression : Array_expression.t -> t
  val with_arrow_expression : Arrow_expression.t -> t
  val with_assignment_expression : Assignment_expression.t -> t
  val with_binary_expression : Binary_expression.t -> t
  val with_call_expression : Call_expression.t -> t

  val with_compound_assignment_expression :
    Compound_assignment_expression.t -> t

  val with_computed_member_expression : Computed_member_expression.t -> t
  val with_conditional_expression : Conditional_expression.t -> t
  val with_class_expression : Class_expression.t -> t
  val with_function_expression : Function_expression.t -> t
  val with_identifier_expression : Identifier_expression.t -> t
  val with_new_expression : New_expression.t -> t
  val with_new_target_expression : New_target_expression.t -> t
  val with_object_expression : Object_expression.t -> t
  val with_unary_expression : Unary_expression.t -> t
  val with_static_member_expression : Static_member_expression.t -> t
  val with_template_expression : Template_expression.t -> t
  val with_this_expression : This_expression.t -> t
  val with_update_expression : Update_expression.t -> t
  val with_yield_expression : Yield_expression.t -> t
  val with_yield_star_expression : Yield_star_expression.t -> t
  val with_await_expression : Await_expression.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_literal = Js.repr
  let with_literal_reg_exp_expression = Js.repr
  let with_array_expression = Js.repr
  let with_arrow_expression = Js.repr
  let with_assignment_expression = Js.repr
  let with_binary_expression = Js.repr
  let with_call_expression = Js.repr
  let with_compound_assignment_expression = Js.repr
  let with_computed_member_expression = Js.repr
  let with_conditional_expression = Js.repr
  let with_class_expression = Js.repr
  let with_function_expression = Js.repr
  let with_identifier_expression = Js.repr
  let with_new_expression = Js.repr
  let with_new_target_expression = Js.repr
  let with_object_expression = Js.repr
  let with_unary_expression = Js.repr
  let with_static_member_expression = Js.repr
  let with_template_expression = Js.repr
  let with_this_expression = Js.repr
  let with_update_expression = Js.repr
  let with_yield_expression = Js.repr
  let with_yield_star_expression = Js.repr
  let with_await_expression = Js.repr
end

and Property_name : sig
  type t

  val with_computed_property_name : Computed_property_name.t -> t
  val with_literal_property_name : Literal_property_name.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_computed_property_name = Js.repr
  let with_literal_property_name = Js.repr
end

and Method_definition : sig
  type t

  val with_method : Method.t -> t
  val with_getter : Getter.t -> t
  val with_setter : Setter.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_method = Js.repr
  let with_getter = Js.repr
  let with_setter = Js.repr
end

and Object_property : sig
  type t

  val with_method_definition : Method_definition.t -> t
  val with_data_property : Data_property.t -> t
  val with_shorthand_property : Shorthand_property.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_method_definition = Js.repr
  let with_data_property = Js.repr
  let with_shorthand_property = Js.repr
end

and Export_declaration : sig
  type t

  val with_export_all_from : Export_all_from.t -> t
  val with_export_from : Export_from.t -> t
  val with_export_locals : Export_locals.t -> t
  val with_export_default : Export_default.t -> t
  val with_export : Export.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_export_all_from = Js.repr
  let with_export_from = Js.repr
  let with_export_locals = Js.repr
  let with_export_default = Js.repr
  let with_export = Js.repr
end

and Import_declaration : sig
  type t

  val with_import_namespace : Import_namespace.t -> t
  val with_import : Import.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_import_namespace = Js.repr
  let with_import = Js.repr
end

and Function_declaration : sig
  type t

  val with_eager_function_declaration : Eager_function_declaration.t -> t
  val with_lazy_function_declaration : Lazy_function_declaration.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_eager_function_declaration = Js.repr
  let with_lazy_function_declaration = Js.repr
end

and Function_expression : sig
  type t

  val with_eager_function_expression : Eager_function_expression.t -> t
  val with_lazy_function_expression : Lazy_function_expression.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_eager_function_expression = Js.repr
  let with_lazy_function_expression = Js.repr
end

and Method : sig
  type t

  val with_eager_method : Eager_method.t -> t
  val with_lazy_method : Lazy_method.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_eager_method = Js.repr
  let with_lazy_method = Js.repr
end

and Getter : sig
  type t

  val with_eager_getter : Eager_getter.t -> t
  val with_lazy_getter : Lazy_getter.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_eager_getter = Js.repr
  let with_lazy_getter = Js.repr
end

and Setter : sig
  type t

  val with_eager_setter : Eager_setter.t -> t
  val with_lazy_setter : Lazy_setter.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_eager_setter = Js.repr
  let with_lazy_setter = Js.repr
end

and Arrow_expression : sig
  type t

  val with_eager_arrow_expression_with_function_body :
    Eager_arrow_expression_with_function_body.t -> t

  val with_lazy_arrow_expression_with_function_body :
    Lazy_arrow_expression_with_function_body.t -> t

  val with_eager_arrow_expression_with_expression :
    Eager_arrow_expression_with_expression.t -> t

  val with_lazy_arrow_expression_with_expression :
    Lazy_arrow_expression_with_expression.t -> t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_eager_arrow_expression_with_function_body = Js.repr
  let with_lazy_arrow_expression_with_function_body = Js.repr
  let with_eager_arrow_expression_with_expression = Js.repr
  let with_lazy_arrow_expression_with_expression = Js.repr
end

and Binding_identifier : sig
  type t = [ `Binding_identifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingIdentifier} \
     [BindingIdentifier]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Binding_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingIdentifier} \
     [BindingIdentifier]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Identifier.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingIdentifier/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingIdentifier/name} \
     [name] on MDN}."]
end = struct
  type t = [ `Binding_identifier ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Binding_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingIdentifier} \
     [BindingIdentifier]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "BindingIdentifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Identifier.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BindingIdentifier} \
   [BindingIdentifier] on MDN}."]

and Binding_pattern : sig
  type t

  val with_object_binding : Object_binding.t -> t
  val with_array_binding : Array_binding.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_object_binding = Js.repr
  let with_array_binding = Js.repr
end

and Binding : sig
  type t

  val with_binding_pattern : Binding_pattern.t -> t
  val with_binding_identifier : Binding_identifier.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_binding_pattern = Js.repr
  let with_binding_identifier = Js.repr
end

and Simple_assignment_target : sig
  type t

  val with_assignment_target_identifier : Assignment_target_identifier.t -> t

  val with_computed_member_assignment_target :
    Computed_member_assignment_target.t -> t

  val with_static_member_assignment_target :
    Static_member_assignment_target.t -> t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_assignment_target_identifier = Js.repr
  let with_computed_member_assignment_target = Js.repr
  let with_static_member_assignment_target = Js.repr
end

and Assignment_target_pattern : sig
  type t

  val with_object_assignment_target : Object_assignment_target.t -> t
  val with_array_assignment_target : Array_assignment_target.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_object_assignment_target = Js.repr
  let with_array_assignment_target = Js.repr
end

and Assignment_target : sig
  type t

  val with_assignment_target_pattern : Assignment_target_pattern.t -> t
  val with_simple_assignment_target : Simple_assignment_target.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_assignment_target_pattern = Js.repr
  let with_simple_assignment_target = Js.repr
end

and Parameter : sig
  type t

  val with_binding : Binding.t -> t
  val with_binding_with_initializer : Binding_with_initializer.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_binding = Js.repr
  let with_binding_with_initializer = Js.repr
end

and Binding_with_initializer : sig
  type t = [ `Binding_with_initializer ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer} \
     [BindingWithInitializer]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Binding_with_initializer | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer} \
     [BindingWithInitializer]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding : t -> Binding.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Binding.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer/binding} \
     [binding] on MDN}."]

  val init : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer/init} \
     [init] on MDN}."]

  val set_init : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer/init} \
     [init] on MDN}."]
end = struct
  type t = [ `Binding_with_initializer ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Binding_with_initializer | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer} \
     [BindingWithInitializer]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "BindingWithInitializer"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let binding this = Binding.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Binding.to_any x)
  let init this = Expression.of_any (Js.Ffi.get this "init")
  let set_init this x = Js.Ffi.set this "init" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/BindingWithInitializer} \
   [BindingWithInitializer] on MDN}."]

and Assignment_target_identifier : sig
  type t = [ `Assignment_target_identifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetIdentifier} \
     [AssignmentTargetIdentifier]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetIdentifier} \
     [AssignmentTargetIdentifier]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Identifier.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetIdentifier/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetIdentifier/name} \
     [name] on MDN}."]
end = struct
  type t = [ `Assignment_target_identifier ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetIdentifier} \
     [AssignmentTargetIdentifier]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "AssignmentTargetIdentifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Identifier.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetIdentifier} \
   [AssignmentTargetIdentifier] on MDN}."]

and Computed_member_assignment_target : sig
  type t = [ `Computed_member_assignment_target ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget} \
     [ComputedMemberAssignmentTarget]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Computed_member_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget} \
     [ComputedMemberAssignmentTarget]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val _object : t -> [< `Expression | `Super ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget/_object} \
     [_object] on MDN}."]

  val set__object : t -> [< `Expression | `Super ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget/_object} \
     [_object] on MDN}."]

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Computed_member_assignment_target ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Computed_member_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget} \
     [ComputedMemberAssignmentTarget]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "ComputedMemberAssignmentTarget"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let _object this = Js.of_any (Js.Ffi.get this "_object")
  let set__object this x = Js.Ffi.set this "_object" (Js.to_any x)
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberAssignmentTarget} \
   [ComputedMemberAssignmentTarget] on MDN}."]

and Static_member_assignment_target : sig
  type t = [ `Static_member_assignment_target ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget} \
     [StaticMemberAssignmentTarget]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Static_member_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget} \
     [StaticMemberAssignmentTarget]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val _object : t -> [< `Expression | `Super ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget/_object} \
     [_object] on MDN}."]

  val set__object : t -> [< `Expression | `Super ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget/_object} \
     [_object] on MDN}."]

  val property : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget/property} \
     [property] on MDN}."]

  val set_property : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget/property} \
     [property] on MDN}."]
end = struct
  type t = [ `Static_member_assignment_target ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Static_member_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget} \
     [StaticMemberAssignmentTarget]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "StaticMemberAssignmentTarget"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let _object this = Js.of_any (Js.Ffi.get this "_object")
  let set__object this x = Js.Ffi.set this "_object" (Js.to_any x)
  let property this = Identifier_name.of_any (Js.Ffi.get this "property")
  let set_property this x = Js.Ffi.set this "property" (Identifier_name.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberAssignmentTarget} \
   [StaticMemberAssignmentTarget] on MDN}."]

and Array_binding : sig
  type t = [ `Array_binding ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding} \
     [ArrayBinding]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Array_binding | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding} \
     [ArrayBinding]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val elements :
    t -> [< `Binding | `Binding_with_initializer ] Js.nullable array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding/elements} \
     [elements] on MDN}."]

  val set_elements :
    t -> [< `Binding | `Binding_with_initializer ] Js.nullable array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding/elements} \
     [elements] on MDN}."]

  val rest : t -> Binding.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding/rest} \
     [rest] on MDN}."]

  val set_rest : t -> Binding.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding/rest} \
     [rest] on MDN}."]
end = struct
  type t = [ `Array_binding ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Array_binding | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding} \
     [ArrayBinding]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ArrayBinding"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let elements this = (Js.Any.to_array Js.of_any) (Js.Ffi.get this "elements")

  let set_elements this x =
    Js.Ffi.set this "elements" ((Js.Any.of_array Js.to_any) x)

  let rest this =
    (Js.Any.nullable_to_option Binding.of_any) (Js.Ffi.get this "rest")

  let set_rest this x =
    Js.Ffi.set this "rest" ((Js.Any.nullable_of_option Binding.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ArrayBinding} \
   [ArrayBinding] on MDN}."]

and Binding_property_identifier : sig
  type t = [ `Binding_property_identifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier} \
     [BindingPropertyIdentifier]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Binding_property_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier} \
     [BindingPropertyIdentifier]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding : t -> 'a Binding_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Binding_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier/binding} \
     [binding] on MDN}."]

  val init : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier/init} \
     [init] on MDN}."]

  val set_init : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier/init} \
     [init] on MDN}."]
end = struct
  type t = [ `Binding_property_identifier ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Binding_property_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier} \
     [BindingPropertyIdentifier]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "BindingPropertyIdentifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let binding this = Binding_identifier.of_any (Js.Ffi.get this "binding")

  let set_binding this x =
    Js.Ffi.set this "binding" (Binding_identifier.to_any x)

  let init this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "init")

  let set_init this x =
    Js.Ffi.set this "init" ((Js.Any.nullable_of_option Expression.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyIdentifier} \
   [BindingPropertyIdentifier] on MDN}."]

and Binding_property_property : sig
  type t = [ `Binding_property_property ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty} \
     [BindingPropertyProperty]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Binding_property_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty} \
     [BindingPropertyProperty]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty/name} \
     [name] on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty/name} \
     [name] on MDN}."]

  val binding : t -> [< `Binding | `Binding_with_initializer ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty/binding} \
     [binding] on MDN}."]

  val set_binding : t -> [< `Binding | `Binding_with_initializer ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty/binding} \
     [binding] on MDN}."]
end = struct
  type t = [ `Binding_property_property ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Binding_property_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty} \
     [BindingPropertyProperty]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "BindingPropertyProperty"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let binding this = Js.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Js.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/BindingPropertyProperty} \
   [BindingPropertyProperty] on MDN}."]

and Binding_property : sig
  type t

  val with_binding_property_identifier : Binding_property_identifier.t -> t
  val with_binding_property_property : Binding_property_property.t -> t
  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_binding_property_identifier = Js.repr
  let with_binding_property_property = Js.repr
end

and Object_binding : sig
  type t = [ `Object_binding ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectBinding} \
     [ObjectBinding]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Object_binding | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectBinding} \
     [ObjectBinding]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val properties : t -> Binding_property.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectBinding/properties} \
     [properties] on MDN}."]

  val set_properties : t -> Binding_property.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectBinding/properties} \
     [properties] on MDN}."]
end = struct
  type t = [ `Object_binding ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Object_binding | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectBinding} \
     [ObjectBinding]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ObjectBinding"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let properties this =
    (Js.Any.to_array Binding_property.of_any) (Js.Ffi.get this "properties")

  let set_properties this x =
    Js.Ffi.set this "properties" ((Js.Any.of_array Binding_property.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ObjectBinding} \
   [ObjectBinding] on MDN}."]

and Assignment_target_with_initializer : sig
  type t = [ `Assignment_target_with_initializer ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer} \
     [AssignmentTargetWithInitializer]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_with_initializer | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer} \
     [AssignmentTargetWithInitializer]} interface or any base interface that \
     it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding : t -> Assignment_target.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Assignment_target.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer/binding} \
     [binding] on MDN}."]

  val init : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer/init} \
     [init] on MDN}."]

  val set_init : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer/init} \
     [init] on MDN}."]
end = struct
  type t = [ `Assignment_target_with_initializer ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_with_initializer | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer} \
     [AssignmentTargetWithInitializer]} interface or any base interface that \
     it inherits."]

  let t = Js.Ffi.constr "AssignmentTargetWithInitializer"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let binding this = Assignment_target.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Assignment_target.to_any x)
  let init this = Expression.of_any (Js.Ffi.get this "init")
  let set_init this x = Js.Ffi.set this "init" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetWithInitializer} \
   [AssignmentTargetWithInitializer] on MDN}."]

and Array_assignment_target : sig
  type t = [ `Array_assignment_target ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget} \
     [ArrayAssignmentTarget]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Array_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget} \
     [ArrayAssignmentTarget]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val elements :
    t ->
    [< `Assignment_target
    | `Nullable of [ `Assignment_target_with_initializer ] ]
    Js.t
    array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget/elements} \
     [elements] on MDN}."]

  val set_elements :
    t ->
    [< `Assignment_target
    | `Nullable of [ `Assignment_target_with_initializer ] ]
    Js.t
    array ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget/elements} \
     [elements] on MDN}."]

  val rest : t -> Assignment_target.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget/rest} \
     [rest] on MDN}."]

  val set_rest : t -> Assignment_target.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget/rest} \
     [rest] on MDN}."]
end = struct
  type t = [ `Array_assignment_target ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Array_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget} \
     [ArrayAssignmentTarget]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "ArrayAssignmentTarget"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let elements this = (Js.Any.to_array Js.of_any) (Js.Ffi.get this "elements")

  let set_elements this x =
    Js.Ffi.set this "elements" ((Js.Any.of_array Js.to_any) x)

  let rest this =
    (Js.Any.nullable_to_option Assignment_target.of_any) (Js.Ffi.get this "rest")

  let set_rest this x =
    Js.Ffi.set this "rest"
      ((Js.Any.nullable_of_option Assignment_target.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ArrayAssignmentTarget} \
   [ArrayAssignmentTarget] on MDN}."]

and Assignment_target_property_identifier : sig
  type t = [ `Assignment_target_property_identifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier} \
     [AssignmentTargetPropertyIdentifier]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_property_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier} \
     [AssignmentTargetPropertyIdentifier]} interface or any base interface \
     that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding : t -> 'a Assignment_target_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Assignment_target_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier/binding} \
     [binding] on MDN}."]

  val init : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier/init} \
     [init] on MDN}."]

  val set_init : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier/init} \
     [init] on MDN}."]
end = struct
  type t = [ `Assignment_target_property_identifier ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_property_identifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier} \
     [AssignmentTargetPropertyIdentifier]} interface or any base interface \
     that it inherits."]

  let t = Js.Ffi.constr "AssignmentTargetPropertyIdentifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let binding this =
    Assignment_target_identifier.of_any (Js.Ffi.get this "binding")

  let set_binding this x =
    Js.Ffi.set this "binding" (Assignment_target_identifier.to_any x)

  let init this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "init")

  let set_init this x =
    Js.Ffi.set this "init" ((Js.Any.nullable_of_option Expression.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyIdentifier} \
   [AssignmentTargetPropertyIdentifier] on MDN}."]

and Assignment_target_property_property : sig
  type t = [ `Assignment_target_property_property ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty} \
     [AssignmentTargetPropertyProperty]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_property_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty} \
     [AssignmentTargetPropertyProperty]} interface or any base interface that \
     it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty/name} \
     [name] on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty/name} \
     [name] on MDN}."]

  val binding :
    t -> [< `Assignment_target | `Assignment_target_with_initializer ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty/binding} \
     [binding] on MDN}."]

  val set_binding :
    t ->
    [< `Assignment_target | `Assignment_target_with_initializer ] Js.t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty/binding} \
     [binding] on MDN}."]
end = struct
  type t = [ `Assignment_target_property_property ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Assignment_target_property_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty} \
     [AssignmentTargetPropertyProperty]} interface or any base interface that \
     it inherits."]

  let t = Js.Ffi.constr "AssignmentTargetPropertyProperty"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let binding this = Js.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Js.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssignmentTargetPropertyProperty} \
   [AssignmentTargetPropertyProperty] on MDN}."]

and Assignment_target_property : sig
  type t

  val with_assignment_target_property_identifier :
    Assignment_target_property_identifier.t -> t

  val with_assignment_target_property_property :
    Assignment_target_property_property.t -> t

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end = struct
  type t = Js.t

  let to_any this = Js.Any.of_fun 42 this
  let of_any this = Js.Any.of_fun 42 this
  let with_assignment_target_property_identifier = Js.repr
  let with_assignment_target_property_property = Js.repr
end

and Object_assignment_target : sig
  type t = [ `Object_assignment_target ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectAssignmentTarget} \
     [ObjectAssignmentTarget]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Object_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectAssignmentTarget} \
     [ObjectAssignmentTarget]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val properties : t -> Assignment_target_property.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectAssignmentTarget/properties} \
     [properties] on MDN}."]

  val set_properties : t -> Assignment_target_property.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectAssignmentTarget/properties} \
     [properties] on MDN}."]
end = struct
  type t = [ `Object_assignment_target ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Object_assignment_target | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectAssignmentTarget} \
     [ObjectAssignmentTarget]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "ObjectAssignmentTarget"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let properties this =
    (Js.Any.to_array Assignment_target_property.of_any)
      (Js.Ffi.get this "properties")

  let set_properties this x =
    Js.Ffi.set this "properties"
      ((Js.Any.of_array Assignment_target_property.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ObjectAssignmentTarget} \
   [ObjectAssignmentTarget] on MDN}."]

and Class_expression : sig
  type t = [ `Class_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression} \
     [ClassExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Class_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression} \
     [ClassExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> 'a Binding_identifier.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression/name} \
     [name] on MDN}."]

  val set_name : t -> Binding_identifier.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression/name} \
     [name] on MDN}."]

  val super : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression/super} \
     [super] on MDN}."]

  val set_super : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression/super} \
     [super] on MDN}."]

  val elements : t -> Class_element.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression/elements} \
     [elements] on MDN}."]

  val set_elements : t -> Class_element.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression/elements} \
     [elements] on MDN}."]
end = struct
  type t = [ `Class_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Class_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression} \
     [ClassExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ClassExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let name this =
    (Js.Any.nullable_to_option Binding_identifier.of_any)
      (Js.Ffi.get this "name")

  let set_name this x =
    Js.Ffi.set this "name"
      ((Js.Any.nullable_of_option Binding_identifier.to_any) x)

  let super this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "super")

  let set_super this x =
    Js.Ffi.set this "super" ((Js.Any.nullable_of_option Expression.to_any) x)

  let elements this =
    (Js.Any.to_array Class_element.of_any) (Js.Ffi.get this "elements")

  let set_elements this x =
    Js.Ffi.set this "elements" ((Js.Any.of_array Class_element.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ClassExpression} \
   [ClassExpression] on MDN}."]

and Class_declaration : sig
  type t = [ `Class_declaration ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration} \
     [ClassDeclaration]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Class_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration} \
     [ClassDeclaration]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> 'a Binding_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration/name} \
     [name] on MDN}."]

  val set_name : t -> Binding_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration/name} \
     [name] on MDN}."]

  val super : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration/super} \
     [super] on MDN}."]

  val set_super : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration/super} \
     [super] on MDN}."]

  val elements : t -> Class_element.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration/elements} \
     [elements] on MDN}."]

  val set_elements : t -> Class_element.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration/elements} \
     [elements] on MDN}."]
end = struct
  type t = [ `Class_declaration ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Class_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration} \
     [ClassDeclaration]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ClassDeclaration"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Binding_identifier.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Binding_identifier.to_any x)

  let super this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "super")

  let set_super this x =
    Js.Ffi.set this "super" ((Js.Any.nullable_of_option Expression.to_any) x)

  let elements this =
    (Js.Any.to_array Class_element.of_any) (Js.Ffi.get this "elements")

  let set_elements this x =
    Js.Ffi.set this "elements" ((Js.Any.of_array Class_element.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ClassDeclaration} \
   [ClassDeclaration] on MDN}."]

and Class_element : sig
  type t = [ `Class_element ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement} \
     [ClassElement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Class_element | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement} \
     [ClassElement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_static : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement/isStatic} \
     [isStatic] on MDN}."]

  val set_is_static : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement/isStatic} \
     [isStatic] on MDN}."]

  val method' : t -> Method_definition.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement/method} \
     [method] on MDN}."]

  val set_method : t -> Method_definition.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement/method} \
     [method] on MDN}."]
end = struct
  type t = [ `Class_element ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Class_element | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ClassElement} \
     [ClassElement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ClassElement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_static this = Js.Any.to_bool (Js.Ffi.get this "isStatic")
  let set_is_static this x = Js.Ffi.set this "isStatic" (Js.Any.of_bool x)
  let method' this = Method_definition.of_any (Js.Ffi.get this "method")
  let set_method this x = Js.Ffi.set this "method" (Method_definition.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ClassElement} \
   [ClassElement] on MDN}."]

and Module : sig
  type t = [ `Module ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Module} [Module]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Module | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Module} [Module]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Module/scope} \
     [scope] on MDN}."]

  val set_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Module/scope} \
     [scope] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Module/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Module/directives} \
     [directives] on MDN}."]

  val items :
    t -> [< `Import_declaration | `Export_declaration | `Statement ] Js.t array
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Module/items} \
     [items] on MDN}."]

  val set_items :
    t ->
    [< `Import_declaration | `Export_declaration | `Statement ] Js.t array ->
    unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Module/items} \
     [items] on MDN}."]
end = struct
  type t = [ `Module ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Module | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Module} [Module]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Module"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let scope this = Asserted_var_scope.of_any (Js.Ffi.get this "scope")
  let set_scope this x = Js.Ffi.set this "scope" (Asserted_var_scope.to_any x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let items this = (Js.Any.to_array Js.of_any) (Js.Ffi.get this "items")
  let set_items this x = Js.Ffi.set this "items" ((Js.Any.of_array Js.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Module} [Module] \
   on MDN}."]

and Import : sig
  type t = [ `Import ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import} [Import]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Import | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import} [Import]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val module_specifier : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]

  val set_module_specifier : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]

  val default_binding : t -> 'a Binding_identifier.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import/defaultBinding} \
     [defaultBinding] on MDN}."]

  val set_default_binding : t -> Binding_identifier.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import/defaultBinding} \
     [defaultBinding] on MDN}."]

  val named_imports : t -> Import_specifier.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import/namedImports} \
     [namedImports] on MDN}."]

  val set_named_imports : t -> Import_specifier.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import/namedImports} \
     [namedImports] on MDN}."]
end = struct
  type t = [ `Import ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Import | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Import} [Import]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Import"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let module_specifier this = String.of_any (Js.Ffi.get this "moduleSpecifier")

  let set_module_specifier this x =
    Js.Ffi.set this "moduleSpecifier" (String.to_any x)

  let default_binding this =
    (Js.Any.nullable_to_option Binding_identifier.of_any)
      (Js.Ffi.get this "defaultBinding")

  let set_default_binding this x =
    Js.Ffi.set this "defaultBinding"
      ((Js.Any.nullable_of_option Binding_identifier.to_any) x)

  let named_imports this =
    (Js.Any.to_array Import_specifier.of_any) (Js.Ffi.get this "namedImports")

  let set_named_imports this x =
    Js.Ffi.set this "namedImports" ((Js.Any.of_array Import_specifier.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Import} [Import] \
   on MDN}."]

and Import_namespace : sig
  type t = [ `Import_namespace ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace} \
     [ImportNamespace]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Import_namespace | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace} \
     [ImportNamespace]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val module_specifier : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]

  val set_module_specifier : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]

  val default_binding : t -> 'a Binding_identifier.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace/defaultBinding} \
     [defaultBinding] on MDN}."]

  val set_default_binding : t -> Binding_identifier.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace/defaultBinding} \
     [defaultBinding] on MDN}."]

  val namespace_binding : t -> 'a Binding_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace/namespaceBinding} \
     [namespaceBinding] on MDN}."]

  val set_namespace_binding : t -> Binding_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace/namespaceBinding} \
     [namespaceBinding] on MDN}."]
end = struct
  type t = [ `Import_namespace ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Import_namespace | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace} \
     [ImportNamespace]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ImportNamespace"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let module_specifier this = String.of_any (Js.Ffi.get this "moduleSpecifier")

  let set_module_specifier this x =
    Js.Ffi.set this "moduleSpecifier" (String.to_any x)

  let default_binding this =
    (Js.Any.nullable_to_option Binding_identifier.of_any)
      (Js.Ffi.get this "defaultBinding")

  let set_default_binding this x =
    Js.Ffi.set this "defaultBinding"
      ((Js.Any.nullable_of_option Binding_identifier.to_any) x)

  let namespace_binding this =
    Binding_identifier.of_any (Js.Ffi.get this "namespaceBinding")

  let set_namespace_binding this x =
    Js.Ffi.set this "namespaceBinding" (Binding_identifier.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ImportNamespace} \
   [ImportNamespace] on MDN}."]

and Import_specifier : sig
  type t = [ `Import_specifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier} \
     [ImportSpecifier]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Import_specifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier} \
     [ImportSpecifier]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Identifier_name.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier/name} \
     [name] on MDN}."]

  val binding : t -> 'a Binding_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Binding_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier/binding} \
     [binding] on MDN}."]
end = struct
  type t = [ `Import_specifier ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Import_specifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier} \
     [ImportSpecifier]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ImportSpecifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let name this =
    (Js.Any.nullable_to_option Identifier_name.of_any) (Js.Ffi.get this "name")

  let set_name this x =
    Js.Ffi.set this "name" ((Js.Any.nullable_of_option Identifier_name.to_any) x)

  let binding this = Binding_identifier.of_any (Js.Ffi.get this "binding")

  let set_binding this x =
    Js.Ffi.set this "binding" (Binding_identifier.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ImportSpecifier} \
   [ImportSpecifier] on MDN}."]

and Export_all_from : sig
  type t = [ `Export_all_from ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportAllFrom} \
     [ExportAllFrom]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export_all_from | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportAllFrom} \
     [ExportAllFrom]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val module_specifier : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportAllFrom/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]

  val set_module_specifier : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportAllFrom/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]
end = struct
  type t = [ `Export_all_from ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export_all_from | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportAllFrom} \
     [ExportAllFrom]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExportAllFrom"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let module_specifier this = String.of_any (Js.Ffi.get this "moduleSpecifier")

  let set_module_specifier this x =
    Js.Ffi.set this "moduleSpecifier" (String.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ExportAllFrom} \
   [ExportAllFrom] on MDN}."]

and Export_from : sig
  type t = [ `Export_from ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom} \
     [ExportFrom]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export_from | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom} \
     [ExportFrom]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val named_exports : t -> Export_from_specifier.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom/namedExports} \
     [namedExports] on MDN}."]

  val set_named_exports : t -> Export_from_specifier.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom/namedExports} \
     [namedExports] on MDN}."]

  val module_specifier : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]

  val set_module_specifier : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom/moduleSpecifier} \
     [moduleSpecifier] on MDN}."]
end = struct
  type t = [ `Export_from ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export_from | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom} \
     [ExportFrom]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExportFrom"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let named_exports this =
    (Js.Any.to_array Export_from_specifier.of_any)
      (Js.Ffi.get this "namedExports")

  let set_named_exports this x =
    Js.Ffi.set this "namedExports"
      ((Js.Any.of_array Export_from_specifier.to_any) x)

  let module_specifier this = String.of_any (Js.Ffi.get this "moduleSpecifier")

  let set_module_specifier this x =
    Js.Ffi.set this "moduleSpecifier" (String.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ExportFrom} \
   [ExportFrom] on MDN}."]

and Export_locals : sig
  type t = [ `Export_locals ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocals} \
     [ExportLocals]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export_locals | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocals} \
     [ExportLocals]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val named_exports : t -> Export_local_specifier.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocals/namedExports} \
     [namedExports] on MDN}."]

  val set_named_exports : t -> Export_local_specifier.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocals/namedExports} \
     [namedExports] on MDN}."]
end = struct
  type t = [ `Export_locals ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export_locals | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocals} \
     [ExportLocals]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExportLocals"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let named_exports this =
    (Js.Any.to_array Export_local_specifier.of_any)
      (Js.Ffi.get this "namedExports")

  let set_named_exports this x =
    Js.Ffi.set this "namedExports"
      ((Js.Any.of_array Export_local_specifier.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ExportLocals} \
   [ExportLocals] on MDN}."]

and Export : sig
  type t = [ `Export ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Export} [Export]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Export} [Export]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val declaration :
    t ->
    [< `Function_declaration | `Class_declaration | `Variable_declaration ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Export/declaration} \
     [declaration] on MDN}."]

  val set_declaration :
    t ->
    [< `Function_declaration | `Class_declaration | `Variable_declaration ] Js.t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Export/declaration} \
     [declaration] on MDN}."]
end = struct
  type t = [ `Export ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Export} [Export]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Export"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let declaration this = Js.of_any (Js.Ffi.get this "declaration")
  let set_declaration this x = Js.Ffi.set this "declaration" (Js.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Export} [Export] \
   on MDN}."]

and Export_default : sig
  type t = [ `Export_default ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportDefault} \
     [ExportDefault]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export_default | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportDefault} \
     [ExportDefault]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val body :
    t -> [< `Function_declaration | `Class_declaration | `Expression ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportDefault/body} \
     [body] on MDN}."]

  val set_body :
    t ->
    [< `Function_declaration | `Class_declaration | `Expression ] Js.t ->
    unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportDefault/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Export_default ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export_default | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportDefault} \
     [ExportDefault]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExportDefault"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let body this = Js.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Js.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ExportDefault} \
   [ExportDefault] on MDN}."]

and Export_from_specifier : sig
  type t = [ `Export_from_specifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier} \
     [ExportFromSpecifier]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export_from_specifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier} \
     [ExportFromSpecifier]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier/name} \
     [name] on MDN}."]

  val exported_name : t -> Identifier_name.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier/exportedName} \
     [exportedName] on MDN}."]

  val set_exported_name : t -> Identifier_name.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier/exportedName} \
     [exportedName] on MDN}."]
end = struct
  type t = [ `Export_from_specifier ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export_from_specifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier} \
     [ExportFromSpecifier]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExportFromSpecifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Identifier_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_name.to_any x)

  let exported_name this =
    (Js.Any.nullable_to_option Identifier_name.of_any)
      (Js.Ffi.get this "exportedName")

  let set_exported_name this x =
    Js.Ffi.set this "exportedName"
      ((Js.Any.nullable_of_option Identifier_name.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ExportFromSpecifier} \
   [ExportFromSpecifier] on MDN}."]

and Export_local_specifier : sig
  type t = [ `Export_local_specifier ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier} \
     [ExportLocalSpecifier]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Export_local_specifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier} \
     [ExportLocalSpecifier]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> 'a Identifier_expression.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier/name} \
     [name] on MDN}."]

  val exported_name : t -> Identifier_name.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier/exportedName} \
     [exportedName] on MDN}."]

  val set_exported_name : t -> Identifier_name.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier/exportedName} \
     [exportedName] on MDN}."]
end = struct
  type t = [ `Export_local_specifier ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Export_local_specifier | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier} \
     [ExportLocalSpecifier]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExportLocalSpecifier"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Identifier_expression.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_expression.to_any x)

  let exported_name this =
    (Js.Any.nullable_to_option Identifier_name.of_any)
      (Js.Ffi.get this "exportedName")

  let set_exported_name this x =
    Js.Ffi.set this "exportedName"
      ((Js.Any.nullable_of_option Identifier_name.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ExportLocalSpecifier} \
   [ExportLocalSpecifier] on MDN}."]

and Eager_method : sig
  type t = [ `Eager_method ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod} \
     [EagerMethod]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Eager_method | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod} \
     [EagerMethod]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/isAsync} \
     [isAsync] on MDN}."]

  val is_generator : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/isGenerator} \
     [isGenerator] on MDN}."]

  val set_is_generator : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/isGenerator} \
     [isGenerator] on MDN}."]

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/name} [name] \
     on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/name} [name] \
     on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Function_or_method_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Function_or_method_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_method ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Eager_method | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod} \
     [EagerMethod]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "EagerMethod"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let is_generator this = Js.Any.to_bool (Js.Ffi.get this "isGenerator")
  let set_is_generator this x = Js.Ffi.set this "isGenerator" (Js.Any.of_bool x)
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Function_or_method_contents.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents" (Function_or_method_contents.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/EagerMethod} \
   [EagerMethod] on MDN}."]

and Lazy_method : sig
  type t = [ `Lazy_method ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod} \
     [LazyMethod]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_method | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod} \
     [LazyMethod]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/isAsync} \
     [isAsync] on MDN}."]

  val is_generator : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/isGenerator} \
     [isGenerator] on MDN}."]

  val set_is_generator : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/isGenerator} \
     [isGenerator] on MDN}."]

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/name} \
     [name] on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/name} \
     [name] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Function_or_method_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Function_or_method_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_method ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_method | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod} \
     [LazyMethod]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "LazyMethod"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let is_generator this = Js.Any.to_bool (Js.Ffi.get this "isGenerator")
  let set_is_generator this x = Js.Ffi.set this "isGenerator" (Js.Any.of_bool x)
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Function_or_method_contents.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents" (Function_or_method_contents.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazyMethod} \
   [LazyMethod] on MDN}."]

and Eager_getter : sig
  type t = [ `Eager_getter ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter} \
     [EagerGetter]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Eager_getter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter} \
     [EagerGetter]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter/name} [name] \
     on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter/name} [name] \
     on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Getter_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Getter_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_getter ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Eager_getter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter} \
     [EagerGetter]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "EagerGetter"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this = Getter_contents.of_any (Js.Ffi.get this "contents")
  let set_contents this x = Js.Ffi.set this "contents" (Getter_contents.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/EagerGetter} \
   [EagerGetter] on MDN}."]

and Lazy_getter : sig
  type t = [ `Lazy_getter ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter} \
     [LazyGetter]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_getter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter} \
     [LazyGetter]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter/name} \
     [name] on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter/name} \
     [name] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Getter_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Getter_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_getter ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_getter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter} \
     [LazyGetter]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "LazyGetter"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this = Getter_contents.of_any (Js.Ffi.get this "contents")
  let set_contents this x = Js.Ffi.set this "contents" (Getter_contents.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazyGetter} \
   [LazyGetter] on MDN}."]

and Getter_contents : sig
  type t = [ `Getter_contents ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents} \
     [GetterContents]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Getter_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents} \
     [GetterContents]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_this_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val set_is_this_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val body_scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents/bodyScope} \
     [bodyScope] on MDN}."]

  val set_body_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents/bodyScope} \
     [bodyScope] on MDN}."]

  val body : t -> Function_body.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents/body} \
     [body] on MDN}."]

  val set_body : t -> Function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Getter_contents ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Getter_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/GetterContents} \
     [GetterContents]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "GetterContents"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_this_captured this = Js.Any.to_bool (Js.Ffi.get this "isThisCaptured")

  let set_is_this_captured this x =
    Js.Ffi.set this "isThisCaptured" (Js.Any.of_bool x)

  let body_scope this = Asserted_var_scope.of_any (Js.Ffi.get this "bodyScope")

  let set_body_scope this x =
    Js.Ffi.set this "bodyScope" (Asserted_var_scope.to_any x)

  let body this = Function_body.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Function_body.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/GetterContents} \
   [GetterContents] on MDN}."]

and Eager_setter : sig
  type t = [ `Eager_setter ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter} \
     [EagerSetter]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Eager_setter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter} \
     [EagerSetter]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/name} [name] \
     on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/name} [name] \
     on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Setter_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Setter_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_setter ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Eager_setter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter} \
     [EagerSetter]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "EagerSetter"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this = Setter_contents.of_any (Js.Ffi.get this "contents")
  let set_contents this x = Js.Ffi.set this "contents" (Setter_contents.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/EagerSetter} \
   [EagerSetter] on MDN}."]

and Lazy_setter : sig
  type t = [ `Lazy_setter ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter} \
     [LazySetter]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_setter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter} \
     [LazySetter]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/name} \
     [name] on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/name} \
     [name] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Setter_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Setter_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_setter ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_setter | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazySetter} \
     [LazySetter]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "LazySetter"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this = Setter_contents.of_any (Js.Ffi.get this "contents")
  let set_contents this x = Js.Ffi.set this "contents" (Setter_contents.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LazySetter} \
   [LazySetter] on MDN}."]

and Setter_contents : sig
  type t = [ `Setter_contents ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents} \
     [SetterContents]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Setter_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents} \
     [SetterContents]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_this_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val set_is_this_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val parameter_scope : t -> Asserted_parameter_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/parameterScope} \
     [parameterScope] on MDN}."]

  val set_parameter_scope : t -> Asserted_parameter_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/parameterScope} \
     [parameterScope] on MDN}."]

  val param : t -> Parameter.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/param} \
     [param] on MDN}."]

  val set_param : t -> Parameter.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/param} \
     [param] on MDN}."]

  val body_scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/bodyScope} \
     [bodyScope] on MDN}."]

  val set_body_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/bodyScope} \
     [bodyScope] on MDN}."]

  val body : t -> Function_body.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/body} \
     [body] on MDN}."]

  val set_body : t -> Function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Setter_contents ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Setter_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SetterContents} \
     [SetterContents]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "SetterContents"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_this_captured this = Js.Any.to_bool (Js.Ffi.get this "isThisCaptured")

  let set_is_this_captured this x =
    Js.Ffi.set this "isThisCaptured" (Js.Any.of_bool x)

  let parameter_scope this =
    Asserted_parameter_scope.of_any (Js.Ffi.get this "parameterScope")

  let set_parameter_scope this x =
    Js.Ffi.set this "parameterScope" (Asserted_parameter_scope.to_any x)

  let param this = Parameter.of_any (Js.Ffi.get this "param")
  let set_param this x = Js.Ffi.set this "param" (Parameter.to_any x)
  let body_scope this = Asserted_var_scope.of_any (Js.Ffi.get this "bodyScope")

  let set_body_scope this x =
    Js.Ffi.set this "bodyScope" (Asserted_var_scope.to_any x)

  let body this = Function_body.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Function_body.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SetterContents} \
   [SetterContents] on MDN}."]

and Data_property : sig
  type t = [ `Data_property ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty} \
     [DataProperty]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Data_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty} \
     [DataProperty]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Property_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty/name} \
     [name] on MDN}."]

  val set_name : t -> Property_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty/name} \
     [name] on MDN}."]

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Data_property ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Data_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DataProperty} \
     [DataProperty]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "DataProperty"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Property_name.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Property_name.to_any x)
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DataProperty} \
   [DataProperty] on MDN}."]

and Shorthand_property : sig
  type t = [ `Shorthand_property ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShorthandProperty} \
     [ShorthandProperty]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Shorthand_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShorthandProperty} \
     [ShorthandProperty]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> 'a Identifier_expression.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShorthandProperty/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier_expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShorthandProperty/name} \
     [name] on MDN}."]
end = struct
  type t = [ `Shorthand_property ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Shorthand_property | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ShorthandProperty} \
     [ShorthandProperty]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ShorthandProperty"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Identifier_expression.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier_expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ShorthandProperty} \
   [ShorthandProperty] on MDN}."]

and Computed_property_name : sig
  type t = [ `Computed_property_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedPropertyName} \
     [ComputedPropertyName]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Computed_property_name | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedPropertyName} \
     [ComputedPropertyName]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedPropertyName/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedPropertyName/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Computed_property_name ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Computed_property_name | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedPropertyName} \
     [ComputedPropertyName]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ComputedPropertyName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ComputedPropertyName} \
   [ComputedPropertyName] on MDN}."]

and Literal_property_name : sig
  type t = [ `Literal_property_name ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralPropertyName} \
     [LiteralPropertyName]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Literal_property_name | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralPropertyName} \
     [LiteralPropertyName]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val value : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralPropertyName/value} \
     [value] on MDN}."]

  val set_value : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralPropertyName/value} \
     [value] on MDN}."]
end = struct
  type t = [ `Literal_property_name ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Literal_property_name | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralPropertyName} \
     [LiteralPropertyName]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "LiteralPropertyName"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let value this = String.of_any (Js.Ffi.get this "value")
  let set_value this x = Js.Ffi.set this "value" (String.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralPropertyName} \
   [LiteralPropertyName] on MDN}."]

and Literal_boolean_expression : sig
  type t = [ `Literal_boolean_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralBooleanExpression} \
     [LiteralBooleanExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_boolean_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralBooleanExpression} \
     [LiteralBooleanExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val value : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralBooleanExpression/value} \
     [value] on MDN}."]

  val set_value : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralBooleanExpression/value} \
     [value] on MDN}."]
end = struct
  type t = [ `Literal_boolean_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_boolean_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralBooleanExpression} \
     [LiteralBooleanExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LiteralBooleanExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let value this = Js.Any.to_bool (Js.Ffi.get this "value")
  let set_value this x = Js.Ffi.set this "value" (Js.Any.of_bool x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralBooleanExpression} \
   [LiteralBooleanExpression] on MDN}."]

and Literal_infinity_expression : sig
  type t = [ `Literal_infinity_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralInfinityExpression} \
     [LiteralInfinityExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_infinity_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralInfinityExpression} \
     [LiteralInfinityExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Literal_infinity_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_infinity_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralInfinityExpression} \
     [LiteralInfinityExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LiteralInfinityExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralInfinityExpression} \
   [LiteralInfinityExpression] on MDN}."]

and Literal_null_expression : sig
  type t = [ `Literal_null_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNullExpression} \
     [LiteralNullExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Literal_null_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNullExpression} \
     [LiteralNullExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Literal_null_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Literal_null_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNullExpression} \
     [LiteralNullExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LiteralNullExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralNullExpression} \
   [LiteralNullExpression] on MDN}."]

and Literal_numeric_expression : sig
  type t = [ `Literal_numeric_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNumericExpression} \
     [LiteralNumericExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_numeric_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNumericExpression} \
     [LiteralNumericExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val value : t -> float
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNumericExpression/value} \
     [value] on MDN}."]

  val set_value : t -> float -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNumericExpression/value} \
     [value] on MDN}."]
end = struct
  type t = [ `Literal_numeric_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_numeric_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralNumericExpression} \
     [LiteralNumericExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LiteralNumericExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let value this = Js.Any.to_float (Js.Ffi.get this "value")
  let set_value this x = Js.Ffi.set this "value" (Js.Any.of_float x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralNumericExpression} \
   [LiteralNumericExpression] on MDN}."]

and Literal_reg_exp_expression : sig
  type t = [ `Literal_reg_exp_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression} \
     [LiteralRegExpExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_reg_exp_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression} \
     [LiteralRegExpExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val pattern : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression/pattern} \
     [pattern] on MDN}."]

  val set_pattern : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression/pattern} \
     [pattern] on MDN}."]

  val flags : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression/flags} \
     [flags] on MDN}."]

  val set_flags : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression/flags} \
     [flags] on MDN}."]
end = struct
  type t = [ `Literal_reg_exp_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Literal_reg_exp_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression} \
     [LiteralRegExpExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LiteralRegExpExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let pattern this = String.of_any (Js.Ffi.get this "pattern")
  let set_pattern this x = Js.Ffi.set this "pattern" (String.to_any x)
  let flags this = String.of_any (Js.Ffi.get this "flags")
  let set_flags this x = Js.Ffi.set this "flags" (String.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralRegExpExpression} \
   [LiteralRegExpExpression] on MDN}."]

and Literal_string_expression : sig
  type t = [ `Literal_string_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralStringExpression} \
     [LiteralStringExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Literal_string_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralStringExpression} \
     [LiteralStringExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val value : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralStringExpression/value} \
     [value] on MDN}."]

  val set_value : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralStringExpression/value} \
     [value] on MDN}."]
end = struct
  type t = [ `Literal_string_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Literal_string_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LiteralStringExpression} \
     [LiteralStringExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LiteralStringExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let value this = String.of_any (Js.Ffi.get this "value")
  let set_value this x = Js.Ffi.set this "value" (String.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LiteralStringExpression} \
   [LiteralStringExpression] on MDN}."]

and Array_expression : sig
  type t = [ `Array_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayExpression} \
     [ArrayExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Array_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayExpression} \
     [ArrayExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val elements : t -> [< `Spread_element | `Expression ] Js.nullable array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayExpression/elements} \
     [elements] on MDN}."]

  val set_elements :
    t -> [< `Spread_element | `Expression ] Js.nullable array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayExpression/elements} \
     [elements] on MDN}."]
end = struct
  type t = [ `Array_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Array_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrayExpression} \
     [ArrayExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ArrayExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let elements this = (Js.Any.to_array Js.of_any) (Js.Ffi.get this "elements")

  let set_elements this x =
    Js.Ffi.set this "elements" ((Js.Any.of_array Js.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ArrayExpression} \
   [ArrayExpression] on MDN}."]

and Eager_arrow_expression_with_function_body : sig
  type t = [ `Eager_arrow_expression_with_function_body ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody} \
     [EagerArrowExpressionWithFunctionBody]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Eager_arrow_expression_with_function_body | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody} \
     [EagerArrowExpressionWithFunctionBody]} interface or any base interface \
     that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/isAsync} \
     [isAsync] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Arrow_expression_contents_with_function_body.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Arrow_expression_contents_with_function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_arrow_expression_with_function_body ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Eager_arrow_expression_with_function_body | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody} \
     [EagerArrowExpressionWithFunctionBody]} interface or any base interface \
     that it inherits."]

  let t = Js.Ffi.constr "EagerArrowExpressionWithFunctionBody"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Arrow_expression_contents_with_function_body.of_any
      (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents"
      (Arrow_expression_contents_with_function_body.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithFunctionBody} \
   [EagerArrowExpressionWithFunctionBody] on MDN}."]

and Lazy_arrow_expression_with_function_body : sig
  type t = [ `Lazy_arrow_expression_with_function_body ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody} \
     [LazyArrowExpressionWithFunctionBody]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Lazy_arrow_expression_with_function_body | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody} \
     [LazyArrowExpressionWithFunctionBody]} interface or any base interface \
     that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/isAsync} \
     [isAsync] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Arrow_expression_contents_with_function_body.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Arrow_expression_contents_with_function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_arrow_expression_with_function_body ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Lazy_arrow_expression_with_function_body | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody} \
     [LazyArrowExpressionWithFunctionBody]} interface or any base interface \
     that it inherits."]

  let t = Js.Ffi.constr "LazyArrowExpressionWithFunctionBody"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Arrow_expression_contents_with_function_body.of_any
      (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents"
      (Arrow_expression_contents_with_function_body.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithFunctionBody} \
   [LazyArrowExpressionWithFunctionBody] on MDN}."]

and Eager_arrow_expression_with_expression : sig
  type t = [ `Eager_arrow_expression_with_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression} \
     [EagerArrowExpressionWithExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Eager_arrow_expression_with_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression} \
     [EagerArrowExpressionWithExpression]} interface or any base interface \
     that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression/isAsync} \
     [isAsync] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression/length} \
     [length] on MDN}."]

  val contents : t -> 'a Arrow_expression_contents_with_expression.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Arrow_expression_contents_with_expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_arrow_expression_with_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Eager_arrow_expression_with_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression} \
     [EagerArrowExpressionWithExpression]} interface or any base interface \
     that it inherits."]

  let t = Js.Ffi.constr "EagerArrowExpressionWithExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let contents this =
    Arrow_expression_contents_with_expression.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents"
      (Arrow_expression_contents_with_expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/EagerArrowExpressionWithExpression} \
   [EagerArrowExpressionWithExpression] on MDN}."]

and Lazy_arrow_expression_with_expression : sig
  type t = [ `Lazy_arrow_expression_with_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression} \
     [LazyArrowExpressionWithExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Lazy_arrow_expression_with_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression} \
     [LazyArrowExpressionWithExpression]} interface or any base interface that \
     it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression/isAsync} \
     [isAsync] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression/length} \
     [length] on MDN}."]

  val contents : t -> 'a Arrow_expression_contents_with_expression.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Arrow_expression_contents_with_expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_arrow_expression_with_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Lazy_arrow_expression_with_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression} \
     [LazyArrowExpressionWithExpression]} interface or any base interface that \
     it inherits."]

  let t = Js.Ffi.constr "LazyArrowExpressionWithExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let contents this =
    Arrow_expression_contents_with_expression.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents"
      (Arrow_expression_contents_with_expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LazyArrowExpressionWithExpression} \
   [LazyArrowExpressionWithExpression] on MDN}."]

and Arrow_expression_contents_with_function_body : sig
  type t = [ `Arrow_expression_contents_with_function_body ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody} \
     [ArrowExpressionContentsWithFunctionBody]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Arrow_expression_contents_with_function_body | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody} \
     [ArrowExpressionContentsWithFunctionBody]} interface or any base \
     interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val parameter_scope : t -> Asserted_parameter_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/parameterScope} \
     [parameterScope] on MDN}."]

  val set_parameter_scope : t -> Asserted_parameter_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/parameterScope} \
     [parameterScope] on MDN}."]

  val params : t -> 'a Formal_parameters.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/params} \
     [params] on MDN}."]

  val set_params : t -> Formal_parameters.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/params} \
     [params] on MDN}."]

  val body_scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/bodyScope} \
     [bodyScope] on MDN}."]

  val set_body_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/bodyScope} \
     [bodyScope] on MDN}."]

  val body : t -> Function_body.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/body} \
     [body] on MDN}."]

  val set_body : t -> Function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Arrow_expression_contents_with_function_body ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Arrow_expression_contents_with_function_body | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody} \
     [ArrowExpressionContentsWithFunctionBody]} interface or any base \
     interface that it inherits."]

  let t = Js.Ffi.constr "ArrowExpressionContentsWithFunctionBody"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let parameter_scope this =
    Asserted_parameter_scope.of_any (Js.Ffi.get this "parameterScope")

  let set_parameter_scope this x =
    Js.Ffi.set this "parameterScope" (Asserted_parameter_scope.to_any x)

  let params this = Formal_parameters.of_any (Js.Ffi.get this "params")
  let set_params this x = Js.Ffi.set this "params" (Formal_parameters.to_any x)
  let body_scope this = Asserted_var_scope.of_any (Js.Ffi.get this "bodyScope")

  let set_body_scope this x =
    Js.Ffi.set this "bodyScope" (Asserted_var_scope.to_any x)

  let body this = Function_body.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Function_body.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithFunctionBody} \
   [ArrowExpressionContentsWithFunctionBody] on MDN}."]

and Arrow_expression_contents_with_expression : sig
  type t = [ `Arrow_expression_contents_with_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression} \
     [ArrowExpressionContentsWithExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Arrow_expression_contents_with_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression} \
     [ArrowExpressionContentsWithExpression]} interface or any base interface \
     that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val parameter_scope : t -> Asserted_parameter_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/parameterScope} \
     [parameterScope] on MDN}."]

  val set_parameter_scope : t -> Asserted_parameter_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/parameterScope} \
     [parameterScope] on MDN}."]

  val params : t -> 'a Formal_parameters.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/params} \
     [params] on MDN}."]

  val set_params : t -> Formal_parameters.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/params} \
     [params] on MDN}."]

  val body_scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/bodyScope} \
     [bodyScope] on MDN}."]

  val set_body_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/bodyScope} \
     [bodyScope] on MDN}."]

  val body : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/body} \
     [body] on MDN}."]

  val set_body : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Arrow_expression_contents_with_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Arrow_expression_contents_with_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression} \
     [ArrowExpressionContentsWithExpression]} interface or any base interface \
     that it inherits."]

  let t = Js.Ffi.constr "ArrowExpressionContentsWithExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let parameter_scope this =
    Asserted_parameter_scope.of_any (Js.Ffi.get this "parameterScope")

  let set_parameter_scope this x =
    Js.Ffi.set this "parameterScope" (Asserted_parameter_scope.to_any x)

  let params this = Formal_parameters.of_any (Js.Ffi.get this "params")
  let set_params this x = Js.Ffi.set this "params" (Formal_parameters.to_any x)
  let body_scope this = Asserted_var_scope.of_any (Js.Ffi.get this "bodyScope")

  let set_body_scope this x =
    Js.Ffi.set this "bodyScope" (Asserted_var_scope.to_any x)

  let body this = Expression.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ArrowExpressionContentsWithExpression} \
   [ArrowExpressionContentsWithExpression] on MDN}."]

and Assignment_expression : sig
  type t = [ `Assignment_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression} \
     [AssignmentExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Assignment_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression} \
     [AssignmentExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding : t -> Assignment_target.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Assignment_target.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression/binding} \
     [binding] on MDN}."]

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Assignment_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Assignment_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression} \
     [AssignmentExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "AssignmentExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let binding this = Assignment_target.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Assignment_target.to_any x)
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/AssignmentExpression} \
   [AssignmentExpression] on MDN}."]

and Binary_expression : sig
  type t = [ `Binary_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression} \
     [BinaryExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Binary_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression} \
     [BinaryExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val operator : t -> Binary_operator.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression/operator} \
     [operator] on MDN}."]

  val set_operator : t -> Binary_operator.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression/operator} \
     [operator] on MDN}."]

  val left : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression/left} \
     [left] on MDN}."]

  val set_left : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression/left} \
     [left] on MDN}."]

  val right : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression/right} \
     [right] on MDN}."]

  val set_right : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression/right} \
     [right] on MDN}."]
end = struct
  type t = [ `Binary_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Binary_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression} \
     [BinaryExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "BinaryExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let operator this = Binary_operator.of_any (Js.Ffi.get this "operator")
  let set_operator this x = Js.Ffi.set this "operator" (Binary_operator.to_any x)
  let left this = Expression.of_any (Js.Ffi.get this "left")
  let set_left this x = Js.Ffi.set this "left" (Expression.to_any x)
  let right this = Expression.of_any (Js.Ffi.get this "right")
  let set_right this x = Js.Ffi.set this "right" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BinaryExpression} \
   [BinaryExpression] on MDN}."]

and Call_expression : sig
  type t = [ `Call_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression} \
     [CallExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Call_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression} \
     [CallExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val callee : t -> [< `Expression | `Super ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression/callee} \
     [callee] on MDN}."]

  val set_callee : t -> [< `Expression | `Super ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression/callee} \
     [callee] on MDN}."]

  val arguments : t -> Arguments.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression/arguments} \
     [arguments] on MDN}."]

  val set_arguments : t -> Arguments.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression/arguments} \
     [arguments] on MDN}."]
end = struct
  type t = [ `Call_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Call_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CallExpression} \
     [CallExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "CallExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let callee this = Js.of_any (Js.Ffi.get this "callee")
  let set_callee this x = Js.Ffi.set this "callee" (Js.to_any x)
  let arguments this = Arguments.of_any (Js.Ffi.get this "arguments")
  let set_arguments this x = Js.Ffi.set this "arguments" (Arguments.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/CallExpression} \
   [CallExpression] on MDN}."]

and Compound_assignment_expression : sig
  type t = [ `Compound_assignment_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression} \
     [CompoundAssignmentExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Compound_assignment_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression} \
     [CompoundAssignmentExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val operator : t -> Compound_assignment_operator.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression/operator} \
     [operator] on MDN}."]

  val set_operator : t -> Compound_assignment_operator.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression/operator} \
     [operator] on MDN}."]

  val binding : t -> Simple_assignment_target.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Simple_assignment_target.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression/binding} \
     [binding] on MDN}."]

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Compound_assignment_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Compound_assignment_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression} \
     [CompoundAssignmentExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "CompoundAssignmentExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let operator this =
    Compound_assignment_operator.of_any (Js.Ffi.get this "operator")

  let set_operator this x =
    Js.Ffi.set this "operator" (Compound_assignment_operator.to_any x)

  let binding this = Simple_assignment_target.of_any (Js.Ffi.get this "binding")

  let set_binding this x =
    Js.Ffi.set this "binding" (Simple_assignment_target.to_any x)

  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/CompoundAssignmentExpression} \
   [CompoundAssignmentExpression] on MDN}."]

and Computed_member_expression : sig
  type t = [ `Computed_member_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression} \
     [ComputedMemberExpression]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Computed_member_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression} \
     [ComputedMemberExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val _object : t -> [< `Expression | `Super ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression/_object} \
     [_object] on MDN}."]

  val set__object : t -> [< `Expression | `Super ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression/_object} \
     [_object] on MDN}."]

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Computed_member_expression ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Computed_member_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression} \
     [ComputedMemberExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "ComputedMemberExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let _object this = Js.of_any (Js.Ffi.get this "_object")
  let set__object this x = Js.Ffi.set this "_object" (Js.to_any x)
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ComputedMemberExpression} \
   [ComputedMemberExpression] on MDN}."]

and Conditional_expression : sig
  type t = [ `Conditional_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression} \
     [ConditionalExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Conditional_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression} \
     [ConditionalExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val test : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression/test} \
     [test] on MDN}."]

  val set_test : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression/test} \
     [test] on MDN}."]

  val consequent : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression/consequent} \
     [consequent] on MDN}."]

  val set_consequent : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression/consequent} \
     [consequent] on MDN}."]

  val alternate : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression/alternate} \
     [alternate] on MDN}."]

  val set_alternate : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression/alternate} \
     [alternate] on MDN}."]
end = struct
  type t = [ `Conditional_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Conditional_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression} \
     [ConditionalExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "ConditionalExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let test this = Expression.of_any (Js.Ffi.get this "test")
  let set_test this x = Js.Ffi.set this "test" (Expression.to_any x)
  let consequent this = Expression.of_any (Js.Ffi.get this "consequent")
  let set_consequent this x = Js.Ffi.set this "consequent" (Expression.to_any x)
  let alternate this = Expression.of_any (Js.Ffi.get this "alternate")
  let set_alternate this x = Js.Ffi.set this "alternate" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ConditionalExpression} \
   [ConditionalExpression] on MDN}."]

and Eager_function_expression : sig
  type t = [ `Eager_function_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression} \
     [EagerFunctionExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Eager_function_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression} \
     [EagerFunctionExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/isAsync} \
     [isAsync] on MDN}."]

  val is_generator : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/isGenerator} \
     [isGenerator] on MDN}."]

  val set_is_generator : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/isGenerator} \
     [isGenerator] on MDN}."]

  val name : t -> 'a Binding_identifier.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/name} \
     [name] on MDN}."]

  val set_name : t -> Binding_identifier.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/name} \
     [name] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Function_expression_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Function_expression_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_function_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Eager_function_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression} \
     [EagerFunctionExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "EagerFunctionExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let is_generator this = Js.Any.to_bool (Js.Ffi.get this "isGenerator")
  let set_is_generator this x = Js.Ffi.set this "isGenerator" (Js.Any.of_bool x)

  let name this =
    (Js.Any.nullable_to_option Binding_identifier.of_any)
      (Js.Ffi.get this "name")

  let set_name this x =
    Js.Ffi.set this "name"
      ((Js.Any.nullable_of_option Binding_identifier.to_any) x)

  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Function_expression_contents.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents" (Function_expression_contents.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionExpression} \
   [EagerFunctionExpression] on MDN}."]

and Lazy_function_expression : sig
  type t = [ `Lazy_function_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression} \
     [LazyFunctionExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_function_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression} \
     [LazyFunctionExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/isAsync} \
     [isAsync] on MDN}."]

  val is_generator : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/isGenerator} \
     [isGenerator] on MDN}."]

  val set_is_generator : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/isGenerator} \
     [isGenerator] on MDN}."]

  val name : t -> 'a Binding_identifier.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/name} \
     [name] on MDN}."]

  val set_name : t -> Binding_identifier.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/name} \
     [name] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Function_expression_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Function_expression_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_function_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_function_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression} \
     [LazyFunctionExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LazyFunctionExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let is_generator this = Js.Any.to_bool (Js.Ffi.get this "isGenerator")
  let set_is_generator this x = Js.Ffi.set this "isGenerator" (Js.Any.of_bool x)

  let name this =
    (Js.Any.nullable_to_option Binding_identifier.of_any)
      (Js.Ffi.get this "name")

  let set_name this x =
    Js.Ffi.set this "name"
      ((Js.Any.nullable_of_option Binding_identifier.to_any) x)

  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Function_expression_contents.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents" (Function_expression_contents.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionExpression} \
   [LazyFunctionExpression] on MDN}."]

and Function_expression_contents : sig
  type t = [ `Function_expression_contents ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents} \
     [FunctionExpressionContents]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Function_expression_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents} \
     [FunctionExpressionContents]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_function_name_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/isFunctionNameCaptured} \
     [isFunctionNameCaptured] on MDN}."]

  val set_is_function_name_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/isFunctionNameCaptured} \
     [isFunctionNameCaptured] on MDN}."]

  val is_this_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val set_is_this_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val parameter_scope : t -> Asserted_parameter_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/parameterScope} \
     [parameterScope] on MDN}."]

  val set_parameter_scope : t -> Asserted_parameter_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/parameterScope} \
     [parameterScope] on MDN}."]

  val params : t -> 'a Formal_parameters.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/params} \
     [params] on MDN}."]

  val set_params : t -> Formal_parameters.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/params} \
     [params] on MDN}."]

  val body_scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/bodyScope} \
     [bodyScope] on MDN}."]

  val set_body_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/bodyScope} \
     [bodyScope] on MDN}."]

  val body : t -> Function_body.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/body} \
     [body] on MDN}."]

  val set_body : t -> Function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Function_expression_contents ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Function_expression_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents} \
     [FunctionExpressionContents]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "FunctionExpressionContents"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let is_function_name_captured this =
    Js.Any.to_bool (Js.Ffi.get this "isFunctionNameCaptured")

  let set_is_function_name_captured this x =
    Js.Ffi.set this "isFunctionNameCaptured" (Js.Any.of_bool x)

  let is_this_captured this = Js.Any.to_bool (Js.Ffi.get this "isThisCaptured")

  let set_is_this_captured this x =
    Js.Ffi.set this "isThisCaptured" (Js.Any.of_bool x)

  let parameter_scope this =
    Asserted_parameter_scope.of_any (Js.Ffi.get this "parameterScope")

  let set_parameter_scope this x =
    Js.Ffi.set this "parameterScope" (Asserted_parameter_scope.to_any x)

  let params this = Formal_parameters.of_any (Js.Ffi.get this "params")
  let set_params this x = Js.Ffi.set this "params" (Formal_parameters.to_any x)
  let body_scope this = Asserted_var_scope.of_any (Js.Ffi.get this "bodyScope")

  let set_body_scope this x =
    Js.Ffi.set this "bodyScope" (Asserted_var_scope.to_any x)

  let body this = Function_body.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Function_body.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/FunctionExpressionContents} \
   [FunctionExpressionContents] on MDN}."]

and Identifier_expression : sig
  type t = [ `Identifier_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IdentifierExpression} \
     [IdentifierExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Identifier_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IdentifierExpression} \
     [IdentifierExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val name : t -> Identifier.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IdentifierExpression/name} \
     [name] on MDN}."]

  val set_name : t -> Identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IdentifierExpression/name} \
     [name] on MDN}."]
end = struct
  type t = [ `Identifier_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Identifier_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IdentifierExpression} \
     [IdentifierExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "IdentifierExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let name this = Identifier.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Identifier.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/IdentifierExpression} \
   [IdentifierExpression] on MDN}."]

and New_expression : sig
  type t = [ `New_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression} \
     [NewExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `New_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression} \
     [NewExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val callee : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression/callee} \
     [callee] on MDN}."]

  val set_callee : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression/callee} \
     [callee] on MDN}."]

  val arguments : t -> Arguments.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression/arguments} \
     [arguments] on MDN}."]

  val set_arguments : t -> Arguments.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression/arguments} \
     [arguments] on MDN}."]
end = struct
  type t = [ `New_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `New_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewExpression} \
     [NewExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "NewExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let callee this = Expression.of_any (Js.Ffi.get this "callee")
  let set_callee this x = Js.Ffi.set this "callee" (Expression.to_any x)
  let arguments this = Arguments.of_any (Js.Ffi.get this "arguments")
  let set_arguments this x = Js.Ffi.set this "arguments" (Arguments.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/NewExpression} \
   [NewExpression] on MDN}."]

and New_target_expression : sig
  type t = [ `New_target_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewTargetExpression} \
     [NewTargetExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `New_target_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewTargetExpression} \
     [NewTargetExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `New_target_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `New_target_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/NewTargetExpression} \
     [NewTargetExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "NewTargetExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/NewTargetExpression} \
   [NewTargetExpression] on MDN}."]

and Object_expression : sig
  type t = [ `Object_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectExpression} \
     [ObjectExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Object_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectExpression} \
     [ObjectExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val properties : t -> Object_property.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectExpression/properties} \
     [properties] on MDN}."]

  val set_properties : t -> Object_property.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectExpression/properties} \
     [properties] on MDN}."]
end = struct
  type t = [ `Object_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Object_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ObjectExpression} \
     [ObjectExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ObjectExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let properties this =
    (Js.Any.to_array Object_property.of_any) (Js.Ffi.get this "properties")

  let set_properties this x =
    Js.Ffi.set this "properties" ((Js.Any.of_array Object_property.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ObjectExpression} \
   [ObjectExpression] on MDN}."]

and Unary_expression : sig
  type t = [ `Unary_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression} \
     [UnaryExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Unary_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression} \
     [UnaryExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val operator : t -> Unary_operator.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression/operator} \
     [operator] on MDN}."]

  val set_operator : t -> Unary_operator.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression/operator} \
     [operator] on MDN}."]

  val operand : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression/operand} \
     [operand] on MDN}."]

  val set_operand : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression/operand} \
     [operand] on MDN}."]
end = struct
  type t = [ `Unary_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Unary_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression} \
     [UnaryExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "UnaryExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let operator this = Unary_operator.of_any (Js.Ffi.get this "operator")
  let set_operator this x = Js.Ffi.set this "operator" (Unary_operator.to_any x)
  let operand this = Expression.of_any (Js.Ffi.get this "operand")
  let set_operand this x = Js.Ffi.set this "operand" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/UnaryExpression} \
   [UnaryExpression] on MDN}."]

and Static_member_expression : sig
  type t = [ `Static_member_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression} \
     [StaticMemberExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Static_member_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression} \
     [StaticMemberExpression]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val _object : t -> [< `Expression | `Super ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression/_object} \
     [_object] on MDN}."]

  val set__object : t -> [< `Expression | `Super ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression/_object} \
     [_object] on MDN}."]

  val property : t -> Identifier_name.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression/property} \
     [property] on MDN}."]

  val set_property : t -> Identifier_name.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression/property} \
     [property] on MDN}."]
end = struct
  type t = [ `Static_member_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Static_member_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression} \
     [StaticMemberExpression]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "StaticMemberExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let _object this = Js.of_any (Js.Ffi.get this "_object")
  let set__object this x = Js.Ffi.set this "_object" (Js.to_any x)
  let property this = Identifier_name.of_any (Js.Ffi.get this "property")
  let set_property this x = Js.Ffi.set this "property" (Identifier_name.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/StaticMemberExpression} \
   [StaticMemberExpression] on MDN}."]

and Template_expression : sig
  type t = [ `Template_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression} \
     [TemplateExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Template_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression} \
     [TemplateExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val tag : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression/tag} \
     [tag] on MDN}."]

  val set_tag : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression/tag} \
     [tag] on MDN}."]

  val elements : t -> [< `Expression | `Template_element ] Js.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression/elements} \
     [elements] on MDN}."]

  val set_elements :
    t -> [< `Expression | `Template_element ] Js.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression/elements} \
     [elements] on MDN}."]
end = struct
  type t = [ `Template_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Template_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression} \
     [TemplateExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "TemplateExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let tag this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "tag")

  let set_tag this x =
    Js.Ffi.set this "tag" ((Js.Any.nullable_of_option Expression.to_any) x)

  let elements this = (Js.Any.to_array Js.of_any) (Js.Ffi.get this "elements")

  let set_elements this x =
    Js.Ffi.set this "elements" ((Js.Any.of_array Js.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/TemplateExpression} \
   [TemplateExpression] on MDN}."]

and This_expression : sig
  type t = [ `This_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThisExpression} \
     [ThisExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `This_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThisExpression} \
     [ThisExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `This_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `This_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThisExpression} \
     [ThisExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ThisExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ThisExpression} \
   [ThisExpression] on MDN}."]

and Update_expression : sig
  type t = [ `Update_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression} \
     [UpdateExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Update_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression} \
     [UpdateExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_prefix : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression/isPrefix} \
     [isPrefix] on MDN}."]

  val set_is_prefix : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression/isPrefix} \
     [isPrefix] on MDN}."]

  val operator : t -> Update_operator.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression/operator} \
     [operator] on MDN}."]

  val set_operator : t -> Update_operator.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression/operator} \
     [operator] on MDN}."]

  val operand : t -> Simple_assignment_target.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression/operand} \
     [operand] on MDN}."]

  val set_operand : t -> Simple_assignment_target.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression/operand} \
     [operand] on MDN}."]
end = struct
  type t = [ `Update_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Update_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression} \
     [UpdateExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "UpdateExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_prefix this = Js.Any.to_bool (Js.Ffi.get this "isPrefix")
  let set_is_prefix this x = Js.Ffi.set this "isPrefix" (Js.Any.of_bool x)
  let operator this = Update_operator.of_any (Js.Ffi.get this "operator")
  let set_operator this x = Js.Ffi.set this "operator" (Update_operator.to_any x)
  let operand this = Simple_assignment_target.of_any (Js.Ffi.get this "operand")

  let set_operand this x =
    Js.Ffi.set this "operand" (Simple_assignment_target.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/UpdateExpression} \
   [UpdateExpression] on MDN}."]

and Yield_expression : sig
  type t = [ `Yield_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldExpression} \
     [YieldExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Yield_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldExpression} \
     [YieldExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldExpression/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldExpression/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Yield_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Yield_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldExpression} \
     [YieldExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "YieldExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let expression this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "expression")

  let set_expression this x =
    Js.Ffi.set this "expression"
      ((Js.Any.nullable_of_option Expression.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/YieldExpression} \
   [YieldExpression] on MDN}."]

and Yield_star_expression : sig
  type t = [ `Yield_star_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldStarExpression} \
     [YieldStarExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Yield_star_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldStarExpression} \
     [YieldStarExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldStarExpression/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldStarExpression/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Yield_star_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Yield_star_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/YieldStarExpression} \
     [YieldStarExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "YieldStarExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/YieldStarExpression} \
   [YieldStarExpression] on MDN}."]

and Await_expression : sig
  type t = [ `Await_expression ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AwaitExpression} \
     [AwaitExpression]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Await_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AwaitExpression} \
     [AwaitExpression]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AwaitExpression/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AwaitExpression/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Await_expression ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Await_expression | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/AwaitExpression} \
     [AwaitExpression]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "AwaitExpression"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/AwaitExpression} \
   [AwaitExpression] on MDN}."]

and Break_statement : sig
  type t = [ `Break_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BreakStatement} \
     [BreakStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Break_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BreakStatement} \
     [BreakStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val label : t -> Label.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BreakStatement/label} \
     [label] on MDN}."]

  val set_label : t -> Label.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BreakStatement/label} \
     [label] on MDN}."]
end = struct
  type t = [ `Break_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Break_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/BreakStatement} \
     [BreakStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "BreakStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let label this =
    (Js.Any.nullable_to_option Label.of_any) (Js.Ffi.get this "label")

  let set_label this x =
    Js.Ffi.set this "label" ((Js.Any.nullable_of_option Label.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/BreakStatement} \
   [BreakStatement] on MDN}."]

and Continue_statement : sig
  type t = [ `Continue_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ContinueStatement} \
     [ContinueStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Continue_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ContinueStatement} \
     [ContinueStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val label : t -> Label.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ContinueStatement/label} \
     [label] on MDN}."]

  val set_label : t -> Label.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ContinueStatement/label} \
     [label] on MDN}."]
end = struct
  type t = [ `Continue_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Continue_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ContinueStatement} \
     [ContinueStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ContinueStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let label this =
    (Js.Any.nullable_to_option Label.of_any) (Js.Ffi.get this "label")

  let set_label this x =
    Js.Ffi.set this "label" ((Js.Any.nullable_of_option Label.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ContinueStatement} \
   [ContinueStatement] on MDN}."]

and Debugger_statement : sig
  type t = [ `Debugger_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DebuggerStatement} \
     [DebuggerStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Debugger_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DebuggerStatement} \
     [DebuggerStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Debugger_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Debugger_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DebuggerStatement} \
     [DebuggerStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "DebuggerStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DebuggerStatement} \
   [DebuggerStatement] on MDN}."]

and Do_while_statement : sig
  type t = [ `Do_while_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement} \
     [DoWhileStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Do_while_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement} \
     [DoWhileStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val test : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement/test} \
     [test] on MDN}."]

  val set_test : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement/test} \
     [test] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Do_while_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Do_while_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement} \
     [DoWhileStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "DoWhileStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let test this = Expression.of_any (Js.Ffi.get this "test")
  let set_test this x = Js.Ffi.set this "test" (Expression.to_any x)
  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/DoWhileStatement} \
   [DoWhileStatement] on MDN}."]

and Empty_statement : sig
  type t = [ `Empty_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EmptyStatement} \
     [EmptyStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Empty_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EmptyStatement} \
     [EmptyStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Empty_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Empty_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EmptyStatement} \
     [EmptyStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "EmptyStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/EmptyStatement} \
   [EmptyStatement] on MDN}."]

and Expression_statement : sig
  type t = [ `Expression_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExpressionStatement} \
     [ExpressionStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Expression_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExpressionStatement} \
     [ExpressionStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExpressionStatement/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExpressionStatement/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Expression_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Expression_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ExpressionStatement} \
     [ExpressionStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ExpressionStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/ExpressionStatement} \
   [ExpressionStatement] on MDN}."]

and For_in_of_binding : sig
  type t = [ `For_in_of_binding ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding} \
     [ForInOfBinding]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `For_in_of_binding | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding} \
     [ForInOfBinding]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val kind : t -> Variable_declaration_kind.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding/kind} \
     [kind] on MDN}."]

  val set_kind : t -> Variable_declaration_kind.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding/kind} \
     [kind] on MDN}."]

  val binding : t -> Binding.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Binding.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding/binding} \
     [binding] on MDN}."]
end = struct
  type t = [ `For_in_of_binding ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `For_in_of_binding | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding} \
     [ForInOfBinding]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ForInOfBinding"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let kind this = Variable_declaration_kind.of_any (Js.Ffi.get this "kind")

  let set_kind this x =
    Js.Ffi.set this "kind" (Variable_declaration_kind.to_any x)

  let binding this = Binding.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Binding.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ForInOfBinding} \
   [ForInOfBinding] on MDN}."]

and For_in_statement : sig
  type t = [ `For_in_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement} \
     [ForInStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `For_in_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement} \
     [ForInStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val left : t -> [< `For_in_of_binding | `Assignment_target ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement/left} \
     [left] on MDN}."]

  val set_left : t -> [< `For_in_of_binding | `Assignment_target ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement/left} \
     [left] on MDN}."]

  val right : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement/right} \
     [right] on MDN}."]

  val set_right : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement/right} \
     [right] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `For_in_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `For_in_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement} \
     [ForInStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ForInStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let left this = Js.of_any (Js.Ffi.get this "left")
  let set_left this x = Js.Ffi.set this "left" (Js.to_any x)
  let right this = Expression.of_any (Js.Ffi.get this "right")
  let set_right this x = Js.Ffi.set this "right" (Expression.to_any x)
  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ForInStatement} \
   [ForInStatement] on MDN}."]

and For_of_statement : sig
  type t = [ `For_of_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement} \
     [ForOfStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `For_of_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement} \
     [ForOfStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val left : t -> [< `For_in_of_binding | `Assignment_target ] Js.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement/left} \
     [left] on MDN}."]

  val set_left : t -> [< `For_in_of_binding | `Assignment_target ] Js.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement/left} \
     [left] on MDN}."]

  val right : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement/right} \
     [right] on MDN}."]

  val set_right : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement/right} \
     [right] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `For_of_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `For_of_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement} \
     [ForOfStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ForOfStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let left this = Js.of_any (Js.Ffi.get this "left")
  let set_left this x = Js.Ffi.set this "left" (Js.to_any x)
  let right this = Expression.of_any (Js.Ffi.get this "right")
  let set_right this x = Js.Ffi.set this "right" (Expression.to_any x)
  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ForOfStatement} \
   [ForOfStatement] on MDN}."]

and For_statement : sig
  type t = [ `For_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement} \
     [ForStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `For_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement} \
     [ForStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val init : t -> [< `Variable_declaration | `Expression ] Js.nullable
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/init} \
     [init] on MDN}."]

  val set_init :
    t -> [< `Variable_declaration | `Expression ] Js.nullable -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/init} \
     [init] on MDN}."]

  val test : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/test} \
     [test] on MDN}."]

  val set_test : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/test} \
     [test] on MDN}."]

  val update : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/update} \
     [update] on MDN}."]

  val set_update : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/update} \
     [update] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `For_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `For_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ForStatement} \
     [ForStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ForStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let init this = Js.of_any (Js.Ffi.get this "init")
  let set_init this x = Js.Ffi.set this "init" (Js.to_any x)

  let test this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "test")

  let set_test this x =
    Js.Ffi.set this "test" ((Js.Any.nullable_of_option Expression.to_any) x)

  let update this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "update")

  let set_update this x =
    Js.Ffi.set this "update" ((Js.Any.nullable_of_option Expression.to_any) x)

  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ForStatement} \
   [ForStatement] on MDN}."]

and If_statement : sig
  type t = [ `If_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement} \
     [IfStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `If_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement} \
     [IfStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val test : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement/test} [test] \
     on MDN}."]

  val set_test : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement/test} [test] \
     on MDN}."]

  val consequent : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement/consequent} \
     [consequent] on MDN}."]

  val set_consequent : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement/consequent} \
     [consequent] on MDN}."]

  val alternate : t -> Statement.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement/alternate} \
     [alternate] on MDN}."]

  val set_alternate : t -> Statement.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement/alternate} \
     [alternate] on MDN}."]
end = struct
  type t = [ `If_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `If_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/IfStatement} \
     [IfStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "IfStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let test this = Expression.of_any (Js.Ffi.get this "test")
  let set_test this x = Js.Ffi.set this "test" (Expression.to_any x)
  let consequent this = Statement.of_any (Js.Ffi.get this "consequent")
  let set_consequent this x = Js.Ffi.set this "consequent" (Statement.to_any x)

  let alternate this =
    (Js.Any.nullable_to_option Statement.of_any) (Js.Ffi.get this "alternate")

  let set_alternate this x =
    Js.Ffi.set this "alternate" ((Js.Any.nullable_of_option Statement.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/IfStatement} \
   [IfStatement] on MDN}."]

and Labelled_statement : sig
  type t = [ `Labelled_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement} \
     [LabelledStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Labelled_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement} \
     [LabelledStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val label : t -> Label.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement/label} \
     [label] on MDN}."]

  val set_label : t -> Label.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement/label} \
     [label] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Labelled_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Labelled_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement} \
     [LabelledStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "LabelledStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let label this = Label.of_any (Js.Ffi.get this "label")
  let set_label this x = Js.Ffi.set this "label" (Label.to_any x)
  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/LabelledStatement} \
   [LabelledStatement] on MDN}."]

and Return_statement : sig
  type t = [ `Return_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ReturnStatement} \
     [ReturnStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Return_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ReturnStatement} \
     [ReturnStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ReturnStatement/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ReturnStatement/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Return_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Return_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ReturnStatement} \
     [ReturnStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ReturnStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let expression this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "expression")

  let set_expression this x =
    Js.Ffi.set this "expression"
      ((Js.Any.nullable_of_option Expression.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ReturnStatement} \
   [ReturnStatement] on MDN}."]

and Switch_statement : sig
  type t = [ `Switch_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement} \
     [SwitchStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Switch_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement} \
     [SwitchStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val discriminant : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement/discriminant} \
     [discriminant] on MDN}."]

  val set_discriminant : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement/discriminant} \
     [discriminant] on MDN}."]

  val cases : t -> Switch_case.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement/cases} \
     [cases] on MDN}."]

  val set_cases : t -> Switch_case.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement/cases} \
     [cases] on MDN}."]
end = struct
  type t = [ `Switch_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Switch_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement} \
     [SwitchStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "SwitchStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let discriminant this = Expression.of_any (Js.Ffi.get this "discriminant")

  let set_discriminant this x =
    Js.Ffi.set this "discriminant" (Expression.to_any x)

  let cases this = (Js.Any.to_array Switch_case.of_any) (Js.Ffi.get this "cases")

  let set_cases this x =
    Js.Ffi.set this "cases" ((Js.Any.of_array Switch_case.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatement} \
   [SwitchStatement] on MDN}."]

and Switch_statement_with_default : sig
  type t = [ `Switch_statement_with_default ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault} \
     [SwitchStatementWithDefault]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Switch_statement_with_default | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault} \
     [SwitchStatementWithDefault]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val discriminant : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/discriminant} \
     [discriminant] on MDN}."]

  val set_discriminant : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/discriminant} \
     [discriminant] on MDN}."]

  val pre_default_cases : t -> Switch_case.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/preDefaultCases} \
     [preDefaultCases] on MDN}."]

  val set_pre_default_cases : t -> Switch_case.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/preDefaultCases} \
     [preDefaultCases] on MDN}."]

  val default_case : t -> 'a Switch_default.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/defaultCase} \
     [defaultCase] on MDN}."]

  val set_default_case : t -> Switch_default.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/defaultCase} \
     [defaultCase] on MDN}."]

  val post_default_cases : t -> Switch_case.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/postDefaultCases} \
     [postDefaultCases] on MDN}."]

  val set_post_default_cases : t -> Switch_case.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault/postDefaultCases} \
     [postDefaultCases] on MDN}."]
end = struct
  type t = [ `Switch_statement_with_default ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Switch_statement_with_default | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault} \
     [SwitchStatementWithDefault]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "SwitchStatementWithDefault"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let discriminant this = Expression.of_any (Js.Ffi.get this "discriminant")

  let set_discriminant this x =
    Js.Ffi.set this "discriminant" (Expression.to_any x)

  let pre_default_cases this =
    (Js.Any.to_array Switch_case.of_any) (Js.Ffi.get this "preDefaultCases")

  let set_pre_default_cases this x =
    Js.Ffi.set this "preDefaultCases" ((Js.Any.of_array Switch_case.to_any) x)

  let default_case this = Switch_default.of_any (Js.Ffi.get this "defaultCase")

  let set_default_case this x =
    Js.Ffi.set this "defaultCase" (Switch_default.to_any x)

  let post_default_cases this =
    (Js.Any.to_array Switch_case.of_any) (Js.Ffi.get this "postDefaultCases")

  let set_post_default_cases this x =
    Js.Ffi.set this "postDefaultCases" ((Js.Any.of_array Switch_case.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/SwitchStatementWithDefault} \
   [SwitchStatementWithDefault] on MDN}."]

and Throw_statement : sig
  type t = [ `Throw_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThrowStatement} \
     [ThrowStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Throw_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThrowStatement} \
     [ThrowStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThrowStatement/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThrowStatement/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Throw_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Throw_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/ThrowStatement} \
     [ThrowStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "ThrowStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/ThrowStatement} \
   [ThrowStatement] on MDN}."]

and Try_catch_statement : sig
  type t = [ `Try_catch_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement} \
     [TryCatchStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Try_catch_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement} \
     [TryCatchStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val body : t -> 'a Block.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Block.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement/body} \
     [body] on MDN}."]

  val catch_clause : t -> 'a Catch_clause.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement/catchClause} \
     [catchClause] on MDN}."]

  val set_catch_clause : t -> Catch_clause.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement/catchClause} \
     [catchClause] on MDN}."]
end = struct
  type t = [ `Try_catch_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Try_catch_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement} \
     [TryCatchStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "TryCatchStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let body this = Block.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Block.to_any x)
  let catch_clause this = Catch_clause.of_any (Js.Ffi.get this "catchClause")

  let set_catch_clause this x =
    Js.Ffi.set this "catchClause" (Catch_clause.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TryCatchStatement} \
   [TryCatchStatement] on MDN}."]

and Try_finally_statement : sig
  type t = [ `Try_finally_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement} \
     [TryFinallyStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Try_finally_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement} \
     [TryFinallyStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val body : t -> 'a Block.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Block.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement/body} \
     [body] on MDN}."]

  val catch_clause : t -> 'a Catch_clause.super option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement/catchClause} \
     [catchClause] on MDN}."]

  val set_catch_clause : t -> Catch_clause.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement/catchClause} \
     [catchClause] on MDN}."]

  val finalizer : t -> 'a Block.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement/finalizer} \
     [finalizer] on MDN}."]

  val set_finalizer : t -> Block.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement/finalizer} \
     [finalizer] on MDN}."]
end = struct
  type t = [ `Try_finally_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Try_finally_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement} \
     [TryFinallyStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "TryFinallyStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let body this = Block.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Block.to_any x)

  let catch_clause this =
    (Js.Any.nullable_to_option Catch_clause.of_any)
      (Js.Ffi.get this "catchClause")

  let set_catch_clause this x =
    Js.Ffi.set this "catchClause"
      ((Js.Any.nullable_of_option Catch_clause.to_any) x)

  let finalizer this = Block.of_any (Js.Ffi.get this "finalizer")
  let set_finalizer this x = Js.Ffi.set this "finalizer" (Block.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/TryFinallyStatement} \
   [TryFinallyStatement] on MDN}."]

and While_statement : sig
  type t = [ `While_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement} \
     [WhileStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `While_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement} \
     [WhileStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val test : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement/test} \
     [test] on MDN}."]

  val set_test : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement/test} \
     [test] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `While_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `While_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement} \
     [WhileStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "WhileStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let test this = Expression.of_any (Js.Ffi.get this "test")
  let set_test this x = Js.Ffi.set this "test" (Expression.to_any x)
  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WhileStatement} \
   [WhileStatement] on MDN}."]

and With_statement : sig
  type t = [ `With_statement ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement} \
     [WithStatement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `With_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement} \
     [WithStatement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val _object : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement/_object} \
     [_object] on MDN}."]

  val set__object : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement/_object} \
     [_object] on MDN}."]

  val body : t -> Statement.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement/body} \
     [body] on MDN}."]

  val set_body : t -> Statement.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement/body} \
     [body] on MDN}."]
end = struct
  type t = [ `With_statement ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `With_statement | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/WithStatement} \
     [WithStatement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "WithStatement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let _object this = Expression.of_any (Js.Ffi.get this "_object")
  let set__object this x = Js.Ffi.set this "_object" (Expression.to_any x)
  let body this = Statement.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Statement.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/WithStatement} \
   [WithStatement] on MDN}."]

and Block : sig
  type t = [ `Block ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Block} [Block]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Block | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Block} [Block]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val scope : t -> Asserted_block_scope.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Block/scope} \
     [scope] on MDN}."]

  val set_scope : t -> Asserted_block_scope.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Block/scope} \
     [scope] on MDN}."]

  val statements : t -> Statement.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Block/statements} \
     [statements] on MDN}."]

  val set_statements : t -> Statement.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Block/statements} \
     [statements] on MDN}."]
end = struct
  type t = [ `Block ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Block | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Block} [Block]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Block"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let scope this = Asserted_block_scope.of_any (Js.Ffi.get this "scope")
  let set_scope this x = Js.Ffi.set this "scope" (Asserted_block_scope.to_any x)

  let statements this =
    (Js.Any.to_array Statement.of_any) (Js.Ffi.get this "statements")

  let set_statements this x =
    Js.Ffi.set this "statements" ((Js.Any.of_array Statement.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Block} [Block] on \
   MDN}."]

and Catch_clause : sig
  type t = [ `Catch_clause ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause} \
     [CatchClause]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Catch_clause | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause} \
     [CatchClause]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding_scope : t -> Asserted_bound_names_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause/bindingScope} \
     [bindingScope] on MDN}."]

  val set_binding_scope : t -> Asserted_bound_names_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause/bindingScope} \
     [bindingScope] on MDN}."]

  val binding : t -> Binding.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Binding.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause/binding} \
     [binding] on MDN}."]

  val body : t -> 'a Block.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause/body} [body] \
     on MDN}."]

  val set_body : t -> Block.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause/body} [body] \
     on MDN}."]
end = struct
  type t = [ `Catch_clause ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Catch_clause | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/CatchClause} \
     [CatchClause]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "CatchClause"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let binding_scope this =
    Asserted_bound_names_scope.of_any (Js.Ffi.get this "bindingScope")

  let set_binding_scope this x =
    Js.Ffi.set this "bindingScope" (Asserted_bound_names_scope.to_any x)

  let binding this = Binding.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Binding.to_any x)
  let body this = Block.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Block.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/CatchClause} \
   [CatchClause] on MDN}."]

and Directive : sig
  type t = [ `Directive ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Directive} [Directive]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Directive | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Directive} [Directive]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val raw_value : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Directive/rawValue} \
     [rawValue] on MDN}."]

  val set_raw_value : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Directive/rawValue} \
     [rawValue] on MDN}."]
end = struct
  type t = [ `Directive ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Directive | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Directive} [Directive]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Directive"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let raw_value this = String.of_any (Js.Ffi.get this "rawValue")
  let set_raw_value this x = Js.Ffi.set this "rawValue" (String.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Directive} \
   [Directive] on MDN}."]

and Formal_parameters : sig
  type t = [ `Formal_parameters ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters} \
     [FormalParameters]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Formal_parameters | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters} \
     [FormalParameters]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val items : t -> Parameter.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters/items} \
     [items] on MDN}."]

  val set_items : t -> Parameter.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters/items} \
     [items] on MDN}."]

  val rest : t -> Binding.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters/rest} \
     [rest] on MDN}."]

  val set_rest : t -> Binding.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters/rest} \
     [rest] on MDN}."]
end = struct
  type t = [ `Formal_parameters ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Formal_parameters | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters} \
     [FormalParameters]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "FormalParameters"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let items this = (Js.Any.to_array Parameter.of_any) (Js.Ffi.get this "items")

  let set_items this x =
    Js.Ffi.set this "items" ((Js.Any.of_array Parameter.to_any) x)

  let rest this =
    (Js.Any.nullable_to_option Binding.of_any) (Js.Ffi.get this "rest")

  let set_rest this x =
    Js.Ffi.set this "rest" ((Js.Any.nullable_of_option Binding.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/FormalParameters} \
   [FormalParameters] on MDN}."]

and Function_body : sig
  type nonrec t = Statement.t array

  val of_any : Js.any -> t
  val to_any : t -> Js.any
end =
  Function_body

and Eager_function_declaration : sig
  type t = [ `Eager_function_declaration ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration} \
     [EagerFunctionDeclaration]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Eager_function_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration} \
     [EagerFunctionDeclaration]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/isAsync} \
     [isAsync] on MDN}."]

  val is_generator : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/isGenerator} \
     [isGenerator] on MDN}."]

  val set_is_generator : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/isGenerator} \
     [isGenerator] on MDN}."]

  val name : t -> 'a Binding_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/name} \
     [name] on MDN}."]

  val set_name : t -> Binding_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/name} \
     [name] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Function_or_method_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Function_or_method_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Eager_function_declaration ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Eager_function_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration} \
     [EagerFunctionDeclaration]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "EagerFunctionDeclaration"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let is_generator this = Js.Any.to_bool (Js.Ffi.get this "isGenerator")
  let set_is_generator this x = Js.Ffi.set this "isGenerator" (Js.Any.of_bool x)
  let name this = Binding_identifier.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Binding_identifier.to_any x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Function_or_method_contents.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents" (Function_or_method_contents.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/EagerFunctionDeclaration} \
   [EagerFunctionDeclaration] on MDN}."]

and Lazy_function_declaration : sig
  type t = [ `Lazy_function_declaration ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration} \
     [LazyFunctionDeclaration]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_function_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration} \
     [LazyFunctionDeclaration]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_async : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/isAsync} \
     [isAsync] on MDN}."]

  val set_is_async : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/isAsync} \
     [isAsync] on MDN}."]

  val is_generator : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/isGenerator} \
     [isGenerator] on MDN}."]

  val set_is_generator : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/isGenerator} \
     [isGenerator] on MDN}."]

  val name : t -> 'a Binding_identifier.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/name} \
     [name] on MDN}."]

  val set_name : t -> Binding_identifier.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/name} \
     [name] on MDN}."]

  val length : t -> int
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/length} \
     [length] on MDN}."]

  val set_length : t -> int -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/length} \
     [length] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/directives} \
     [directives] on MDN}."]

  val contents : t -> 'a Function_or_method_contents.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/contents} \
     [contents] on MDN}."]

  val set_contents : t -> Function_or_method_contents.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration/contents} \
     [contents] on MDN}."]
end = struct
  type t = [ `Lazy_function_declaration ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Lazy_function_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration} \
     [LazyFunctionDeclaration]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "LazyFunctionDeclaration"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_async this = Js.Any.to_bool (Js.Ffi.get this "isAsync")
  let set_is_async this x = Js.Ffi.set this "isAsync" (Js.Any.of_bool x)
  let is_generator this = Js.Any.to_bool (Js.Ffi.get this "isGenerator")
  let set_is_generator this x = Js.Ffi.set this "isGenerator" (Js.Any.of_bool x)
  let name this = Binding_identifier.of_any (Js.Ffi.get this "name")
  let set_name this x = Js.Ffi.set this "name" (Binding_identifier.to_any x)
  let length this = Js.Any.to_int (Js.Ffi.get this "length")
  let set_length this x = Js.Ffi.set this "length" (Js.Any.of_int x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let contents this =
    Function_or_method_contents.of_any (Js.Ffi.get this "contents")

  let set_contents this x =
    Js.Ffi.set this "contents" (Function_or_method_contents.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/LazyFunctionDeclaration} \
   [LazyFunctionDeclaration] on MDN}."]

and Function_or_method_contents : sig
  type t = [ `Function_or_method_contents ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents} \
     [FunctionOrMethodContents]} interface."]

  type 'a super = 'a Js.t
    constraint 'a = [< `Function_or_method_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents} \
     [FunctionOrMethodContents]} interface or any base interface that it \
     inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val is_this_captured : t -> bool
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val set_is_this_captured : t -> bool -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/isThisCaptured} \
     [isThisCaptured] on MDN}."]

  val parameter_scope : t -> Asserted_parameter_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/parameterScope} \
     [parameterScope] on MDN}."]

  val set_parameter_scope : t -> Asserted_parameter_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/parameterScope} \
     [parameterScope] on MDN}."]

  val params : t -> 'a Formal_parameters.super
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/params} \
     [params] on MDN}."]

  val set_params : t -> Formal_parameters.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/params} \
     [params] on MDN}."]

  val body_scope : t -> Asserted_var_scope.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/bodyScope} \
     [bodyScope] on MDN}."]

  val set_body_scope : t -> Asserted_var_scope.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/bodyScope} \
     [bodyScope] on MDN}."]

  val body : t -> Function_body.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/body} \
     [body] on MDN}."]

  val set_body : t -> Function_body.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents/body} \
     [body] on MDN}."]
end = struct
  type t = [ `Function_or_method_contents ] Js.t

  type 'a super = 'a Js.t
    constraint 'a = [< `Function_or_method_contents | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents} \
     [FunctionOrMethodContents]} interface or any base interface that it \
     inherits."]

  let t = Js.Ffi.constr "FunctionOrMethodContents"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let is_this_captured this = Js.Any.to_bool (Js.Ffi.get this "isThisCaptured")

  let set_is_this_captured this x =
    Js.Ffi.set this "isThisCaptured" (Js.Any.of_bool x)

  let parameter_scope this =
    Asserted_parameter_scope.of_any (Js.Ffi.get this "parameterScope")

  let set_parameter_scope this x =
    Js.Ffi.set this "parameterScope" (Asserted_parameter_scope.to_any x)

  let params this = Formal_parameters.of_any (Js.Ffi.get this "params")
  let set_params this x = Js.Ffi.set this "params" (Formal_parameters.to_any x)
  let body_scope this = Asserted_var_scope.of_any (Js.Ffi.get this "bodyScope")

  let set_body_scope this x =
    Js.Ffi.set this "bodyScope" (Asserted_var_scope.to_any x)

  let body this = Function_body.of_any (Js.Ffi.get this "body")
  let set_body this x = Js.Ffi.set this "body" (Function_body.to_any x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/FunctionOrMethodContents} \
   [FunctionOrMethodContents] on MDN}."]

and Script : sig
  type t = [ `Script ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script} [Script]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Script | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script} [Script]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val scope : t -> Asserted_script_global_scope.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Script/scope} \
     [scope] on MDN}."]

  val set_scope : t -> Asserted_script_global_scope.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Script/scope} \
     [scope] on MDN}."]

  val directives : t -> Directive.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script/directives} \
     [directives] on MDN}."]

  val set_directives : t -> Directive.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script/directives} \
     [directives] on MDN}."]

  val statements : t -> Statement.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script/statements} \
     [statements] on MDN}."]

  val set_statements : t -> Statement.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script/statements} \
     [statements] on MDN}."]
end = struct
  type t = [ `Script ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Script | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Script} [Script]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Script"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let scope this = Asserted_script_global_scope.of_any (Js.Ffi.get this "scope")

  let set_scope this x =
    Js.Ffi.set this "scope" (Asserted_script_global_scope.to_any x)

  let directives this =
    (Js.Any.to_array Directive.of_any) (Js.Ffi.get this "directives")

  let set_directives this x =
    Js.Ffi.set this "directives" ((Js.Any.of_array Directive.to_any) x)

  let statements this =
    (Js.Any.to_array Statement.of_any) (Js.Ffi.get this "statements")

  let set_statements this x =
    Js.Ffi.set this "statements" ((Js.Any.of_array Statement.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Script} [Script] \
   on MDN}."]

and Spread_element : sig
  type t = [ `Spread_element ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SpreadElement} \
     [SpreadElement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Spread_element | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SpreadElement} \
     [SpreadElement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val expression : t -> Expression.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SpreadElement/expression} \
     [expression] on MDN}."]

  val set_expression : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SpreadElement/expression} \
     [expression] on MDN}."]
end = struct
  type t = [ `Spread_element ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Spread_element | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SpreadElement} \
     [SpreadElement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "SpreadElement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let expression this = Expression.of_any (Js.Ffi.get this "expression")
  let set_expression this x = Js.Ffi.set this "expression" (Expression.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SpreadElement} \
   [SpreadElement] on MDN}."]

and Super : sig
  type t = [ `Super ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Super} [Super]} \
     interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Super | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Super} [Super]} \
     interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any
end = struct
  type t = [ `Super ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Super | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/Super} [Super]} \
     interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "Super"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/Super} [Super] on \
   MDN}."]

and Switch_case : sig
  type t = [ `Switch_case ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase} \
     [SwitchCase]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Switch_case | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase} \
     [SwitchCase]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val test : t -> Expression.t
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase/test} \
     [test] on MDN}."]

  val set_test : t -> Expression.t -> unit
  [@@ocaml.doc
    "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase/test} \
     [test] on MDN}."]

  val consequent : t -> Statement.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase/consequent} \
     [consequent] on MDN}."]

  val set_consequent : t -> Statement.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase/consequent} \
     [consequent] on MDN}."]
end = struct
  type t = [ `Switch_case ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Switch_case | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase} \
     [SwitchCase]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "SwitchCase"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let test this = Expression.of_any (Js.Ffi.get this "test")
  let set_test this x = Js.Ffi.set this "test" (Expression.to_any x)

  let consequent this =
    (Js.Any.to_array Statement.of_any) (Js.Ffi.get this "consequent")

  let set_consequent this x =
    Js.Ffi.set this "consequent" ((Js.Any.of_array Statement.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SwitchCase} \
   [SwitchCase] on MDN}."]

and Switch_default : sig
  type t = [ `Switch_default ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchDefault} \
     [SwitchDefault]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Switch_default | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchDefault} \
     [SwitchDefault]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val consequent : t -> Statement.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchDefault/consequent} \
     [consequent] on MDN}."]

  val set_consequent : t -> Statement.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchDefault/consequent} \
     [consequent] on MDN}."]
end = struct
  type t = [ `Switch_default ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Switch_default | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/SwitchDefault} \
     [SwitchDefault]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "SwitchDefault"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this

  let consequent this =
    (Js.Any.to_array Statement.of_any) (Js.Ffi.get this "consequent")

  let set_consequent this x =
    Js.Ffi.set this "consequent" ((Js.Any.of_array Statement.to_any) x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/SwitchDefault} \
   [SwitchDefault] on MDN}."]

and Template_element : sig
  type t = [ `Template_element ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateElement} \
     [TemplateElement]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Template_element | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateElement} \
     [TemplateElement]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val raw_value : t -> String.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateElement/rawValue} \
     [rawValue] on MDN}."]

  val set_raw_value : t -> String.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateElement/rawValue} \
     [rawValue] on MDN}."]
end = struct
  type t = [ `Template_element ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Template_element | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/TemplateElement} \
     [TemplateElement]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "TemplateElement"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let raw_value this = String.of_any (Js.Ffi.get this "rawValue")
  let set_raw_value this x = Js.Ffi.set this "rawValue" (String.to_any x)
end
[@@ocaml.doc
  "See {{: https://developer.mozilla.org/en-US/docs/Web/API/TemplateElement} \
   [TemplateElement] on MDN}."]

and Variable_declaration : sig
  type t = [ `Variable_declaration ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration} \
     [VariableDeclaration]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Variable_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration} \
     [VariableDeclaration]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val kind : t -> Variable_declaration_kind.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration/kind} \
     [kind] on MDN}."]

  val set_kind : t -> Variable_declaration_kind.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration/kind} \
     [kind] on MDN}."]

  val declarators : t -> Variable_declarator.t array
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration/declarators} \
     [declarators] on MDN}."]

  val set_declarators : t -> Variable_declarator.t array -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration/declarators} \
     [declarators] on MDN}."]
end = struct
  type t = [ `Variable_declaration ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Variable_declaration | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration} \
     [VariableDeclaration]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "VariableDeclaration"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let kind this = Variable_declaration_kind.of_any (Js.Ffi.get this "kind")

  let set_kind this x =
    Js.Ffi.set this "kind" (Variable_declaration_kind.to_any x)

  let declarators this =
    (Js.Any.to_array Variable_declarator.of_any) (Js.Ffi.get this "declarators")

  let set_declarators this x =
    Js.Ffi.set this "declarators"
      ((Js.Any.of_array Variable_declarator.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclaration} \
   [VariableDeclaration] on MDN}."]

and Variable_declarator : sig
  type t = [ `Variable_declarator ] Js.t
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator} \
     [VariableDeclarator]} interface."]

  type 'a super = 'a Js.t constraint 'a = [< `Variable_declarator | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator} \
     [VariableDeclarator]} interface or any base interface that it inherits."]

  val of_any : Js.any -> 'a super
  val to_any : t -> Js.any

  val binding : t -> Binding.t
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator/binding} \
     [binding] on MDN}."]

  val set_binding : t -> Binding.t -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator/binding} \
     [binding] on MDN}."]

  val init : t -> Expression.t option
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator/init} \
     [init] on MDN}."]

  val set_init : t -> Expression.t option -> unit
  [@@ocaml.doc
    "See {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator/init} \
     [init] on MDN}."]
end = struct
  type t = [ `Variable_declarator ] Js.t

  type 'a super = 'a Js.t constraint 'a = [< `Variable_declarator | `Node ]
  [@@ocaml.doc
    "The type for the {{: \
     https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator} \
     [VariableDeclarator]} interface or any base interface that it inherits."]

  let t = Js.Ffi.constr "VariableDeclarator"
  let to_any = Js.to_any
  let of_any = Js.of_any
  let to_node this = Js.Ffi.magic this
  let binding this = Binding.of_any (Js.Ffi.get this "binding")
  let set_binding this x = Js.Ffi.set this "binding" (Binding.to_any x)

  let init this =
    (Js.Any.nullable_to_option Expression.of_any) (Js.Ffi.get this "init")

  let set_init this x =
    Js.Ffi.set this "init" ((Js.Any.nullable_of_option Expression.to_any) x)
end
[@@ocaml.doc
  "See {{: \
   https://developer.mozilla.org/en-US/docs/Web/API/VariableDeclarator} \
   [VariableDeclarator] on MDN}."]
