module type Jx = sig
  type t

  val null : t
  val of_string : string -> t
  val to_string : t -> string
end

module Wi = Webidl_ast
module Ml = Ppxlib_ast.Ast_helper
module Asttypes = Astlib.Ast_414.Asttypes
open Prelude

let cat ?(sep = "") xs = String.concat sep xs
let loc = Location.none
let mknoloc = Location.mknoloc
let mkloc = Location.mkloc

let mkoptloc x optloc =
  match optloc with
  | None -> mknoloc x
  | Some loc -> mkloc x loc

let snake_case =
  let re1 = Re.Pcre.regexp "([A-Z]+)([A-Z][a-z]{2,})" in
  let re2 = Re.Pcre.regexp "([a-z0-9])([A-Z])" in
  let underscore re s =
    let replace groups =
      Printf.sprintf "%s_%s" (Re.Group.get groups 1) (Re.Group.get groups 2)
    in
    Re.replace re ~f:replace s
  in
  fun s ->
    let len = String.length s in
    if len > 1 then
      let s = underscore re1 s in
      let s = underscore re2 s in
      Printf.sprintf "%c%s" s.[0]
        (String.lowercase_ascii (String.sub s 1 (String.length s - 1)))
    else s

let char_is_upper = function
  | 'A' .. 'Z' -> true
  | _ -> false

let string_dash_to_underscore s =
  String.map
    (function
      | '-' -> '_'
      | x -> x
      )
    s

module Config = struct
  let stringifier_name = "to_string"
  let constructor_name = "make"
  let to_iterable_name = "to_iterable"
  let constructor_prefix = "with"

  let rename ?(keyword = true) name =
    let name = string_dash_to_underscore name in
    if keyword then
      match name with
      | "type" -> "type_"
      | "method" -> "method_"
      | "module" -> "module_"
      | "open" -> "open_"
      | "object" -> "object_"
      | "in" -> "in_"
      | "end" -> "end_"
      | "include" -> "include_"
      | _ -> snake_case name
    else snake_case name

  let rename_upper name = String.capitalize_ascii (rename name)
  let rename_lower ?keyword name = String.lowercase_ascii (rename ?keyword name)
end

module Ml' = struct
  module Typ = struct
    let unit ?loc ?attrs () =
      Ml.Typ.constr ?loc ?attrs (mkoptloc (Longident.Lident "unit") loc) []

    let string ?loc ?attrs () =
      Ml.Typ.constr ?loc ?attrs (mkoptloc (Longident.Lident "string") loc) []

    let t ?loc ?attrs args =
      let ident = mkoptloc (Longident.Lident "t") loc in
      Ml.Typ.constr ?loc ?attrs ident args

    let t0 = t []

    let array ?loc ?attrs arg =
      let ident = mkoptloc (Longident.Lident "array") loc in
      Ml.Typ.constr ?loc ?attrs ident [ arg ]

    let option ?loc ?attrs arg =
      let ident = mkoptloc (Longident.Lident "option") loc in
      Ml.Typ.constr ?loc ?attrs ident [ arg ]

    let mk0 ?loc ?attrs name =
      let ident = mkoptloc (Longident.Lident name) loc in
      Ml.Typ.constr ?loc ?attrs ident []

    let m_t ?loc ?attrs name args =
      let ident = mkoptloc Longident.(Ldot (Lident name, "t")) loc in
      Ml.Typ.constr ?loc ?attrs ident args
  end

  module Exp = struct
    let fun_id =
      Ml.Exp.fun_ Nolabel None
        (Ml.Pat.var (mknoloc "x"))
        (Ml.Exp.ident (mknoloc (Longident.Lident "x")))

    let unit () = Ml.Exp.construct (mknoloc (Longident.Lident "()")) None
    let none () = Ml.Exp.construct (mknoloc (Longident.Lident "None")) None
    let some x = Ml.Exp.construct (mknoloc (Longident.Lident "Some")) (Some x)
  end
end

module Ml_js = struct
  module Typ = struct
    let mk0 ?loc ?attrs name =
      let ident = mkoptloc Longident.(Ldot (Lident "Js", name)) loc in
      Ml.Typ.constr ?loc ?attrs ident []

    let mk1 ?loc ?attrs name arg =
      let ident = mkoptloc Longident.(Ldot (Lident "Js", name)) loc in
      Ml.Typ.constr ?loc ?attrs ident [ arg ]

    let mk ?loc ?attrs name args =
      let ident = mkoptloc Longident.(Ldot (Lident "Js", name)) loc in
      Ml.Typ.constr ?loc ?attrs ident args

    let any = mk0 "any"
    let t1 = mk1 "t"

    let t_tagged name =
      let variant =
        Ml.Typ.variant [ Ml.Rf.tag (mknoloc name) false [] ] Closed None
      in
      mk1 "t" variant

    let void ?loc ?attrs () = mk0 ?loc ?attrs "void"
    let string ?loc ?attrs () = mk0 ?loc ?attrs "string"
    let nullable ?loc ?attrs arg = mk1 ?loc ?attrs "nullable" arg
    let undefined ?loc ?attrs arg = mk1 ?loc ?attrs "undefined" arg
    let sequence ?loc ?attrs arg = mk1 ?loc ?attrs "sequence" arg
    let array ?loc ?attrs arg = mk1 ?loc ?attrs "array" arg
    let promise ?loc ?attrs arg = mk1 ?loc ?attrs "promise" arg
    let iterable1 ?loc ?attrs arg = mk1 ?loc ?attrs "iterable" arg

    let iterable2 ?loc ?attrs arg1 arg2 =
      mk ?loc ?attrs "iterable" [ arg1; arg2 ]
  end
end

let js_ident name = Ml.Exp.ident (mknoloc (Longident.Ldot (Lident "Js", name)))
let ident xs = Option.get (Longident.unflatten xs)
let ident_exp xs = Ml.Exp.ident (mknoloc (ident xs))

let js_nullable_ident name =
  let ident = Longident.unflatten [ "Js"; "Nullable"; name ] |> Option.get in
  Ml.Exp.ident (mknoloc ident)

let exp_apply_no_labels f args =
  Ml.Exp.apply f (List.map (fun arg -> (Asttypes.Nolabel, arg)) args)

(* Jx values lifted to ML syntax *)
module Jx_lift = struct
  let t = Ml.Typ.constr (mknoloc (Longident.Ldot (Lident "Js", "t"))) []
  let any = Ml.Typ.constr (mknoloc (Longident.Ldot (Lident "Js", "any"))) []
  let of_string = js_ident "of_string"
  let to_string = js_ident "to_string"
  let get = ident_exp [ "Js"; "Ffi"; "get" ]
  let set = ident_exp [ "Js"; "Ffi"; "set" ]
  let repr = js_ident "repr"
end

module Jx_builder = struct
  let of_string str =
    exp_apply_no_labels Jx_lift.of_string
      [ Ml.Exp.constant (Ml.Const.string str) ]

  let get obj key = exp_apply_no_labels Jx_lift.get [ obj; key ]
  let set obj key value = exp_apply_no_labels Jx_lift.set [ obj; key; value ]

  module Nullable = struct
    let map f t = exp_apply_no_labels (js_nullable_ident "map") [ f; t ]
  end
end

module Js_expect = struct
  let string = ident [ "Js"; "Expect"; "string" ]
end

(* Gen common *)
module Gen_common = struct
  let argument_name (this : Wi.argument) =
    match this with
    | `Optional (`Ident name, _, _)
    | `Variadic (`Ident name, _)
    | `Fixed (`Ident name, _) -> name
    | `Optional (`Keyword kwd, _, _)
    | `Variadic (`Keyword kwd, _)
    | `Fixed (`Keyword kwd, _) -> Wi.string_of_argument_name_keyword kwd

  let type_tag t =
    match t with
    | `Boolean -> "Bool"
    | `Byte -> "Byte"
    | `Octet -> "Octet"
    | `Unrestricted `Float -> "Unrestricted_float"
    | `Unrestricted `Double -> "Unrestricted_double"
    | `Float -> "Float"
    | `Double -> "Double"
    | `Unsigned `Short -> "Unsigned_short"
    | `Unsigned `Long -> "Unsigned_long"
    | `Unsigned `Long_long -> "Unsigned_long_long"
    | `Short -> "Short"
    | `Long -> "Long"
    | `Long_long -> "Long_long"
    | `Bigint -> "Bigint"
    | #Wi.buffer_type as t -> Wi.string_of_buffer_type t
    | `Ident x -> String.capitalize_ascii (Config.rename x)
    | `Sequence _ -> "Sequence"
    | `Object -> "Object"
    | `Symbol -> "Symbol"
    | `Frozen_array _ -> "Frozen_array"
    | `Observable_array _ -> "Observable_array"
    (* [FIXME] must be valid ident *)
    | `Name name -> Config.rename name
    | `Any -> "Any"
    | `Undefined -> "Undefined"
    | `Record _ -> "Record"
    | `Byte_string -> "String"
    | `Dom_string -> "String"
    | `Usv_string -> "String"
    | `Promise _ -> "Promise"
    | `Union _ -> "Union"

  let string_of_primitive (this : Wi.primitive_type) =
    match this with
    | `Boolean -> "bool"
    | `Byte -> "char"
    | `Octet -> "char"
    | `Unrestricted `Float -> "float"
    | `Unrestricted `Double -> "float"
    | `Float -> "float"
    | `Double -> "float"
    | `Unsigned `Short -> "int"
    | `Unsigned `Long -> "int"
    | `Unsigned `Long_long -> "int"
    | `Short -> "int"
    | `Long -> "int"
    | `Long_long -> "int"
    (* TODO *)
    | `Bigint -> "bigint"
end

module Gen_sig = struct
  let mk_typ0 name = Ml.Typ.constr (mknoloc (Longident.Lident name)) []
  let gen_primitive this = Ml'.Typ.mk0 (Gen_common.string_of_primitive this)

  let any_conv_sigi_l =
    [
      Ml.Sig.value
        (Ml.Val.mk (mknoloc "to_any")
           (Ml.Typ.arrow Nolabel Ml'.Typ.t0 Ml_js.Typ.any)
        );
      Ml.Sig.value
        (Ml.Val.mk (mknoloc "of_any")
           (Ml.Typ.arrow Nolabel Ml_js.Typ.any Ml'.Typ.t0)
        );
    ]

  let gen_string (this : Wi.string_type) =
    match this with
    | `Byte_string -> Ml'.Typ.mk0 "string"
    | `Dom_string -> Ml'.Typ.mk0 "string"
    | `Usv_string -> Ml'.Typ.mk0 "string"

  let gen_type_name that =
    match that with
    | id when char_is_upper (String.get id 0) ->
      Ml_js.Typ.t_tagged (Config.rename_upper id)
    (* FIXME: Should any id be uscoped? *)
    | id -> mk_typ0 id

  let rec gen_distinguishable (this : Wi.distinguishable_type) =
    let todo x = Ml.Typ.var ("todo_" ^ x) in
    match this with
    | #Wi.primitive_type as that -> gen_primitive that
    | #Wi.string_type as that -> gen_string that
    | `Name that -> gen_type_name that
    | `Sequence that ->
      let arg = gen_type_ext that in
      Ml_js.Typ.array arg
    | `Object -> todo "object"
    | `Symbol -> todo "symbol"
    | #Wi.buffer_type -> todo "buffer"
    | `Frozen_array fa -> todo "frozen_array"
    | `Observable_array fa -> todo "observable_array"
    | `Record (string_type, type_ext) -> todo "record"
    | `Undefined -> Ml'.Typ.unit ()

  and gen_nullable t is_nullable = if is_nullable then Ml'.Typ.option t else t

  (* [TODO] Simflify nullable types
     (a? or b?) -> [`Nullable of [`A | `B]] js
     (a? or b? or c) -> [`Nullable of [`A | `B] | `C] js

     what about (a? or b?)? - is this allowed?
  *)
  and gen_union ((t1, t2, ts), is_nullable) =
    let todo x =
      Ml.Rf.tag (mknoloc "Todo") false [ Ml.Typ.var ("todo_" ^ x) ]
    in
    let nullable_tag t = Ml.Rf.tag (mknoloc "Nullable") false [ t ] in
    let ts' : Wi.union_member_type list = t1 :: t2 :: ts in
    let cases =
      List.map
        (function
          | `Single (_ext, (t : Wi.distinguishable_type), is_nullable) ->
            let name = Gen_common.type_tag t in
            let tag = Ml.Rf.tag (mknoloc name) false [] in
            if is_nullable then nullable_tag (Ml.Typ.variant [ tag ] Closed None)
            else tag
          | `Nested u -> todo "union union"
          )
        ts'
    in
    let t = Ml.Typ.variant cases Closed None in
    if is_nullable then Ml_js.Typ.nullable t else Ml_js.Typ.t1 t

  and gen_type (this : Wi.type_) =
    match this with
    | `Distinguishable (typ, is_nullable) ->
      gen_nullable (gen_distinguishable typ) is_nullable
    | `Any -> Ml_js.Typ.any
    | `Promise that ->
      let arg = gen_type that in
      Ml_js.Typ.promise arg
    | `Union that -> gen_union that

  and gen_type_ext ((_ext, type') : Wi.type_ext) = gen_type type'

  let gen_const_type (this : Wi.const_type) =
    match this with
    | #Wi.primitive_type as that -> gen_primitive that
    | `Name that -> gen_type_name that

  let gen_attribute_get (this : Wi.Attribute.t) =
    let name = mknoloc (String.lowercase_ascii (Config.rename this.name)) in
    let ret_type = gen_type_ext this.type_ in
    let type' = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type in
    let vd = Ml.Val.mk name type' in
    Ml.Sig.value vd

  let gen_attribute_set (this : Wi.Attribute.t) =
    let name = mknoloc ("set_" ^ Config.rename ~keyword:false this.name) in
    let ret_type = gen_type_ext this.type_ in
    let ret_type = Ml.Typ.arrow Nolabel ret_type (Ml'.Typ.unit ()) in
    let type' = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type in
    let vd = Ml.Val.mk name type' in
    Ml.Sig.value vd

  (* [TODO] static attributes (const?) *)
  let gen_attribute ~is_static ~is_readonly (this : Wi.Attribute.t) =
    if is_readonly then [ gen_attribute_get this ]
    else [ gen_attribute_get this; gen_attribute_set this ]

  let gen_argument_ext (_ext, (this : Wi.argument)) =
    match this with
    | `Optional (name, t, _default) ->
      let name = Wi.string_of_argument_name name in
      let t_ml = gen_type_ext t in
      (Asttypes.Optional (Config.rename name), t_ml)
    | `Variadic (name, t) ->
      let name = Wi.string_of_argument_name name in
      (Labelled (Config.rename name), Ml_js.Typ.array (gen_type t))
    | `Fixed (name, t) ->
      let name = Wi.string_of_argument_name name in
      (Labelled (Config.rename name), gen_type t)

  let make_special_operation_name (special : Wi.special) name =
    let prefix =
      match special with
      | Getter -> "get"
      | Setter -> "set"
      | Deleter -> "delete"
    in
    match name with
    | None -> prefix
    | Some name ->
      String.concat "_" [ prefix; String.lowercase_ascii (Config.rename name) ]

  (* [FIXME] "set" might collide with a non-setter operation *)
  let gen_operation_setter (this : Wi.Special_operation.t) =
    let name = mknoloc (make_special_operation_name this.special this.name) in
    let this_t = Ml'.Typ.t [] in
    let type' = gen_type this.type_ in
    let type' =
      List.fold_left
        (fun acc arg ->
          let label, ml_arg = gen_argument_ext arg in
          Ml.Typ.arrow label ml_arg acc
        )
        type' (List.rev this.arguments)
    in
    let type' = Ml.Typ.arrow Nolabel this_t type' in
    let vd = Ml.Val.mk name type' in
    [ Ml.Sig.value vd ]

  (* [FIXME] "get" might collide with a non-setter operation *)
  let gen_operation_getter (this : Wi.Special_operation.t) =
    let name = mknoloc (make_special_operation_name this.special this.name) in
    let this_t = Ml'.Typ.t [] in
    let type' = gen_type this.type_ in
    let type' =
      List.fold_left
        (fun acc arg ->
          let label, ml_arg = gen_argument_ext arg in
          Ml.Typ.arrow label ml_arg acc
        )
        type' (List.rev this.arguments)
    in
    let type' = Ml.Typ.arrow Nolabel this_t type' in
    let vd = Ml.Val.mk name type' in
    [ Ml.Sig.value vd ]

  (* [FIXME] "delete" might collide with a non-setter operation *)
  let gen_operation_deleter (this : Wi.Special_operation.t) =
    let name = mknoloc (make_special_operation_name this.special this.name) in
    let this_t = Ml'.Typ.t [] in
    let type' = gen_type this.type_ in
    let type' =
      List.fold_left
        (fun acc arg ->
          let label, ml_arg = gen_argument_ext arg in
          Ml.Typ.arrow label ml_arg acc
        )
        type' (List.rev this.arguments)
    in
    let type' = Ml.Typ.arrow Nolabel this_t type' in
    let vd = Ml.Val.mk name type' in
    [ Ml.Sig.value vd ]

  let gen_special_operation (special_operation : Wi.Special_operation.t) =
    match special_operation.special with
    | Getter -> gen_operation_getter special_operation
    | Setter -> gen_operation_setter special_operation
    | Deleter -> gen_operation_deleter special_operation

  let gen_regular_operation ~is_static (this : Wi.Regular_operation.t) =
    match this.name with
    | None -> failwith "todo: regular operation without ident"
    | Some op_ident ->
      let name = mknoloc (Config.rename_lower op_ident) in
      let type' = gen_type this.type_ in
      let main_arg = if is_static then Ml'.Typ.unit () else Ml'.Typ.t [] in
      let type' = Ml.Typ.arrow Nolabel main_arg type' in
      let type' =
        List.fold_left
          (fun acc arg ->
            let label, ml_arg = gen_argument_ext arg in
            Ml.Typ.arrow label ml_arg acc
          )
          type' (List.rev this.arguments)
      in
      let vd = Ml.Val.mk name type' in
      [ Ml.Sig.value vd ]

  let gen_stringifier (this : Wi.Stringifier.t) =
    match this with
    | Standalone -> []
    | Attribute { attribute; readonly = is_readonly } ->
      let items = gen_attribute ~is_static:false ~is_readonly attribute in
      let stringifier_attr =
        { attribute with name = Config.stringifier_name }
      in
      let stringifier_items =
        gen_attribute ~is_static:false ~is_readonly stringifier_attr
      in
      stringifier_items @ items

  let gen_const ({ type_; ident; value = _ } : Wi.Const.t) =
    let name = mknoloc (String.lowercase_ascii (Config.rename ident)) in
    let typ = gen_const_type type_ in
    let vd = Ml.Val.mk name typ in
    Ml.Sig.value vd

  let gen_constructor arguments =
    let typ0 = Ml.Typ.arrow Nolabel (Ml'.Typ.unit ()) (Ml'.Typ.t []) in
    let typ, arg_names =
      List.fold_left
        (fun (typ, arg_names) arg ->
          let arg_name =
            Config.rename ~keyword:false (Gen_common.argument_name (snd arg))
          in
          let label, ml_arg = gen_argument_ext arg in
          (Ml.Typ.arrow label ml_arg typ, arg_name :: arg_names)
        )
        (typ0, []) (List.rev arguments)
    in
    let name =
      match arg_names with
      | [] | [ _ ] -> mknoloc (String.lowercase_ascii Config.constructor_name)
      | _ ->
        let arg_names_str = String.concat "_and_" arg_names in
        let name =
          String.concat "_" [ Config.constructor_prefix; arg_names_str ]
        in
        mknoloc name
    in
    let vd = Ml.Val.mk name typ in
    Ml.Sig.value vd

  let gen_iterable ({ value_type; key_type } : Wi.iterable) =
    match key_type with
    | Some key_type ->
      let typ =
        Ml_js.Typ.iterable2 (gen_type (snd key_type)) (gen_type (snd value_type))
      in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) typ in
      let name = mknoloc (String.lowercase_ascii Config.to_iterable_name) in
      let vd = Ml.Val.mk name typ in
      [ Ml.Sig.value vd ]
    | None ->
      let typ = Ml_js.Typ.iterable1 (gen_type (snd value_type)) in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) typ in
      let name = mknoloc (String.lowercase_ascii Config.to_iterable_name) in
      let vd = Ml.Val.mk name typ in
      [ Ml.Sig.value vd ]

  (* --- Interface --- *)

  let gen_interface_member (this : Wi.Interface.member) =
    let todo x = Ml.Sig.value (Ml.Val.mk (mknoloc x) (Ml.Typ.any ())) in
    match this with
    | Constructor that -> [ gen_constructor that ]
    | Const that -> [ gen_const that ]
    | Regular_operation { regular_operation; is_static } ->
      gen_regular_operation ~is_static regular_operation
    | Special_operation special_operation ->
      gen_special_operation special_operation
    | Stringifier that -> gen_stringifier that
    | Iterable that -> gen_iterable that
    | Async_iterable that -> [ todo "async_iterable" ]
    | Attribute { attribute; is_static; is_readonly } ->
      gen_attribute ~is_static ~is_readonly attribute
    | Inherit_attribute attribute -> [ todo "inherit_attribute" ]
    | Maplike maplike -> [ todo "maplike" ]
    | Setlike setlike -> [ todo "setlike" ]

  let gen_interface_member_ext
      ((_ext : Wi.extended_attributes), (interface_member : Wi.Interface.member))
      =
    gen_interface_member interface_member

  let gen_interface ~(ctx : Analyze.ctx) (this : Wi.Interface.t) =
    let partial_members =
      match String_map.find_opt this.name ctx.partial_interfaces with
      | None -> []
      | Some p_intf_list ->
        List.concat_map
          (fun (p_intf : Wi.Partial_interface.t) ->
            List.map
              (fun (ext, m) -> (ext, Wi.Interface.of_partial_interface_member m))
              p_intf.members
          )
          p_intf_list
    in
    let includes_members =
      match String_map.find_opt this.name ctx.interface_includes with
      | None -> []
      | Some mixins ->
        String_map.fold
          (fun _mixin_name (mixin : Wi.Mixin.t) acc ->
            List.fold_left
              (fun acc (ext, m) -> (ext, Wi.Interface.of_mixin_member m) :: acc)
              acc mixin.members
          )
          mixins []
    in
    let t_inherits =
      match this.inherits with
      | None -> []
      | Some base_class_name ->
        let val_name =
          mknoloc ("to_" ^ Config.rename_lower ~keyword:false base_class_name)
        in
        let ret_typ_name = Config.rename_upper base_class_name in
        let ret_type =
          if String.equal ret_typ_name "Object" then
            Ml.Typ.constr (mknoloc (ident [ "Js"; "Obj"; "t" ])) []
          else Ml.Typ.constr (mknoloc (ident [ ret_typ_name; "t" ])) []
        in
        let type' = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type in
        let vd = Ml.Val.mk val_name type' in
        [ Ml.Sig.value vd ]
    in
    let all_members = this.members @ partial_members @ includes_members in
    let member_items = List.concat_map gen_interface_member_ext all_members in
    let t_item =
      let manifest = Ml_js.Typ.t_tagged (Config.rename_upper this.name) in
      Ml.Sig.type_ Recursive [ Ml.Type.mk (mknoloc "t") ~manifest ]
    in
    Ml.Mty.signature ((t_item :: t_inherits) @ member_items)

  (* --- Include --- *)

  let gen_include_with_type module_name =
    Ml.Incl.mk
      (Ml.Mty.with_
         (Ml.Mty.ident (mknoloc (Longident.Lident module_name)))
         [
           Pwith_typesubst
             ( mknoloc (Longident.Lident "t"),
               Ml.Type.mk ~manifest:(Ml'.Typ.t []) (mknoloc "t")
             );
         ]
      )
    |> Ml.Sig.include_

  (* --- Callback interface --- *)

  let gen_callback_interface_member_ext
      ((_ext : Wi.extended_attributes), (m : Wi.Callback_interface.member)) =
    match m with
    | Const that -> [ gen_const that ]
    | Regular_operation regular_operation ->
      gen_regular_operation ~is_static:false regular_operation

  let gen_callback_type ~return arguments =
    let typ = gen_type return in
    let typ =
      List.fold_left
        (fun acc arg ->
          let label, ml_arg = gen_argument_ext arg in
          Ml.Typ.arrow label ml_arg acc
        )
        typ (List.rev arguments)
    in
    Ml.Type.mk (mknoloc "t") ~manifest:typ

  let gen_callback_interface (this : Wi.Callback_interface.t) =
    let const_l, cbt_l =
      List.fold_left
        (fun (const_l, cbt_l) (_ext, (m : Wi.Callback_interface.member)) ->
          match m with
          | Const that ->
            let c = gen_const that in
            (c :: const_l, cbt_l)
          | Regular_operation that ->
            let cbt = gen_callback_type ~return:that.type_ that.arguments in
            (const_l, cbt :: cbt_l)
        )
        ([], []) this.members
    in
    let cbt =
      match cbt_l with
      | [ x ] -> x
      | [] -> fail "callback interface %S: missing regular operation" this.name
      | _ -> fail "callback interface %S: too many regular operations" this.name
    in
    let cbt_sigi = Ml.Sig.type_ Recursive [ cbt ] in
    Ml.Mty.signature (cbt_sigi :: const_l)

  (* --- Enum --- *)

  let gen_enum (this : Wi.Enum.t) =
    let t_item = Ml.Sig.type_ Recursive [ Ml.Type.mk (mknoloc "t") ] in
    let to_str_val =
      Ml.Sig.value
        (Ml.Val.mk (mknoloc "to_string")
           (Ml.Typ.arrow Nolabel (Ml'.Typ.t []) (Ml_js.Typ.string ()))
        )
    in
    let cases_items =
      List.map
        (fun c ->
          (* [FIXME] potential duplicate *)
          let name =
            if String.equal c "" then "empty" else Config.rename_lower c
          in
          Ml.Sig.value (Ml.Val.mk (mknoloc name) (Ml'.Typ.t []))
        )
        this.values
    in
    Ml.Mty.signature (t_item :: to_str_val :: cases_items)

  (* --- Mixin --- *)

  let gen_mixin_member (this : Wi.Mixin.member) =
    match this with
    | Const that -> [ gen_const that ]
    | Regular_operation that -> gen_regular_operation ~is_static:false that
    | Stringifier that -> gen_stringifier that
    | Attribute { attribute; is_readonly } ->
      gen_attribute ~is_static:false ~is_readonly attribute

  let gen_mixin_member_ext
      ((_ext : Wi.extended_attributes), (mixin_member : Wi.Mixin.member)) =
    gen_mixin_member mixin_member

  let gen_mixin (this : Wi.Mixin.t) =
    let name = mknoloc (Config.rename this.name) in
    let t_item = Ml.Sig.type_ Recursive [ Ml.Type.mk (mknoloc "t") ] in
    let member_items = List.concat_map gen_mixin_member_ext this.members in
    let mt = Ml.Mty.signature (t_item :: member_items) in
    let mtd = Ml.Mtd.mk ~typ:mt name in
    Ml.Sig.modtype mtd

  (* --- Dictionary --- *)

  let gen_dictionary_member (this : Wi.Dictionary.member) =
    match this with
    | Required (type_ext, name) ->
      let m_t = gen_type_ext type_ext in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) m_t in
      let getter =
        Ml.Sig.value (Ml.Val.mk (mknoloc (Config.rename name)) typ)
      in
      [ getter ]
    | Optional (type_, name, _default) ->
      let m_t = gen_type type_ in
      let m_t = Ml_js.Typ.nullable m_t in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) m_t in
      let getter =
        Ml.Sig.value (Ml.Val.mk (mknoloc (Config.rename name)) typ)
      in
      [ getter ]

  let gen_dictionary_member_ext
      ( (_ext : Wi.extended_attributes),
        (dictionary_member : Wi.Dictionary.member)
      ) =
    gen_dictionary_member dictionary_member

  let gen_dictionary_constructor
      (dictionary_members : (Wi.extended_attributes * Wi.Dictionary.member) list)
      =
    let members_rev =
      List.fold_left (fun acc (_ext, m) -> m :: acc) [] dictionary_members
    in
    let members_args_t =
      List.fold_left
        (fun t_tail (m : Wi.Dictionary.member) ->
          match m with
          | Required (t_ext, name) ->
            let l = Asttypes.Labelled (Config.rename name) in
            let m_arg_t = gen_type_ext t_ext in
            Ml.Typ.arrow l m_arg_t t_tail
          (* [TODO] mention default in docs *)
          | Optional (t, name, _default) ->
            let l = Asttypes.Optional (Config.rename name) in
            let m_arg_t = gen_type t in
            Ml.Typ.arrow l m_arg_t t_tail
        )
        (Ml.Typ.arrow Nolabel (Ml'.Typ.unit ()) (Ml'.Typ.t []))
        members_rev
    in
    Ml.Sig.value (Ml.Val.mk (mknoloc Config.constructor_name) members_args_t)

  let gen_dictionary (this : Wi.Dictionary.t) =
    let t_item = Ml.Sig.type_ Recursive [ Ml.Type.mk (mknoloc "t") ] in
    let t_cons = gen_dictionary_constructor this.members in
    let t_inherits =
      match this.inherits with
      | None -> []
      | Some base_class_name ->
        let val_name =
          mknoloc
            ("to_" ^ String.lowercase_ascii (Config.rename base_class_name))
        in
        let ret_typ_name = Config.rename base_class_name in
        let ret_type =
          Ml.Typ.constr (mknoloc Longident.(Ldot (Lident ret_typ_name, "t"))) []
        in
        let type' = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type in
        let vd = Ml.Val.mk val_name type' in
        [ Ml.Sig.value vd ]
    in
    let member_items = List.concat_map gen_dictionary_member_ext this.members in
    Ml.Mty.signature ((t_item :: t_cons :: t_inherits) @ member_items)

  (* --- Callback --- *)

  let gen_callback (this : Wi.Callback.t) =
    let return = gen_type this.return in
    let manifest =
      List.fold_left
        (fun typ arg ->
          let label, ml_arg = gen_argument_ext arg in
          Ml.Typ.arrow label ml_arg typ
        )
        return (List.rev this.arguments)
    in
    let t_item =
      Ml.Sig.type_ Recursive [ Ml.Type.mk ~manifest (mknoloc "t") ]
    in
    Ml.Mty.signature [ t_item ]
end

module Gen_str = struct
  let exp_unit = Ml.Exp.construct (mknoloc (Longident.Lident "()")) None
  let pat_unit = Ml.Pat.construct (mknoloc (Longident.Lident "()")) None
  let this_pat = Ml.Pat.var (mknoloc "this")
  let this_exp = Ml.Exp.ident (mknoloc (Longident.Lident "this"))
  let this_id_fun_exp = Ml.Exp.fun_ Nolabel None this_pat this_exp
  let x_pat = Ml.Pat.var (mknoloc "x")
  let x_exp = Ml.Exp.ident (mknoloc (Longident.Lident "x"))

  let t_stri =
    Ml.Str.type_ Recursive [ Ml.Type.mk (mknoloc "t") ~manifest:Jx_lift.any ]

  let any_conv_stri_l =
    [
      Ml.Str.value Nonrecursive
        [
          Ml.Vb.mk
            (Ml.Pat.var (mknoloc "to_any"))
            (Ml.Exp.fun_ Nolabel None this_pat this_exp);
        ];
      Ml.Str.value Nonrecursive
        [
          Ml.Vb.mk
            (Ml.Pat.var (mknoloc "of_any"))
            (Ml.Exp.fun_ Nolabel None this_pat this_exp);
        ];
    ]

  let string_of_primitive (this : Wi.primitive_type) =
    match this with
    | `Boolean -> "bool"
    | `Byte -> "char"
    | `Octet -> "char"
    | `Unrestricted `Float -> "float"
    | `Unrestricted `Double -> "float"
    | `Float -> "float"
    | `Double -> "float"
    | `Unsigned `Short -> "int"
    | `Unsigned `Long -> "int"
    | `Unsigned `Long_long -> "int"
    | `Short -> "int"
    | `Long -> "int"
    | `Long_long -> "int"
    | `Bigint -> "bigint"

  let classify_nullable t is_nullable = if is_nullable then `Nullable t else t

  let rec classify_distinguishable (this : Wi.distinguishable_type) =
    let todo x = failwith ("todo_" ^ x) in
    match this with
    | #Wi.primitive_type as that -> `Core (string_of_primitive that)
    | #Wi.string_type -> `Core "string"
    | `Name that -> `Named that
    | `Sequence that ->
      let arg = classify_type_ext that in
      `Sequence arg
    | `Object -> `Object
    | `Symbol -> `Symbol
    | #Wi.buffer_type -> todo "buffer"
    | `Frozen_array fa -> todo "frozen_array"
    | `Observable_array fa -> todo "observable_array"
    | `Record (string_type, type_ext) -> todo "record"
    | `Undefined -> `Undefined

  and classify_union (t1, t2, ts) =
    let ts' : Wi.union_member_type list = t1 :: t2 :: ts in
    let cases =
      List.map
        (function
          | `Single (_ext, (t : Wi.distinguishable_type), is_nullable) ->
            classify_nullable (classify_distinguishable t) is_nullable
          | `Nested u -> failwith "TODO: str: nested union"
          )
        ts'
    in
    `Union cases

  and classify_type (this : Wi.type_) =
    match this with
    | `Distinguishable (typ, is_nullable) ->
      classify_nullable (classify_distinguishable typ) is_nullable
    | `Any -> `Any
    | `Promise that -> `Promise (classify_type that)
    | `Union (typ, is_nullable) ->
      classify_nullable (classify_union typ) is_nullable

  and classify_type_ext ((_ext, type') : Wi.type_ext) = classify_type type'

  let gen_conv_classified conv c_typ =
    let any_prefix, named_suffix =
      match conv with
      | `ml_of_js -> ("to_", "of_any")
      | `js_of_ml -> ("of_", "to_any")
    in
    let rec loop c_typ =
      match c_typ with
      | `Core name -> ident_exp [ "Js"; "Any"; any_prefix ^ name ]
      | `Named _name ->
        (* let name = Config.rename_upper name in *)
        ident_exp [ "Js"; named_suffix ]
      | `Nullable (`Union _) -> ident_exp [ "Js"; named_suffix ]
      | `Nullable that ->
        let conv_that_exp = loop that in
        exp_apply_no_labels
          (ident_exp [ "Js"; "Any"; cat [ "nullable_"; any_prefix; "option" ] ])
          [ conv_that_exp ]
      | `Object -> js_ident "object_todo"
      | `Promise that ->
        let conv_that_exp = loop that in
        exp_apply_no_labels
          (ident_exp [ "Promise"; "of_any" ])
          [ conv_that_exp ]
      | `Sequence that ->
        let conv_that_exp = loop that in
        exp_apply_no_labels
          (ident_exp [ "Js"; any_prefix ^ "array" ])
          [ conv_that_exp ]
      | `Symbol -> js_ident "object_symbol"
      | `Undefined -> ident_exp [ "Js"; any_prefix ^ "unit" ]
      (* This should be identity. *)
      | `Any -> ident_exp [ "Js"; any_prefix ^ "any" ]
      | `Union _ -> ident_exp [ "Js"; named_suffix ]
    in
    loop c_typ

  let gen_conv_ext conv (_, typ) =
    let c_typ = classify_type typ in
    gen_conv_classified conv c_typ

  let gen_conv_ext_apply conv t_ext arg =
    let conv_exp = gen_conv_ext conv t_ext in
    exp_apply_no_labels conv_exp [ arg ]

  let gen_attribute_get (this : Wi.Attribute.t) =
    let pat = Ml.Pat.var (mknoloc (Config.rename_lower this.name)) in
    let key = Ml.Exp.constant (Ml.Const.string this.name) in
    let exp = Jx_builder.get this_exp key in
    (* TODO: no optional attrs? *)
    let exp = gen_conv_ext_apply `ml_of_js this.type_ exp in
    let exp = Ml.Exp.fun_ Nolabel None this_pat exp in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_attribute_set (this : Wi.Attribute.t) =
    let pat =
      Ml.Pat.var
        (mknoloc ("set_" ^ Config.rename_lower ~keyword:false this.name))
    in
    let key = Ml.Exp.constant (Ml.Const.string this.name) in
    (* TODO: no optional attrs? *)
    let exp = gen_conv_ext_apply `js_of_ml this.type_ x_exp in
    let exp = Jx_builder.set this_exp key exp in
    let exp = Ml.Exp.fun_ Nolabel None x_pat exp in
    let exp = Ml.Exp.fun_ Nolabel None this_pat exp in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  (* [TODO] static attributes (const?) *)
  let gen_attribute ~is_static ~is_readonly (this : Wi.Attribute.t) =
    if is_readonly then [ gen_attribute_get this ]
    else [ gen_attribute_get this; gen_attribute_set this ]

  (* --- Regular operation --- *)

  (* let gen_default (default : Wi.default_value option) =
     match default with
     | None -> None
     | Some (`Const (`Bool x)) ->
       Some (Ml.Exp.construct (mknoloc (ident [ string_of_bool x ])) None)
     | Some (`Const (`Float x)) ->
       Some (Ml.Exp.constant (Ml.Const.float (string_of_float x)))
     | Some (`Const (`Int x)) -> Some (Ml.Exp.constant (Ml.Const.int x))
     | Some (`String x) -> Some (Ml.Exp.constant (Ml.Const.string x))
     | Some `Empty_sequence -> Some (Ml.Exp.array [])
     | Some `Empty_object ->
       Some
         (exp_apply_no_labels
            (ident_exp [ "Js"; "Obj"; "empty" ])
            [ Ml'.Exp.unit () ]
         )
     | Some `Null -> Some (Ml'.Exp.none ())
     | Some `Undefined -> Some (ident_exp [ "Js"; "undefined" ]) *)

  let gen_argument_ext (_ext, (this : Wi.argument)) =
    match this with
    | `Optional (name, (ext, t), _default) ->
      let name = Config.rename_lower (Wi.string_of_argument_name name) in
      let t_ext = (ext, t) in
      (Asttypes.Optional name, true, name, t_ext)
    | `Variadic (name, t) ->
      let name = Config.rename_lower (Wi.string_of_argument_name name) in
      let t' = `Distinguishable (`Sequence ([], t), false) in
      (Labelled name, false, name, ([], t'))
    | `Fixed (name, t) ->
      let name = Config.rename_lower (Wi.string_of_argument_name name) in
      (Labelled name, false, name, ([], t))

  let gen_regular_operation ~is_static (this : Wi.Regular_operation.t) =
    match this.name with
    | None -> failwith "todo: regular operation without ident"
    | Some op_ident ->
      let op_key = Ml.Exp.constant (Ml.Const.string op_ident) in
      let ml_args_rev =
        List.fold_left
          (fun acc arg -> gen_argument_ext arg :: acc)
          [] this.arguments
      in
      let ml_args =
        List.fold_left
          (fun acc arg ->
            let _, _, name, _ = arg in
            ident_exp [ name ] :: acc
          )
          [] ml_args_rev
      in
      let body =
        let ret_exp =
          exp_apply_no_labels
            (ident_exp [ "Js"; "Ffi"; "meth_call" ])
            [ this_exp; op_key; Ml.Exp.array ml_args ]
        in
        gen_conv_ext_apply `ml_of_js ([], this.type_) ret_exp
      in
      let body =
        List.fold_left
          (fun acc arg ->
            let _lbl, is_optional, name, (_ext, t) = arg in
            let c_typ = classify_type t in
            let arg_name_exp = ident_exp [ name ] in
            let conv_exp = gen_conv_classified `js_of_ml c_typ in
            let conv_exp =
              if is_optional then
                exp_apply_no_labels
                  (ident_exp [ "Js"; "Any"; "undefined_of_option" ])
                  [ conv_exp ]
              else conv_exp
            in
            let conv_exp = exp_apply_no_labels conv_exp [ arg_name_exp ] in
            let vb = Ml.Vb.mk (Ml.Pat.var (mknoloc name)) conv_exp in
            Ml.Exp.let_ Nonrecursive [ vb ] acc
          )
          body ml_args_rev
      in
      let main_arg = if is_static then pat_unit else this_pat in
      let body = Ml.Exp.fun_ Nolabel None main_arg body in
      let body =
        List.fold_left
          (fun body arg ->
            let label, _, name, _ = arg in
            let arg_pat = Ml.Pat.var (mknoloc name) in
            Ml.Exp.fun_ label None arg_pat body
          )
          body ml_args_rev
      in
      let name = mknoloc (Config.rename_lower op_ident) in
      let pat = Ml.Pat.var name in
      let vb = Ml.Vb.mk pat body in
      [ Ml.Str.value Nonrecursive [ vb ] ]

  (* --- Interface --- *)

  let gen_interface_member (this : Wi.Interface.member) =
    match this with
    | Constructor that -> []
    | Const that -> []
    | Regular_operation { regular_operation; is_static } ->
      gen_regular_operation ~is_static regular_operation
    | Special_operation special_operation -> []
    | Stringifier that -> []
    | Iterable that -> []
    | Async_iterable that -> []
    | Attribute { attribute; is_static; is_readonly } ->
      gen_attribute ~is_static ~is_readonly attribute
    | Inherit_attribute attribute -> []
    | Maplike maplike -> []
    | Setlike setlike -> []

  let gen_interface_member_ext
      ((_ext : Wi.extended_attributes), (interface_member : Wi.Interface.member))
      =
    gen_interface_member interface_member

  let gen_interface ~(ctx : Analyze.ctx) (this : Wi.Interface.t) =
    let partial_members =
      match String_map.find_opt this.name ctx.partial_interfaces with
      | None -> []
      | Some p_intf_list ->
        List.concat_map
          (fun (p_intf : Wi.Partial_interface.t) ->
            List.map
              (fun (ext, m) -> (ext, Wi.Interface.of_partial_interface_member m))
              p_intf.members
          )
          p_intf_list
    in
    let includes_members =
      match String_map.find_opt this.name ctx.interface_includes with
      | None -> []
      | Some mixins ->
        String_map.fold
          (fun _mixin_name (mixin : Wi.Mixin.t) acc ->
            List.fold_left
              (fun acc (ext, m) -> (ext, Wi.Interface.of_mixin_member m) :: acc)
              acc mixin.members
          )
          mixins []
    in
    let inherits_items =
      match this.inherits with
      | None -> []
      | Some base_class_name ->
        let val_name =
          mknoloc ("to_" ^ Config.rename_lower ~keyword:false base_class_name)
        in
        let pat = Ml.Pat.var val_name in
        let vb = Ml.Vb.mk pat this_id_fun_exp in
        [ Ml.Str.value Nonrecursive [ vb ] ]
    in
    let all_members = this.members @ partial_members @ includes_members in
    let member_items = List.concat_map gen_interface_member_ext all_members in
    let t_item =
      let manifest = Ml_js.Typ.t_tagged (Config.rename_upper this.name) in
      Ml.Str.type_ Recursive [ Ml.Type.mk (mknoloc "t") ~manifest ]
    in
    let all_items = (t_item :: inherits_items) @ member_items in
    Ml.Mod.structure all_items

  (* --- Callback --- *)

  let gen_callback (this : Wi.Callback.t) = Ml.Mod.structure []

  (* --- Dictionary --- *)

  let gen_dictionary (this : Wi.Dictionary.t) = Ml.Mod.structure []

  (* --- Enum --- *)

  let gen_enum (this : Wi.Enum.t) =
    let t_item =
      Ml.Str.type_ Recursive
        [ Ml.Type.mk ~manifest:(Ml_js.Typ.string ()) (mknoloc "t") ]
    in
    let to_str_val =
      Ml.Str.value Nonrecursive
        [ Ml.Vb.mk (Ml.Pat.var (mknoloc "to_string")) Jx_lift.to_string ]
    in
    let cases_items =
      List.map
        (fun c ->
          let name =
            if String.equal c "" then "empty" else Config.rename_lower c
          in
          let pat = Ml.Pat.var (mknoloc name) in
          let exp = Jx_builder.of_string c in
          Ml.Str.value Nonrecursive [ Ml.Vb.mk pat exp ]
        )
        this.values
    in
    Ml.Mod.structure (t_item :: to_str_val :: cases_items)

  (* --- Callback interface --- *)

  let gen_callback_interface (this : Wi.Callback_interface.t) =
    Ml.Mod.structure []
end

(* Top-level module binding generators *)

let gen_callback (this : Wi.Callback.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_callback this in
  let mexp = Gen_str.gen_callback this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_callback_interface (this : Wi.Callback_interface.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_callback_interface this in
  let mexp = Gen_str.gen_callback_interface this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_interface ~ctx (this : Wi.Interface.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_interface ~ctx this in
  let mexp = Gen_str.gen_interface ~ctx this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_dictionary (this : Wi.Dictionary.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_dictionary this in
  let mexp = Gen_str.gen_dictionary this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_enum (this : Wi.Enum.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_enum this in
  let mexp = Gen_str.gen_enum this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_typedef (this : Wi.Typedef.t) =
  match snd this.type_ with
  | `Union ((t1, t2, ts), is_nullable) ->
    let ts = t1 :: t2 :: ts in
    let t_td_sig = Ml.Type.mk (mknoloc "t") in
    let t_td_str = Ml.Type.mk (mknoloc "t") ~manifest:Jx_lift.t in
    let t_stri = Ml.Str.type_ Recursive [ t_td_str ] in
    let t_sigi = Ml.Sig.type_ Recursive [ t_td_sig ] in
    let constr_list =
      List.map
        (function
          | `Single (_ext, (t : Wi.distinguishable_type), is_nullable) ->
            let name =
              "with_" ^ String.lowercase_ascii (Gen_common.type_tag t)
            in
            let typ =
              Gen_sig.gen_nullable (Gen_sig.gen_distinguishable t) is_nullable
            in
            let typ = Ml.Typ.arrow Nolabel typ (Ml'.Typ.t []) in
            (name, typ)
          | `Nested u -> failwith "union union"
          )
        ts
    in
    let constr_val_sigi_list =
      List.map
        (fun (name, typ) ->
          let vd = Ml.Val.mk (mknoloc name) typ in
          Ml.Sig.value vd
        )
        constr_list
    in
    let constr_val_stri_list =
      List.map
        (fun (name, _typ) ->
          let pat = Ml.Pat.var (mknoloc name) in
          let vb = Ml.Vb.mk pat Jx_lift.repr in
          Ml.Str.value Nonrecursive [ vb ]
        )
        constr_list
    in
    let mty = Ml.Mty.signature (t_sigi :: constr_val_sigi_list) in
    let mod' = Ml.Mod.structure (t_stri :: constr_val_stri_list) in
    let mod' = Ml.Mod.constraint_ mod' mty in
    let mname = Config.rename_upper this.name in
    Ml.Mb.mk (mknoloc (Some mname)) mod'
  | _ ->
    let td =
      Ml.Type.mk (mknoloc "t") ~manifest:(Gen_sig.gen_type_ext this.type_)
    in
    let td_sigi = Ml.Sig.type_ Nonrecursive [ td ] in
    let mty = Ml.Mty.signature [ td_sigi ] in
    let mname = Config.rename_upper this.name in
    let mod' = Ml.Mod.ident (mknoloc (ident [ mname ])) in
    let mod' = Ml.Mod.constraint_ mod' mty in
    Ml.Mb.mk (mknoloc (Some mname)) mod'

let gen_definition ~ctx (this : Wi.definition) =
  match this with
  | Callback that -> Some (gen_callback that)
  | Callback_interface that -> Some (gen_callback_interface that)
  | Interface x -> Some (gen_interface ~ctx x)
  | Mixin _ -> None
  (* TODO *)
  | Namespace _ -> None
  | Partial _ -> None
  | Dictionary that -> Some (gen_dictionary that)
  | Enum that -> Some (gen_enum that)
  | Typedef that -> Some (gen_typedef that)
  | Includes _ -> None

let ext_find_constructors ext =
  List.filter_map
    (function
      | Wi.Ext_arg_list ("Constructor", arguments) ->
        Some ([], Wi.Interface.Constructor arguments)
      | _ -> None
      )
    ext

let gen_definition_ext ~ctx (ext, (definition : Wi.definition)) =
  let constructors = ext_find_constructors ext in
  (* [FIXME] Are constructors only allowed for interfaces? *)
  let definition' =
    match definition with
    | Interface interface ->
      let members = constructors @ interface.members in
      Wi.Interface { interface with members }
    | _ -> definition
  in
  gen_definition ~ctx definition'

let gen_definitions ~ctx (definitions : Wi.definitions) =
  List.filter_map (gen_definition_ext ~ctx) definitions

let gen ~ctx definitions =
  let mbl = gen_definitions ~ctx definitions in
  Ml.Str.rec_module mbl
