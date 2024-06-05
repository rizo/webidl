module type Jx = sig
  type t

  val null : t
  val of_string : string -> t
  val to_string : t -> string
end

module Wi = Webidl_ast
module Ml = Ppxlib_ast.Ast_helper
module Asttypes = Astlib.Ast_414.Asttypes
module Parsetree = Astlib.Ast_414.Parsetree
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

let string_to_ident s =
  if String.length s = 0 then s
  else
    let s' =
      String.map
        (function
          | ('0' .. '9' | 'a' .. 'z' | 'A' .. 'Z' | '_') as c -> c
          | _ -> '_'
          )
        s
    in
    let s' =
      match String.get s' 0 with
      | '0' .. '9' -> "_" ^ s'
      | _ -> s'
    in
    s'

let symbol_to_name c : (string, string) Either.t =
  match c with
  | ('0' .. '9' | 'a' .. 'z' | 'A' .. 'Z' | '_') as c -> Right (String.make 1 c)
  | '!' -> Left "exclm"
  | '"' -> Left "quot"
  | '#' -> Left "hash"
  | '$' -> Left "dollar"
  | '%' -> Left "pct"
  | '&' -> Left "amp"
  | '\'' -> Left "apost"
  | '(' -> Left "lparen"
  | ')' -> Left "rparen"
  | '*' -> Left "astr"
  | '+' -> Left "plus"
  | ',' -> Left "comm"
  | '-' -> Left "hyphen"
  | '.' -> Left "dot"
  | '/' -> Left "slsh"
  | ':' -> Left "colon"
  | ';' -> Left "semi"
  | '<' -> Left "lt"
  | '=' -> Left "eq"
  | '>' -> Left "gt"
  | '?' -> Left "quest"
  | '@' -> Left "at"
  | '[' -> Left "lbrack"
  | '\\' -> Left "bslsh"
  | ']' -> Left "rbrack"
  | '^' -> Left "caret"
  | '`' -> Left "grv"
  | '{' -> Left "lcurly"
  | '|' -> Left "bar"
  | '}' -> Left "rcurly"
  | '~' -> Left "tild"
  | ' ' -> Left "_"
  | other -> invalid_arg (fmt "invalid char: %c" other)

let rec collect_type_bases name types =
  match String_map.find_opt name types with
  | None | Some None -> []
  | Some (Some base') -> base' :: collect_type_bases base' types

let check_has_super name types =
  match String_map.find_opt name types with
  | None | Some None -> false
  | Some (Some _) -> true

let ocaml_keywords =
  String_set.of_list
    [
      "and";
      "as";
      "asr";
      "assert";
      "begin";
      "class";
      "closed";
      "constraint";
      "do";
      "done";
      "downto";
      "else";
      "end";
      "exception";
      "external";
      "false";
      "for";
      "fun";
      "function";
      "functor";
      "if";
      "in";
      "include";
      "inherit";
      "land";
      "lazy";
      "let";
      "lor";
      "lsl";
      "lsr";
      "lxor";
      "match";
      "method";
      "mod";
      "module";
      "mutable";
      "new";
      "object";
      "of";
      "open";
      "or";
      "private";
      "rec";
      "sig";
      "struct";
      "then";
      "to";
      "true";
      "try";
      "type";
      "val";
      "virtual";
      "when";
      "while";
      "with";
    ]

module Config = struct
  let stringifier_name = "to_string"
  let constructor_name = "make"
  let to_iterable_name = "to_iterable"
  let constructor_prefix = "with"

  let _rename ?(ident = false) name =
    let name =
      if ident then string_to_ident name else string_dash_to_underscore name
    in
    snake_case name

  let unkeyword name =
    if String_set.mem name ocaml_keywords then name ^ "'" else name

  let rename_upper ?ident name = String.capitalize_ascii (_rename ?ident name)

  let rename_lower ?ident ?(keyword = true) name =
    let out = String.lowercase_ascii (_rename ?ident name) in
    if keyword then unkeyword out else out

  let enum_to_ident str =
    if String.equal str "" then "empty"
    else
      let out = Buffer.create (String.length str) in
      String.iteri
        (fun i c ->
          match symbol_to_name c with
          | Either.Right seg -> Buffer.add_string out seg
          | Either.Left "_" -> Buffer.add_char out '_'
          | Either.Left seg ->
            if i <> 0 then Buffer.add_char out '_';
            Buffer.add_string out seg
        )
        str;
      Buffer.contents out |> rename_lower
end

module Doc = struct
  let h2 txt = fmt "{2 %s}" txt

  module L = struct
    let meth ~scope name =
      fmt "https://developer.mozilla.org/en-US/docs/Web/API/%s/%s" scope name

    let meth_see ~scope name =
      fmt "See {{: %s} [%s] on MDN}." (meth ~scope name) name

    let cls scope =
      fmt "https://developer.mozilla.org/en-US/docs/Web/API/%s" scope

    let cls_see scope = fmt "See {{: %s} [%s] on MDN}." (cls scope) scope
  end
end

module Ml' = struct
  module Attr = struct
    let doc text =
      Ml.Attr.mk (mknoloc "ocaml.doc")
        (Parsetree.PStr [ Ml.Str.eval (Ml.Exp.constant (Ml.Const.string text)) ])

    let text text =
      Ml.Attr.mk (mknoloc "ocaml.text")
        (Parsetree.PStr [ Ml.Str.eval (Ml.Exp.constant (Ml.Const.string text)) ])
  end

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

    let seq ?loc ?attrs arg = m_t ?loc ?attrs "Seq" [ arg ]
  end

  module Exp = struct
    let fun_id =
      Ml.Exp.fun_ Nolabel None
        (Ml.Pat.var (mknoloc "x"))
        (Ml.Exp.ident (mknoloc (Longident.Lident "x")))

    let unit () = Ml.Exp.construct (mknoloc (Longident.Lident "()")) None
    let none () = Ml.Exp.construct (mknoloc (Longident.Lident "None")) None
    let some x = Ml.Exp.construct (mknoloc (Longident.Lident "Some")) (Some x)
    let string x = Ml.Exp.constant (Ml.Const.string x)
  end
end

let js_ident name = Ml.Exp.ident (mknoloc (Longident.Ldot (Lident "Js", name)))
let ident xs = Option.get (Longident.unflatten xs)
let ident_exp xs = Ml.Exp.ident (mknoloc (ident xs))
let pat_var str = Ml.Pat.var (mknoloc str)
let ident_noloc xs = mknoloc (ident xs)

let js_nullable_ident name =
  let ident = Longident.unflatten [ "Js"; "Nullable"; name ] |> Option.get in
  Ml.Exp.ident (mknoloc ident)

let exp_apply_no_labels f args =
  Ml.Exp.apply f (List.map (fun arg -> (Asttypes.Nolabel, arg)) args)

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
        Ml.Typ.variant
          [ Ml.Rf.inherit_ (Ml.Typ.constr (mknoloc (ident [ name ])) []) ]
          Closed None
      in
      mk1 "t" variant

    let super ?loc ?attrs ?mod_name var_name =
      let typ_var = Ml.Typ.var var_name in
      let ident =
        match mod_name with
        | None -> [ "super" ]
        | Some n -> [ n; "super" ]
      in
      Ml.Typ.constr ?loc ?attrs (ident_noloc ident) [ typ_var ]

    let void ?loc ?attrs () = mk0 ?loc ?attrs "void"
    let string ?loc ?attrs () = mk0 ?loc ?attrs "string"
    let nullable ?loc ?attrs arg = mk1 ?loc ?attrs "nullable" arg
    let undefined ?loc ?attrs arg = mk1 ?loc ?attrs "undefined" arg
    let constr ?loc ?attrs arg = mk1 ?loc ?attrs "constr" arg
    let sequence ?loc ?attrs arg = mk1 ?loc ?attrs "sequence" arg
    let array ?loc ?attrs arg = mk1 ?loc ?attrs "array" arg
    let promise ?loc ?attrs arg = mk1 ?loc ?attrs "promise" arg
    let iterable1 ?loc ?attrs arg = mk1 ?loc ?attrs "iterable" arg

    let iterable2 ?loc ?attrs arg1 arg2 =
      mk ?loc ?attrs "iterable" [ arg1; arg2 ]
  end
end

(* Jx values lifted to ML syntax *)
module Jx_lift = struct
  let t = Ml.Typ.constr (mknoloc (Longident.Ldot (Lident "Js", "t"))) []
  let any = Ml.Typ.constr (mknoloc (Longident.Ldot (Lident "Js", "any"))) []
  let of_string = js_ident "of_string"
  let to_string = js_ident "to_string"
  let get = ident_exp [ "Js"; "get" ]
  let set = ident_exp [ "Js"; "set" ]
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
    | `Ident x -> Config.rename_upper x
    | `Sequence _ -> "Sequence"
    | `Object -> "Object"
    | `Symbol -> "Symbol"
    | `Frozen_array _ -> "Frozen_array"
    | `Observable_array _ -> "Observable_array"
    (* [FIXME] must be valid ident *)
    | `Name name -> Config.rename_upper name
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

  let make_special_operation_name (special : Wi.special) name =
    let prefix =
      match special with
      | Getter -> "get"
      | Setter -> "set"
      | Deleter -> "delete"
    in
    match name with
    | None -> prefix
    | Some name -> name

  let regular_operation_of_special_operation (this : Wi.Special_operation.t) =
    let name = make_special_operation_name this.special this.name in
    {
      Wi.Regular_operation.name = Some name;
      return = this.return;
      arguments = this.arguments;
    }
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

  let gen_type_name ~(ctx : Analyze.ctx) ?scope ?(return = false) id =
    (* scope has not been renamed *)
    let scoped =
      match scope with
      | None -> true
      | Some scope -> not (String.equal id scope)
    in
    let mod_name = Config.rename_upper id in
    if return && check_has_super id ctx.types then
      let mod_name = if scoped then Some mod_name else None in
      Ml_js.Typ.super ?mod_name "a"
    else
      let id = if scoped then [ mod_name; "t" ] else [ "t" ] in
      Ml.Typ.constr (ident_noloc id) []

  let rec gen_distinguishable ~ctx ?scope ?return
      (this : Wi.distinguishable_type) =
    let todo x = Ml.Typ.var ("todo_" ^ x) in
    match this with
    | #Wi.primitive_type as that -> gen_primitive that
    | #Wi.string_type as that -> gen_string that
    | `Name that -> gen_type_name ~ctx ?scope ?return that
    | `Sequence that ->
      let arg = gen_type_ext ~ctx that in
      Ml'.Typ.array arg
    | `Object -> Ml_js.Typ.mk0 "object'"
    | `Symbol -> Ml_js.Typ.mk0 "symbol"
    | #Wi.buffer_type -> todo "buffer"
    (* TODO: review, for now gen as sequence *)
    | `Frozen_array that ->
      let arg = gen_type_ext ~ctx that in
      Ml'.Typ.array arg
    | `Observable_array fa -> todo "observable_array"
    | `Record (_string_type, type_ext) ->
      let v_typ = gen_type_ext ~ctx type_ext in
      Ml_js.Typ.mk1 "dict" v_typ
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
    let t = Ml.Typ.variant cases Closed (Some []) in
    if is_nullable then Ml_js.Typ.nullable t else Ml_js.Typ.t1 t

  and gen_type ~ctx ?scope ?return (this : Wi.type_) =
    match this with
    | `Distinguishable (typ, is_nullable) ->
      gen_nullable (gen_distinguishable ~ctx ?scope ?return typ) is_nullable
    | `Any -> Ml_js.Typ.any
    | `Promise that ->
      let arg = gen_type ~ctx that in
      Ml_js.Typ.promise arg
    | `Union that -> gen_union that

  and gen_type_ext ~ctx ?scope ?return ((_ext, type') : Wi.type_ext) =
    gen_type ~ctx ?scope ?return type'

  let gen_const_type ~ctx (this : Wi.const_type) =
    match this with
    | #Wi.primitive_type as that -> gen_primitive that
    | `Name that -> gen_type_name ~ctx that

  let gen_attribute_get ~ctx ~scope ~is_static (this : Wi.Attribute.t) =
    let name = mknoloc (Config.rename_lower this.name) in
    let ret_type = gen_type_ext ~ctx ~scope ~return:true this.type_ in
    let type' =
      if is_static then ret_type
      else Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type
    in
    let attrs = [ Ml'.Attr.doc (Doc.L.meth_see ~scope this.name) ] in
    let vd = Ml.Val.mk ~attrs name type' in
    Ml.Sig.value vd

  let gen_attribute_set ~ctx ~scope ~is_static (this : Wi.Attribute.t) =
    let name =
      mknoloc ("set_" ^ Config.rename_lower ~keyword:false this.name)
    in
    let ret_type = gen_type_ext ~ctx ~scope this.type_ in
    let ret_type = Ml.Typ.arrow Nolabel ret_type (Ml'.Typ.unit ()) in
    let type' =
      if is_static then ret_type
      else Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type
    in
    let attrs = [ Ml'.Attr.doc (Doc.L.meth_see ~scope this.name) ] in
    let vd = Ml.Val.mk ~attrs name type' in
    Ml.Sig.value vd

  (* [TODO] static attributes (const?) *)
  let gen_attribute ~ctx ~scope ~is_static ~is_readonly (this : Wi.Attribute.t)
      =
    if is_readonly then [ gen_attribute_get ~ctx ~scope ~is_static this ]
    else
      [
        gen_attribute_get ~ctx ~scope ~is_static this;
        gen_attribute_set ~ctx ~scope ~is_static this;
      ]

  let gen_argument_ext ~ctx ~scope (_ext, (this : Wi.argument)) =
    match this with
    | `Optional (name, t, _default) ->
      let name = Wi.string_of_argument_name name in
      let t_ml = gen_type_ext ~ctx ~scope t in
      (Asttypes.Optional (Config.rename_lower name), t_ml)
    | `Variadic (name, t) ->
      let name = Wi.string_of_argument_name name in
      ( Labelled (Config.rename_lower name),
        Ml'.Typ.array (gen_type ~ctx ~scope t)
      )
    | `Fixed (name, t) ->
      let name = Wi.string_of_argument_name name in
      (Labelled (Config.rename_lower name), gen_type ~scope ~ctx t)

  let gen_regular_operation ~ctx ~scope ~is_static
      (this : Wi.Regular_operation.t) =
    match this.name with
    | None -> failwith "todo: regular operation without ident"
    | Some op_ident ->
      let name = mknoloc (Config.rename_lower op_ident) in
      let type' = gen_type ~ctx ~scope ~return:true this.return in
      let main_arg = if is_static then Ml'.Typ.unit () else Ml'.Typ.t [] in
      let type' = Ml.Typ.arrow Nolabel main_arg type' in
      let type' =
        List.fold_left
          (fun acc arg ->
            let label, ml_arg = gen_argument_ext ~ctx ~scope arg in
            Ml.Typ.arrow label ml_arg acc
          )
          type' (List.rev this.arguments)
      in
      let attrs = [ Ml'.Attr.doc (Doc.L.meth_see ~scope op_ident) ] in
      let vd = Ml.Val.mk ~attrs name type' in
      [ Ml.Sig.value vd ]

  (* [FIXME] "set" might collide with a non-setter operation *)
  let gen_special_operation (this : Wi.Special_operation.t) =
    let r_op = Gen_common.regular_operation_of_special_operation this in
    gen_regular_operation ~is_static:false r_op

  let gen_stringifier ~ctx ~scope (this : Wi.Stringifier.t) =
    match this with
    | Standalone -> []
    | Attribute { attribute; readonly = is_readonly } ->
      let items =
        gen_attribute ~ctx ~scope ~is_static:false ~is_readonly attribute
      in
      let stringifier_attr =
        { attribute with name = Config.stringifier_name }
      in
      let stringifier_items =
        gen_attribute ~ctx ~scope ~is_static:false ~is_readonly:true
          stringifier_attr
      in
      stringifier_items @ items

  let gen_const ~ctx ({ type_; ident; value = _ } : Wi.Const.t) =
    let name = mknoloc (Config.rename_lower ident) in
    let typ = gen_const_type ~ctx type_ in
    let vd = Ml.Val.mk name typ in
    Ml.Sig.value vd

  let gen_constructor ~ctx ~scope ~has_super arguments =
    let ret_typ =
      if has_super then
        Ml.Typ.constr (ident_noloc [ "super" ]) [ Ml.Typ.var "a" ]
      else Ml.Typ.constr (ident_noloc [ "t" ]) []
    in
    let typ0 = Ml.Typ.arrow Nolabel (Ml'.Typ.unit ()) ret_typ in
    let typ, arg_names =
      List.fold_left
        (fun (typ, arg_names) arg ->
          let arg_name =
            Config.rename_lower ~keyword:false
              (Gen_common.argument_name (snd arg))
          in
          let label, ml_arg = gen_argument_ext ~ctx ~scope arg in
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

  let gen_iterable ~ctx ({ value_type; key_type } : Wi.iterable) =
    match key_type with
    | Some key_type ->
      let typ =
        Ml_js.Typ.iterable2
          (gen_type ~ctx (snd key_type))
          (gen_type ~ctx (snd value_type))
      in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) typ in
      let name = mknoloc (String.lowercase_ascii Config.to_iterable_name) in
      let vd = Ml.Val.mk name typ in
      [ Ml.Sig.value vd ]
    | None ->
      let typ = Ml'.Typ.seq (gen_type ~ctx (snd value_type)) in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) typ in
      let name = mknoloc (String.lowercase_ascii Config.to_iterable_name) in
      let vd = Ml.Val.mk name typ in
      [ Ml.Sig.value vd ]

  (* --- Interface --- *)

  let gen_interface_member ~ctx ~scope ~has_super (this : Wi.Interface.member) =
    let todo x = Ml.Sig.value (Ml.Val.mk (mknoloc x) (Ml.Typ.any ())) in
    match this with
    | Constructor that -> [ gen_constructor ~ctx ~scope ~has_super that ]
    | Const that -> [ gen_const ~ctx that ]
    | Regular_operation { regular_operation; is_static } ->
      gen_regular_operation ~ctx ~scope ~is_static regular_operation
    | Special_operation special_operation ->
      gen_special_operation ~ctx ~scope special_operation
    | Stringifier that -> gen_stringifier ~ctx ~scope that
    | Iterable that -> []
    (* TODO: implement iterable *)
    (* | Iterable that -> gen_iterable that *)
    | Async_iterable that -> [ todo "async_iterable" ]
    | Attribute { attribute; is_static; is_readonly } ->
      gen_attribute ~ctx ~scope ~is_static ~is_readonly attribute
    | Inherit_attribute attribute -> [ todo "inherit_attribute" ]
    | Maplike maplike -> [ todo "maplike" ]
    | Setlike setlike -> [ todo "setlike" ]

  let gen_interface_member_ext ~ctx ~has_super
      ((_ext : Wi.extended_attributes), (interface_member : Wi.Interface.member))
      =
    gen_interface_member ~ctx ~has_super interface_member

  let gen_super_type name types =
    let doc =
      fmt
        "The type for the {{: %s} [%s]} interface or any base interface that \
         it inherits."
        (Doc.L.cls name) name
    in
    match collect_type_bases name types with
    | [] -> None
    | bases ->
      let tags =
        List.map
          (fun x -> Ml.Rf.tag (mknoloc (Config.rename_upper x)) false [])
          (name :: bases)
      in
      let variant = Ml.Typ.variant tags Closed (Some []) in
      let manifest =
        Ml.Typ.constr (ident_noloc [ "Js"; "t" ]) [ Ml.Typ.var "a" ]
      in
      let params =
        [ (Ml.Typ.var "a", (Asttypes.NoVariance, Asttypes.NoInjectivity)) ]
      in
      let cstrs = [ (Ml.Typ.var "a", variant, Location.none) ] in
      let attrs = [ Ml'.Attr.doc doc ] in
      Some (Ml.Type.mk ~attrs (mknoloc "super") ~cstrs ~params ~manifest)

  let gen_main_interface_type name =
    let tags = [ Ml.Rf.tag (mknoloc (Config.rename_upper name)) false [] ] in
    let variant = Ml.Typ.variant tags Closed None in
    Ml.Typ.constr (ident_noloc [ "Js"; "t" ]) [ variant ]

  let gen_interafce_any_conv ~is_super () =
    let ret = Ml.Typ.constr (ident_noloc [ "Js"; "any" ]) [] in
    let to_any_t = Ml.Typ.arrow Nolabel Ml'.Typ.t0 ret in
    let of_any_ret = if is_super then Ml_js.Typ.super "a" else Ml'.Typ.t0 in
    let of_any_t = Ml.Typ.arrow Nolabel ret of_any_ret in
    let to_any_vd = Ml.Val.mk (mknoloc "to_any") to_any_t in
    let of_any_vd = Ml.Val.mk (mknoloc "of_any") of_any_t in
    [ Ml.Sig.value of_any_vd; Ml.Sig.value to_any_vd ]

  let gen_interface ~(ctx : Analyze.ctx) (this : Wi.Interface.t) =
    let scope = this.name in
    let super_typ =
      match gen_super_type this.name ctx.types with
      | None -> []
      | Some td -> [ Ml.Sig.type_ Recursive [ td ] ]
    in
    let is_super = not (List.is_empty super_typ) in
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
    let items =
      List.concat_map
        (gen_interface_member_ext ~ctx ~scope ~has_super:is_super)
        (this.members @ partial_members @ includes_members)
    in
    let doc =
      fmt "The type for the {{: %s} [%s]} interface." (Doc.L.cls this.name)
        this.name
    in
    let t_typ =
      let manifest = gen_main_interface_type this.name in
      let attrs = [ Ml'.Attr.doc doc ] in
      [ Ml.Sig.type_ Recursive [ Ml.Type.mk ~attrs (mknoloc "t") ~manifest ] ]
    in
    Ml.Mty.signature
      (t_typ @ super_typ @ gen_interafce_any_conv ~is_super () @ items)

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

  let gen_mono_any_conv () =
    let ret = Ml.Typ.constr (ident_noloc [ "Js"; "any" ]) [] in
    let to_any_t = Ml.Typ.arrow Nolabel Ml'.Typ.t0 ret in
    let of_any_t = Ml.Typ.arrow Nolabel ret Ml'.Typ.t0 in
    let to_any_vd = Ml.Val.mk (mknoloc "to_any") to_any_t in
    let of_any_vd = Ml.Val.mk (mknoloc "of_any") of_any_t in
    [ Ml.Sig.value of_any_vd; Ml.Sig.value to_any_vd ]

  let gen_callback_interface_member_ext ~ctx ~scope
      (_ext, (m : Wi.Callback_interface.member)) =
    match m with
    | Const that -> [ gen_const ~ctx that ]
    | Regular_operation regular_operation ->
      gen_regular_operation ~ctx ~scope ~is_static:false regular_operation

  let gen_callback_type ~ctx ~scope ~return arguments =
    let typ = gen_type ~ctx return in
    let typ =
      List.fold_left
        (fun acc arg ->
          let _label, ml_arg = gen_argument_ext ~ctx ~scope arg in
          Ml.Typ.arrow Nolabel ml_arg acc
        )
        typ (List.rev arguments)
    in
    Ml.Type.mk (mknoloc "t") ~manifest:typ

  let gen_callback_interface ~ctx (this : Wi.Callback_interface.t) =
    let scope = this.name in
    let const_l, cbt_l =
      List.fold_left
        (fun (const_l, cbt_l) (_ext, (m : Wi.Callback_interface.member)) ->
          match m with
          | Const that ->
            let c = gen_const ~ctx that in
            (c :: const_l, cbt_l)
          | Regular_operation that ->
            let cbt =
              gen_callback_type ~ctx ~scope ~return:that.return that.arguments
            in
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
    Ml.Mty.signature ((cbt_sigi :: gen_mono_any_conv ()) @ const_l)

  (* --- Enum --- *)

  let gen_enum (this : Wi.Enum.t) =
    let t_item = Ml.Sig.type_ Recursive [ Ml.Type.mk (mknoloc "t") ] in
    let to_str_val =
      Ml.Sig.value
        (Ml.Val.mk (mknoloc "to_string")
           (Ml.Typ.arrow Nolabel (Ml'.Typ.t []) (Ml'.Typ.string ()))
        )
    in
    let cases_items =
      List.map
        (fun c ->
          (* [FIXME] potential duplicate *)
          let name = Config.enum_to_ident c in
          let attrs = [ Ml'.Attr.doc (fmt "The [%s] enum value." c) ] in
          Ml.Sig.value (Ml.Val.mk ~attrs (mknoloc name) (Ml'.Typ.t []))
        )
        this.values
    in
    Ml.Mty.signature
      ((t_item :: to_str_val :: gen_mono_any_conv ()) @ cases_items)

  (* --- Mixin --- *)

  let gen_mixin_member ~ctx ~scope (this : Wi.Mixin.member) =
    match this with
    | Const that -> [ gen_const ~ctx that ]
    | Regular_operation that ->
      gen_regular_operation ~ctx ~scope ~is_static:false that
    | Stringifier that -> gen_stringifier ~ctx ~scope that
    | Attribute { attribute; is_readonly } ->
      gen_attribute ~ctx ~scope ~is_static:false ~is_readonly attribute

  let gen_mixin_member_ext ~ctx ~scope (_ext, (mixin_member : Wi.Mixin.member))
      =
    gen_mixin_member ~ctx ~scope mixin_member

  let gen_mixin ~ctx ~scope (this : Wi.Mixin.t) =
    (* TODO: check if this is correct for mixins *)
    let scope = this.name in
    let name = mknoloc (Config.rename_upper this.name) in
    let t_item = Ml.Sig.type_ Recursive [ Ml.Type.mk (mknoloc "t") ] in
    let member_items =
      List.concat_map (gen_mixin_member_ext ~ctx ~scope) this.members
    in
    let mt = Ml.Mty.signature (t_item :: member_items) in
    let mtd = Ml.Mtd.mk ~typ:mt name in
    Ml.Sig.modtype mtd

  (* --- Dictionary --- *)

  let gen_dictionary_member ~ctx (this : Wi.Dictionary.member) =
    match this with
    | Required (type_ext, name) ->
      let m_t = gen_type_ext ~ctx type_ext in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) m_t in
      let getter =
        Ml.Sig.value (Ml.Val.mk (mknoloc (Config.rename_lower name)) typ)
      in
      [ getter ]
    | Optional (type_, name, _default) ->
      let m_t = gen_type ~ctx type_ in
      let m_t = gen_nullable m_t true in
      let typ = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) m_t in
      let getter =
        Ml.Sig.value (Ml.Val.mk (mknoloc (Config.rename_lower name)) typ)
      in
      [ getter ]

  let gen_dictionary_member_ext
      ( (_ext : Wi.extended_attributes),
        (dictionary_member : Wi.Dictionary.member)
      ) =
    gen_dictionary_member dictionary_member

  let gen_dictionary_constructor ~ctx
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
            let l = Asttypes.Labelled (Config.rename_lower name) in
            let m_arg_t = gen_type_ext ~ctx t_ext in
            Ml.Typ.arrow l m_arg_t t_tail
          (* [TODO] mention default in docs *)
          | Optional (t, name, _default) ->
            let l = Asttypes.Optional (Config.rename_lower name) in
            let m_arg_t = gen_type ~ctx t in
            Ml.Typ.arrow l m_arg_t t_tail
        )
        (Ml.Typ.arrow Nolabel (Ml'.Typ.unit ()) (Ml'.Typ.t []))
        members_rev
    in
    Ml.Sig.value (Ml.Val.mk (mknoloc Config.constructor_name) members_args_t)

  let gen_dictionary ~ctx (this : Wi.Dictionary.t) =
    let doc = fmt "The type for the [%s] dictionary." this.name in
    let attrs = [ Ml'.Attr.doc doc ] in
    let t_item = Ml.Sig.type_ Recursive [ Ml.Type.mk ~attrs (mknoloc "t") ] in
    let t_cons = gen_dictionary_constructor ~ctx this.members in
    let t_inherits =
      match this.inherits with
      | None -> []
      | Some base_class_name ->
        let val_name = mknoloc ("to_" ^ Config.rename_lower base_class_name) in
        let ret_typ_name = Config.rename_upper base_class_name in
        let ret_type =
          Ml.Typ.constr (mknoloc Longident.(Ldot (Lident ret_typ_name, "t"))) []
        in
        let type' = Ml.Typ.arrow Nolabel (Ml'.Typ.t []) ret_type in
        let vd = Ml.Val.mk val_name type' in
        [ Ml.Sig.value vd ]
    in
    let member_items =
      List.concat_map (gen_dictionary_member_ext ~ctx) this.members
    in
    Ml.Mty.signature
      (((t_item :: t_cons :: gen_mono_any_conv ()) @ t_inherits) @ member_items)

  (* --- Callback --- *)

  let gen_callback ~ctx (this : Wi.Callback.t) =
    let scope = this.name in
    let t_item =
      Ml.Sig.type_ Recursive
        [ gen_callback_type ~ctx ~scope ~return:this.return this.arguments ]
    in
    Ml.Mty.signature ([ t_item ] @ gen_mono_any_conv ())

  (* Namespace *)

  let gen_namespace_member_ext ~scope ~ctx (_, (m : Wi.Namespace.member)) =
    match m with
    | Const c -> [ gen_const ~ctx c ]
    | Attribute { attribute; is_readonly = () } ->
      gen_attribute ~ctx ~scope ~is_static:true ~is_readonly:true attribute
    | Regular_operation op ->
      gen_regular_operation ~ctx ~scope ~is_static:true op

  let gen_namespace ~ctx (this : Wi.Namespace.t) =
    (* FIXME: namespace is not a "scope". *)
    let scope = this.name in
    let member_items =
      List.concat_map (gen_namespace_member_ext ~scope ~ctx) this.members
    in
    Ml.Mty.signature member_items

  (* --- Typedef --- *)

  let gen_typedef ~ctx (this : Wi.Typedef.t) =
    let items =
      match snd this.type_ with
      | `Union ((t1, t2, ts), is_nullable) ->
        let ts = t1 :: t2 :: ts in
        let t_td_sig = Ml.Type.mk (mknoloc "t") in
        let t_sigi = Ml.Sig.type_ Recursive [ t_td_sig ] in
        let constr_list =
          List.map
            (function
              | `Single (_ext, (t : Wi.distinguishable_type), is_nullable) ->
                let name =
                  "with_" ^ String.lowercase_ascii (Gen_common.type_tag t)
                in
                let typ =
                  gen_nullable (gen_distinguishable ~ctx t) is_nullable
                in
                let typ = Ml.Typ.arrow Nolabel typ (Ml'.Typ.t []) in
                (name, typ)
              | `Nested u -> failwith "unsuported: nested union"
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
        t_sigi :: constr_val_sigi_list
      | _ ->
        let td =
          Ml.Type.mk (mknoloc "t") ~manifest:(gen_type_ext ~ctx this.type_)
        in
        let td_sigi = Ml.Sig.type_ Nonrecursive [ td ] in
        [ td_sigi ]
    in
    let items = items @ gen_mono_any_conv () in
    Ml.Mty.signature items
end

module Gen_str = struct
  let exp_unit = Ml.Exp.construct (mknoloc (Longident.Lident "()")) None
  let pat_unit = Ml.Pat.construct (mknoloc (Longident.Lident "()")) None
  let this_pat = Ml.Pat.var (mknoloc "this")
  let t_pat = Ml.Pat.var (mknoloc "t")
  let this_exp = Ml.Exp.ident (mknoloc (Longident.Lident "this"))
  let t_exp = Ml.Exp.ident (mknoloc (Longident.Lident "t"))
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
    | `Object -> `Scoped0 [ "Js" ]
    | `Symbol -> `Scoped0 [ "Js" ]
    (* TODO: review *)
    | #Wi.buffer_type as bt -> `Named (Wi.string_of_buffer_type bt)
    | `Frozen_array that ->
      let arg = classify_type_ext that in
      `Sequence arg
    | `Observable_array fa -> todo "observable_array"
    (* TODO: review *)
    | `Record (_string_type, type_ext) ->
      `Scoped1 ([ "Js"; "Dict" ], classify_type_ext type_ext)
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
    | `Promise that -> `Scoped1 ([ "Js"; "Promise" ], classify_type that)
    | `Union (typ, is_nullable) ->
      classify_nullable (classify_union typ) is_nullable

  and classify_type_ext ((_ext, type') : Wi.type_ext) = classify_type type'

  let gen_conv_classified ~scope conv c_typ =
    let any_prefix, named_suffix =
      match conv with
      | `ml_of_js -> ("to_", "of_any")
      | `js_of_ml -> ("of_", "to_any")
    in
    let rec loop c_typ =
      match c_typ with
      | `Core name -> ident_exp [ "Js"; "Any"; any_prefix ^ name ]
      | `Named name when String.equal name scope -> ident_exp [ named_suffix ]
      | `Named name ->
        let name' = Config.rename_upper name in
        ident_exp [ name'; named_suffix ]
      | `Nullable (`Union _) -> ident_exp [ "Js"; named_suffix ]
      | `Nullable that ->
        let conv_that_exp = loop that in
        exp_apply_no_labels
          (ident_exp [ "Js"; "Any"; cat [ "nullable_"; any_prefix; "option" ] ])
          [ conv_that_exp ]
      | `Scoped1 (path, that) ->
        let conv_that_exp = loop that in
        exp_apply_no_labels
          (ident_exp (List.map Config.rename_upper path @ [ named_suffix ]))
          [ conv_that_exp ]
      | `Sequence that ->
        let conv_that_exp = loop that in
        exp_apply_no_labels
          (ident_exp [ "Js"; "Any"; any_prefix ^ "array" ])
          [ conv_that_exp ]
      | `Scoped0 path ->
        ident_exp (List.map Config.rename_upper path @ [ named_suffix ])
      | `Undefined -> ident_exp [ "Js"; any_prefix ^ "unit" ]
      (* This should be identity. *)
      | `Any -> ident_exp [ "Js"; any_prefix ^ "any" ]
      | `Union _ -> ident_exp [ "Js"; named_suffix ]
    in
    loop c_typ

  let gen_conv_ext ~scope conv (_, typ) =
    let c_typ = classify_type typ in
    gen_conv_classified ~scope conv c_typ

  let gen_conv_ext_apply ~scope ?(nullable = false) ?(optional = false) conv
      t_ext arg =
    let any_prefix =
      match conv with
      | `ml_of_js -> "to_"
      | `js_of_ml -> "of_"
    in
    let conv_exp = gen_conv_ext ~scope conv t_ext in
    let conv_exp =
      if optional then
        exp_apply_no_labels
          (ident_exp [ "Js"; "Any"; cat [ "undefined_"; any_prefix; "option" ] ])
          [ conv_exp ]
      else conv_exp
    in
    let conv_exp =
      if nullable then
        exp_apply_no_labels
          (ident_exp [ "Js"; "Any"; cat [ "nullable_"; any_prefix; "option" ] ])
          [ conv_exp ]
      else conv_exp
    in
    exp_apply_no_labels conv_exp [ arg ]

  let gen_attribute_get ~scope ~is_static (this : Wi.Attribute.t) =
    let pat = Ml.Pat.var (mknoloc (Config.rename_lower this.name)) in
    let key = Ml.Exp.constant (Ml.Const.string this.name) in
    let exp = Jx_builder.get (if is_static then t_exp else this_exp) key in
    (* TODO: no optional attrs? *)
    let exp = gen_conv_ext_apply ~scope `ml_of_js this.type_ exp in
    let exp =
      if is_static then exp else Ml.Exp.fun_ Nolabel None this_pat exp
    in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_attribute_set ~scope ~is_static (this : Wi.Attribute.t) =
    let pat =
      Ml.Pat.var
        (mknoloc ("set_" ^ Config.rename_lower ~keyword:false this.name))
    in
    let key = Ml.Exp.constant (Ml.Const.string this.name) in
    (* TODO: no optional attrs? *)
    let exp = gen_conv_ext_apply ~scope `js_of_ml this.type_ x_exp in
    let exp = Jx_builder.set (if is_static then t_exp else this_exp) key exp in
    let exp = Ml.Exp.fun_ Nolabel None x_pat exp in
    let exp =
      if is_static then exp else Ml.Exp.fun_ Nolabel None this_pat exp
    in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  (* [TODO] static attributes (const?) *)
  let gen_attribute ~scope ~is_static ~is_readonly (this : Wi.Attribute.t) =
    if is_readonly then [ gen_attribute_get ~scope ~is_static this ]
    else
      [
        gen_attribute_get ~scope ~is_static this;
        gen_attribute_set ~scope ~is_static this;
      ]

  (* --- Const value --- *)

  let string_of_float' x =
    if Float.is_infinite x then "infinity" else string_of_float x

  let gen_const_value (v : Wi.const_value) =
    match v with
    | `Bool x -> Ml.Exp.construct (mknoloc (ident [ string_of_bool x ])) None
    | `Float x -> Ml.Exp.constant (Ml.Const.float (string_of_float' x))
    | `Int x -> Ml.Exp.constant (Ml.Const.int x)

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

  let gen_regular_operation ~scope ~is_static (this : Wi.Regular_operation.t) =
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
      let obj_exp = if is_static then t_exp else this_exp in
      let body =
        let ret_exp =
          exp_apply_no_labels
            (ident_exp [ "Js"; "meth_call" ])
            [ obj_exp; op_key; Ml.Exp.array ml_args ]
        in
        gen_conv_ext_apply ~scope `ml_of_js ([], this.return) ret_exp
      in
      let body =
        List.fold_left
          (fun acc arg ->
            let _lbl, optional, name, t_ext = arg in
            let arg_name_exp = ident_exp [ name ] in
            let conv_exp =
              gen_conv_ext_apply ~scope ~optional `js_of_ml t_ext arg_name_exp
            in
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

  (* --- Constructor --- *)

  let gen_constructor ~scope arguments =
    let ml_args_rev =
      List.fold_left (fun acc arg -> gen_argument_ext arg :: acc) [] arguments
    in
    let arg_names =
      List.map
        (fun (_, a) ->
          Config.rename_lower ~keyword:false (Wi.string_of_argument a)
        )
        arguments
    in
    let ml_args =
      List.fold_left
        (fun acc arg ->
          let _, _, name, _ = arg in
          ident_exp [ name ] :: acc
        )
        [] ml_args_rev
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
    let body =
      exp_apply_no_labels
        (ident_exp [ "Js"; "obj_new" ])
        [ t_exp; Ml.Exp.array ml_args ]
    in
    let body =
      List.fold_left
        (fun acc arg ->
          let _lbl, optional, name, t_ext = arg in
          let arg_name_exp = ident_exp [ name ] in
          let conv_exp =
            gen_conv_ext_apply ~scope ~optional `js_of_ml t_ext arg_name_exp
          in
          let vb = Ml.Vb.mk (Ml.Pat.var (mknoloc name)) conv_exp in
          Ml.Exp.let_ Nonrecursive [ vb ] acc
        )
        body ml_args_rev
    in
    let body = Ml.Exp.fun_ Nolabel None pat_unit body in
    let body =
      List.fold_left
        (fun body arg ->
          let label, _, name, _ = arg in
          let arg_pat = Ml.Pat.var (mknoloc name) in
          Ml.Exp.fun_ label None arg_pat body
        )
        body ml_args_rev
    in
    let pat = Ml.Pat.var name in
    let vb = Ml.Vb.mk pat body in
    [ Ml.Str.value Nonrecursive [ vb ] ]

  (* --- Const --- *)

  let gen_const ({ type_ = _; ident; value } : Wi.Const.t) =
    let name = mknoloc (Config.rename_lower ident) in
    let pat = Ml.Pat.var name in
    let exp = gen_const_value value in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  (* --- Inherits --- *)

  let gen_inherits this =
    match this with
    | None -> []
    | Some base_class_name ->
      let val_name =
        mknoloc ("to_" ^ Config.rename_lower ~keyword:false base_class_name)
      in
      let pat = Ml.Pat.var val_name in
      let exp =
        exp_apply_no_labels (ident_exp [ "Js"; "Ffi"; "magic" ]) [ this_exp ]
      in
      let exp = Ml.Exp.fun_ Nolabel None this_pat exp in
      let vb = Ml.Vb.mk pat exp in
      [ Ml.Str.value Nonrecursive [ vb ] ]

  (* --- Stringifier --- *)

  let gen_stringifier ~scope (this : Wi.Stringifier.t) =
    match this with
    | Standalone -> []
    | Attribute { attribute; readonly = is_readonly } ->
      let items =
        gen_attribute ~scope ~is_static:false ~is_readonly attribute
      in
      let alias_item =
        let pat = Ml.Pat.var (mknoloc Config.stringifier_name) in
        let exp = ident_exp [ Config.rename_lower attribute.name ] in
        let vb = Ml.Vb.mk pat exp in
        Ml.Str.value Nonrecursive [ vb ]
      in
      items @ [ alias_item ]

  (* --- Interface --- *)

  let gen_interface_member ~scope (this : Wi.Interface.member) =
    match this with
    | Constructor that -> gen_constructor ~scope that
    | Const that -> [ gen_const that ]
    | Regular_operation { regular_operation; is_static } ->
      gen_regular_operation ~scope ~is_static regular_operation
    | Special_operation s_op ->
      let r_op = Gen_common.regular_operation_of_special_operation s_op in
      gen_regular_operation ~scope ~is_static:false r_op
    | Stringifier that -> gen_stringifier ~scope that
    | Iterable that -> []
    | Async_iterable that -> []
    | Attribute { attribute; is_static; is_readonly } ->
      gen_attribute ~scope ~is_static ~is_readonly attribute
    | Inherit_attribute attribute -> []
    | Maplike maplike -> []
    | Setlike setlike -> []

  let gen_interface_member_ext
      ((_ext : Wi.extended_attributes), (interface_member : Wi.Interface.member))
      =
    gen_interface_member interface_member

  let gen_interface_any_conv () =
    let to_any_pat = Ml.Pat.var (mknoloc "to_any") in
    let of_any_pat = Ml.Pat.var (mknoloc "of_any") in
    let to_any = Ml.Vb.mk to_any_pat (ident_exp [ "Js"; "to_any" ]) in
    let of_any = Ml.Vb.mk of_any_pat (ident_exp [ "Js"; "of_any" ]) in
    [
      Ml.Str.value Nonrecursive [ to_any ]; Ml.Str.value Nonrecursive [ of_any ];
    ]

  let gen_interface ~(ctx : Analyze.ctx) (this : Wi.Interface.t) =
    let scope = this.name in
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
    let inherits_items = gen_inherits this.inherits in
    let all_members = this.members @ partial_members @ includes_members in
    let member_items =
      List.concat_map (gen_interface_member_ext ~scope) all_members
    in
    let super_typ =
      match Gen_sig.gen_super_type this.name ctx.types with
      | None -> []
      | Some td -> [ Ml.Str.type_ Recursive [ td ] ]
    in
    let t_typ =
      let manifest = Gen_sig.gen_main_interface_type this.name in
      [ Ml.Str.type_ Recursive [ Ml.Type.mk (mknoloc "t") ~manifest ] ]
    in
    let t_val =
      let pat = Ml.Pat.var (mknoloc "t") in
      let exp =
        exp_apply_no_labels
          (ident_exp [ "Js"; "raw" ])
          [ Ml'.Exp.string this.name ]
      in
      let vb = Ml.Vb.mk pat exp in
      [ Ml.Str.value Nonrecursive [ vb ] ]
    in
    let any_conv_items = gen_interface_any_conv () in
    let all_items =
      t_typ @ super_typ @ t_val @ any_conv_items @ inherits_items @ member_items
    in
    Ml.Mod.structure all_items

  (* --- Dictionary --- *)

  let gen_dictionary_member ~scope (this : Wi.Dictionary.member) =
    match this with
    | Required (type_ext, name) ->
      let pat = Ml.Pat.var (mknoloc (Config.rename_lower name)) in
      let key = Ml.Exp.constant (Ml.Const.string name) in
      let exp = Jx_builder.get this_exp key in
      let exp = gen_conv_ext_apply ~scope `ml_of_js type_ext exp in
      let exp = Ml.Exp.fun_ Nolabel None this_pat exp in
      let vb = Ml.Vb.mk pat exp in
      Ml.Str.value Nonrecursive [ vb ]
    | Optional (type_, name, _default) ->
      let pat = Ml.Pat.var (mknoloc (Config.rename_lower name)) in
      let key = Ml.Exp.constant (Ml.Const.string name) in
      let exp = Jx_builder.get this_exp key in
      let exp =
        gen_conv_ext_apply ~scope ~nullable:true `ml_of_js ([], type_) exp
      in
      let exp = Ml.Exp.fun_ Nolabel None this_pat exp in
      let vb = Ml.Vb.mk pat exp in
      Ml.Str.value Nonrecursive [ vb ]

  let gen_dictionary_member_ext ~scope (_, (m : Wi.Dictionary.member)) =
    gen_dictionary_member ~scope m

  let gen_dictionary_constructor ~scope
      (ms_ext : (_ * Wi.Dictionary.member) list) =
    let ms_rev = List.rev_map snd ms_ext in
    let ml_arg_bindings =
      List.fold_left
        (fun acc (m : Wi.Dictionary.member) ->
          let name = Wi.Dictionary.member_name m in
          let key = Ml'.Exp.string name in
          let value = ident_exp [ Config.rename_lower name ] in
          Ml.Exp.tuple [ key; value ] :: acc
        )
        [] ms_rev
    in
    let body =
      exp_apply_no_labels
        (ident_exp [ "Js"; "obj" ])
        [ Ml.Exp.array ml_arg_bindings ]
    in
    let body =
      List.fold_left
        (fun acc (m : Wi.Dictionary.member) ->
          let nullable, name', t_ext =
            match m with
            | Required (t_ext, name) ->
              let name' = Config.rename_lower name in
              (false, name', t_ext)
            | Optional (t, name, _default) ->
              let name' = Config.rename_lower name in
              (true, name', ([], t))
          in
          let arg_name_exp = ident_exp [ name' ] in
          let conv_exp =
            gen_conv_ext_apply ~scope ~nullable `js_of_ml t_ext arg_name_exp
          in
          let vb = Ml.Vb.mk (Ml.Pat.var (mknoloc name')) conv_exp in
          Ml.Exp.let_ Nonrecursive [ vb ] acc
        )
        body ms_rev
    in
    let body = Ml.Exp.fun_ Nolabel None pat_unit body in
    let exp =
      List.fold_left
        (fun body (m : Wi.Dictionary.member) ->
          let label, name' =
            match m with
            | Required (_t_ext, name) ->
              let name' = Config.rename_lower name in
              (Asttypes.Labelled name', name')
            | Optional (_t, name, _default) ->
              let name' = Config.rename_lower name in
              (Asttypes.Optional name', name')
          in
          let arg_pat = Ml.Pat.var (mknoloc name') in
          Ml.Exp.fun_ label None arg_pat body
        )
        body ms_rev
    in
    let pat_name = Ml.Pat.var (mknoloc Config.constructor_name) in
    let vb = Ml.Vb.mk pat_name exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_dictionary (this : Wi.Dictionary.t) =
    let scope = this.name in
    let manifest = Ml_js.Typ.any in
    let t_item =
      Ml.Str.type_ Recursive [ Ml.Type.mk ~manifest (mknoloc "t") ]
    in
    let t_cons = gen_dictionary_constructor ~scope this.members in
    let inherits_items = gen_inherits this.inherits in
    let member_items =
      List.map (gen_dictionary_member_ext ~scope) this.members
    in
    Ml.Mod.structure
      ((t_item :: t_cons :: inherits_items)
      @ gen_interface_any_conv ()
      @ member_items
      )

  (* --- Enum --- *)

  let gen_enum_to_any () =
    let pat = Ml.Pat.var (mknoloc "to_any") in
    let exp = ident_exp [ "Js"; "to_any" ] in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_enum_of_any () =
    let pat = Ml.Pat.var (mknoloc "of_any") in
    let exp = ident_exp [ "Js"; "of_any" ] in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

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
          let name = Config.enum_to_ident c in
          let pat = Ml.Pat.var (mknoloc name) in
          let exp = Jx_builder.of_string c in
          Ml.Str.value Nonrecursive [ Ml.Vb.mk pat exp ]
        )
        this.values
    in
    let any_conv_items = [ gen_enum_to_any (); gen_enum_of_any () ] in
    Ml.Mod.structure ((t_item :: to_str_val :: any_conv_items) @ cases_items)

  (* Namespace *)

  let gen_namespace_member_ext ~scope (_, (m : Wi.Namespace.member)) =
    match m with
    | Const c -> [ gen_const c ]
    | Attribute { attribute; is_readonly = () } ->
      gen_attribute ~scope ~is_static:true ~is_readonly:true attribute
    | Regular_operation op -> gen_regular_operation ~scope ~is_static:true op

  let gen_namespace (this : Wi.Namespace.t) =
    (* FIXME: namespace is not a "scope". *)
    let scope = this.name in
    let t_val =
      let pat = Ml.Pat.var (mknoloc "t") in
      let exp =
        exp_apply_no_labels
          (ident_exp [ "Js"; "global" ])
          [ Ml'.Exp.string this.name; Ml.Exp.variant "Object" None ]
      in
      let vb = Ml.Vb.mk pat exp in
      Ml.Str.value Nonrecursive [ vb ]
    in
    let member_items =
      List.concat_map (gen_namespace_member_ext ~scope) this.members
    in
    Ml.Mod.structure (t_val :: member_items)

  (* --- Callback interface --- *)

  let gen_callback_to_any (op : Wi.Regular_operation.t) =
    let argc = List.length op.arguments in
    let pat = Ml.Pat.var (mknoloc "to_any") in
    let body =
      exp_apply_no_labels
        (ident_exp [ "Js"; "Any"; "of_fun" ])
        [ Ml.Exp.constant (Ml.Const.int argc); this_exp ]
    in
    let exp = Ml.Exp.fun_ Nolabel None this_pat body in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_callback_of_any ~scope (op : Wi.Regular_operation.t) =
    let ml_args_rev =
      List.fold_left
        (fun acc arg -> gen_argument_ext arg :: acc)
        [] op.arguments
    in
    let ml_args =
      List.fold_left
        (fun acc arg ->
          let _, _, name, _ = arg in
          ident_exp [ name ] :: acc
        )
        [] ml_args_rev
    in
    let f_js_var = ident_exp [ "__f_js" ] in
    let f_js_exp =
      exp_apply_no_labels
        (ident_exp [ "Js"; "Ffi"; "unsafe_cast" ])
        [ Ml.Exp.variant "Function" None; ident_exp [ "any" ] ]
    in
    let body =
      let ret_exp =
        exp_apply_no_labels
          (ident_exp [ "Js"; "fun_call" ])
          [ f_js_var; Ml.Exp.array ml_args ]
      in
      gen_conv_ext_apply ~scope `ml_of_js ([], op.return) ret_exp
    in
    let body =
      List.fold_left
        (fun acc arg ->
          let _lbl, optional, name, t_ext = arg in
          let arg_name_exp = ident_exp [ name ] in
          let conv_exp =
            gen_conv_ext_apply ~scope ~optional `js_of_ml t_ext arg_name_exp
          in
          let vb = Ml.Vb.mk (Ml.Pat.var (mknoloc name)) conv_exp in
          Ml.Exp.let_ Nonrecursive [ vb ] acc
        )
        body ml_args_rev
    in
    let body =
      List.fold_left
        (fun body arg ->
          let _lbl, _, name, _ = arg in
          let arg_pat = Ml.Pat.var (mknoloc name) in
          Ml.Exp.fun_ Nolabel None arg_pat body
        )
        body ml_args_rev
    in
    let body =
      let vb = Ml.Vb.mk (pat_var "__f_js") f_js_exp in
      Ml.Exp.let_ Nonrecursive [ vb ] body
    in
    let pat = Ml.Pat.var (mknoloc "of_any") in
    let any__pat = pat_var "any" in
    let exp = Ml.Exp.fun_ Nolabel None any__pat body in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_callback_interface ~ctx (this : Wi.Callback_interface.t) =
    let scope = this.name in
    let const_l, cbt_l =
      List.fold_left
        (fun (const_l, cbt_l) (_ext, (m : Wi.Callback_interface.member)) ->
          match m with
          | Const that ->
            let c = gen_const that in
            (c :: const_l, cbt_l)
          | Regular_operation that ->
            let cbt =
              Gen_sig.gen_callback_type ~ctx ~scope ~return:that.return
                that.arguments
            in
            (const_l, (cbt, that) :: cbt_l)
        )
        ([], []) this.members
    in
    let cb_typ, op =
      match cbt_l with
      | [ x ] -> x
      | [] -> fail "callback interface %S: missing regular operation" this.name
      | _ -> fail "callback interface %S: too many regular operations" this.name
    in
    let cb_typ_item = [ Ml.Str.type_ Recursive [ cb_typ ] ] in
    Ml.Mod.structure
      (cb_typ_item
      @ [ gen_callback_to_any op; gen_callback_of_any ~scope op ]
      @ const_l
      )

  (* to any conv *)

  (* TODO: incomplete/review/fix *)
  let gen_typedef_to_any () =
    let pat = Ml.Pat.var (mknoloc "to_any") in
    let body =
      exp_apply_no_labels
        (ident_exp [ "Js"; "Any"; "of_fun" ])
        [ Ml.Exp.constant (Ml.Const.int 42); this_exp ]
    in
    let exp = Ml.Exp.fun_ Nolabel None this_pat body in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  let gen_typedef_of_any () =
    let pat = Ml.Pat.var (mknoloc "of_any") in
    let body =
      exp_apply_no_labels
        (ident_exp [ "Js"; "Any"; "of_fun" ])
        [ Ml.Exp.constant (Ml.Const.int 42); this_exp ]
    in
    let exp = Ml.Exp.fun_ Nolabel None this_pat body in
    let vb = Ml.Vb.mk pat exp in
    Ml.Str.value Nonrecursive [ vb ]

  (* --- Typedef --- *)

  let gen_typedef ~ctx (this : Wi.Typedef.t) =
    match snd this.type_ with
    | `Union ((t1, t2, ts), is_nullable) ->
      let ts = t1 :: t2 :: ts in
      let t_td_str = Ml.Type.mk (mknoloc "t") ~manifest:Jx_lift.t in
      let t_stri = Ml.Str.type_ Recursive [ t_td_str ] in
      let constr_list =
        List.map
          (function
            | `Single (_ext, (t : Wi.distinguishable_type), is_nullable) ->
              let name =
                "with_" ^ String.lowercase_ascii (Gen_common.type_tag t)
              in
              let typ =
                Gen_sig.gen_nullable
                  (Gen_sig.gen_distinguishable ~ctx t)
                  is_nullable
              in
              let typ = Ml.Typ.arrow Nolabel typ (Ml'.Typ.t []) in
              (name, typ)
            | `Nested u -> failwith "unsuported: nested union"
            )
          ts
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
      let items =
        [ t_stri ]
        @ [ gen_typedef_to_any (); gen_typedef_of_any () ]
        @ constr_val_stri_list
      in
      Ml.Mod.structure items
    | _ ->
      let mname = Config.rename_upper this.name in
      Ml.Mod.ident (mknoloc (ident [ mname ]))
end

(* Top-level module binding generators *)

let gen_callback ~ctx (this : Wi.Callback.t) =
  let name' = Config.rename_upper this.name in
  let mtyp = Gen_sig.gen_callback ~ctx this in
  let mexp = Ml.Mod.ident (mknoloc (ident [ name' ])) in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk (mknoloc (Some name')) mexp

let gen_callback_interface ~ctx (this : Wi.Callback_interface.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_callback_interface ~ctx this in
  let mexp = Gen_str.gen_callback_interface ~ctx this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_interface ~ctx (this : Wi.Interface.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_interface ~ctx this in
  let mexp = Gen_str.gen_interface ~ctx this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  let attrs = [ Ml'.Attr.doc (Doc.L.cls_see this.name) ] in
  Ml.Mb.mk ~attrs name mexp

let gen_dictionary ~ctx (this : Wi.Dictionary.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_dictionary ~ctx this in
  let mexp = Gen_str.gen_dictionary this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_enum (this : Wi.Enum.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mtyp = Gen_sig.gen_enum this in
  let mexp = Gen_str.gen_enum this in
  let mexp = Ml.Mod.constraint_ mexp mtyp in
  Ml.Mb.mk name mexp

let gen_typedef ~ctx (this : Wi.Typedef.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mty = Gen_sig.gen_typedef ~ctx this in
  let str = Gen_str.gen_typedef ~ctx this in
  let str' = Ml.Mod.constraint_ str mty in
  Ml.Mb.mk name str'

let gen_namespace ~ctx (this : Wi.Namespace.t) =
  let name = mknoloc (Some (Config.rename_upper this.name)) in
  let mty = Gen_sig.gen_namespace ~ctx this in
  let str = Gen_str.gen_namespace this in
  let str' = Ml.Mod.constraint_ str mty in
  Some (Ml.Mb.mk name str')

let gen_definition ~ctx (this : Wi.definition) =
  match this with
  | Callback that -> Some (gen_callback ~ctx that)
  | Callback_interface that -> Some (gen_callback_interface ~ctx that)
  | Interface x -> Some (gen_interface ~ctx x)
  | Mixin _ -> None
  (* TODO *)
  | Namespace that -> gen_namespace ~ctx that
  | Partial _ -> None
  | Dictionary that -> Some (gen_dictionary ~ctx that)
  | Enum that -> Some (gen_enum that)
  | Typedef that -> Some (gen_typedef ~ctx that)
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

let gen_toplevel_type name bases =
  let tags =
    List.map
      (fun x -> Ml.Rf.tag (mknoloc (Config.rename_upper x)) false [])
      (name :: bases)
  in
  let manifest = Ml.Typ.variant tags Closed None in
  let td = Ml.Type.mk ~manifest (mknoloc (Config.rename_lower name)) in
  Ml.Str.type_ Recursive [ td ]

let gen_toplevel_types types =
  let rec loop base =
    match String_map.find_opt base types with
    | None | Some None -> [ base ]
    | Some (Some base') -> base :: loop base'
  in
  String_map.fold
    (fun t_name inherits acc ->
      let bases =
        match inherits with
        | None -> []
        | Some base -> loop base
      in
      gen_toplevel_type t_name bases :: acc
    )
    types []
  |> List.rev

let gen ~ctx definitions =
  let mbl = gen_definitions ~ctx definitions in
  [ Ml.Str.rec_module mbl ]
