open Prelude

let check (ctx : Analyze.ctx) =
  if String_set.cardinal ctx.unresolved_partial_interface_names > 0 then
    fail "unresolved partial interfaces: %s"
      (ctx.unresolved_partial_interface_names
      |> String_set.to_seq
      |> List.of_seq
      |> String.concat ", "
      )

let gen_mli ?(input_name = "input") ~input ~output () =
  let definitions = Webidl_parser.parse_channel input_name input in
  let ctx = Analyze.analyze definitions in
  check ctx;
  let ocaml_str = Gen.gen ~ctx definitions in
  let f = Format.formatter_of_out_channel output in
  Format.fprintf f "@.@.%a@." Astlib.Pprintast.structure ocaml_str
