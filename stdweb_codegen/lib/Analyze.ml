module Wi = Webidl_ast
open Prelude

type ctx = {
  (* All interfaces *)
  interfaces : Wi.Interface.t String_map.t;
  (* Partial interfaces by interface name *)
  partial_interfaces : Wi.Partial_interface.t list String_map.t;
  (* Interface partials without interface in scope *)
  unresolved_partial_interface_names : String_set.t;
  (* Interface mixin includes by mixin name and interface name *)
  interface_includes : Wi.Mixin.t String_map.t String_map.t;
  (* All interface mixins *)
  mixins : Wi.Mixin.t String_map.t;
  (* Types and inheritence information *)
  types : string option String_map.t;
}

let empty =
  {
    interfaces = String_map.empty;
    partial_interfaces = String_map.empty;
    unresolved_partial_interface_names = String_set.empty;
    interface_includes = String_map.empty;
    mixins = String_map.empty;
    types = String_map.empty;
  }

let rec analyze ?init:(ctx = empty) (definitions : Wi.definitions) =
  let ctx = List.fold_left analyze_definition ctx definitions in
  (* Find unresolved partials. *)
  let unresolved_partial_interface_names =
    String_map.fold
      (fun name _p_intf acc ->
        if not (String_map.mem name ctx.interfaces) then String_set.add name acc
        else acc
      )
      ctx.partial_interfaces String_set.empty
  in
  let ctx = { ctx with unresolved_partial_interface_names } in
  (* Replace placeholder mixins with real ones. *)
  let interface_includes =
    String_map.mapi
      (fun intf_name mixin_list ->
        if not (String_map.mem intf_name ctx.interfaces) then
          fail "invalid include: undefined interface: %s" intf_name;
        String_map.map
          (fun (m : Wi.Mixin.t) ->
            try String_map.find m.name ctx.mixins
            with _ -> fail "invalid include: undefined mixin: %s" m.name
          )
          mixin_list
      )
      ctx.interface_includes
  in
  let ctx = { ctx with interface_includes } in
  ctx

and analyze_definition ctx (_ext, (definition : Wi.definition)) =
  match definition with
  | Partial (Interface p_intf) ->
    let partial_interfaces =
      String_map.update p_intf.name
        (function
          | None -> Some [ p_intf ]
          | Some prev -> Some (p_intf :: prev)
          )
        ctx.partial_interfaces
    in
    { ctx with partial_interfaces }
  | Interface intf ->
    let interfaces =
      String_map.update intf.name
        (function
          | None -> Some intf
          | Some _ -> fail "duplicate interface name: %s" intf.name
          )
        ctx.interfaces
    in
    let types = String_map.add intf.name intf.inherits ctx.types in
    { ctx with interfaces; types }
  | Dictionary dict ->
    let types = String_map.add dict.name dict.inherits ctx.types in
    { ctx with types }
  | Includes (intf_name, mixin_name) ->
    let interface_includes =
      let placeholder = { Wi.Mixin.name = mixin_name; members = [] } in
      String_map.update intf_name
        (function
          | None -> Some String_map.empty
          | Some prev ->
            Some
              (String_map.update mixin_name
                 (function
                   | None -> Some placeholder
                   | Some _ ->
                     fail "duplicate includes statement: %s includes %s"
                       intf_name mixin_name
                   )
                 prev
              )
          )
        ctx.interface_includes
    in
    { ctx with interface_includes }
  | Mixin mixin ->
    let mixins =
      String_map.update mixin.name
        (function
          | None -> Some mixin
          | Some _ -> fail "duplicate interface mixin name: %S" mixin.name
          )
        ctx.mixins
    in
    { ctx with mixins }
  | _ -> ctx
