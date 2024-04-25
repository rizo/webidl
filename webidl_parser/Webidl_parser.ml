

type src_type = File | Channel | String

type syntax_error = {
  src : string;
  src_type : src_type;
  start_pos : int * int;
  end_pos : int * int;
  token : string;
  strict : bool;
  around : string;
}

let string_of_syntax_error e =
  let start_l, start_c = e.start_pos in
  let end_l, end_c = e.end_pos in
  if Int.equal start_l end_l then
    Printf.sprintf "Syntax error: File %S, line %d, characters %d-%d: %S" e.src
      start_l start_c end_c e.token
  else
    Printf.sprintf "Syntax error: File %S, lines %d-%d, characters %d-%d: %S"
      e.src start_l end_l start_c end_c e.token

exception Syntax_error of syntax_error

let () =
  Printexc.register_printer (function
    | Syntax_error e -> Some (string_of_syntax_error e)
    | _ -> None
    )

let get_around get_substr sp ep =
  let around_sp = max (sp - 20) 0 in
  let around_ep = ep + 20 in
  let around =
    try get_substr around_sp around_ep with _ -> get_substr around_sp ep
  in
  "..." ^ around ^ "..."

let get_error_info strict src src_type get_substr lexbuf =
  let open Lexing in
  let start = Lexing.lexeme_start_p lexbuf in
  let end_ = Lexing.lexeme_end_p lexbuf in
  let token = Lexing.lexeme lexbuf in
  let start_pos = (start.pos_lnum, start.pos_cnum - start.pos_bol + 1) in
  let end_pos = (end_.pos_lnum, end_.pos_cnum - end_.pos_bol + 1) in
  let around = get_around get_substr start.pos_cnum end_.pos_cnum in
  { src; src_type; start_pos; end_pos; token; strict; around }

let main ?(strict = true) src src_type lexbuf get_substr =
  try Parser.main Lexer.read lexbuf
  with Parser.Error | Parsing.Parse_error ->
    let syntax_error = get_error_info strict src src_type get_substr lexbuf in
    raise (Syntax_error syntax_error)

let parse_string ?(strict = true) src_name input_string =
  let get_substr sp ep = String.sub input_string sp (ep - sp) in
  let lexbuf = Lexing.from_string input_string in
  main ~strict src_name String lexbuf get_substr

let parse_channel ?(strict = true) src_name input_channel =
  let input_string =
    really_input_string input_channel (in_channel_length input_channel)
  in
  let get_substr sp ep = String.sub input_string sp (ep - sp) in
  let lexbuf = Lexing.from_string input_string in
  main ~strict src_name Channel lexbuf get_substr

let parse_file ?(strict = true) file_name =
  let input_channel = open_in file_name in
  let lexbuf = Lexing.from_channel input_channel in
  let get_substr sp ep =
    let now_pos = pos_in input_channel in
    seek_in input_channel sp;
    let ans = really_input_string input_channel (ep - sp) in
    seek_in input_channel now_pos;
    ans
  in
  main ~strict file_name File lexbuf get_substr
