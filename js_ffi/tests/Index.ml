open Js_ffi

open struct
  (* let parse_float_of_any = D.fun1 ~return:D.float E.string *)

  let parse_int1 str radix =
    fun_call (raw "parseInt") [| any_of_string str; any_of_int radix |]
    |> int_of_any

  let call_ml_func func =
    let func_any = any_of_fun 3 func in
    fun_call (raw "callMlFunc") [| func_any |] |> int_of_any
end

let ml_func arr str nul =
  debug (arr, str, nul);
  "NOP"

let () =
  let x1 = parse_int1 "42" 10 in
  let x2 = call_ml_func ml_func in
  raw "console.log('hello'), 32" |> typeof |> String.capitalize_ascii |> debug;
  debug (x1, x2);
  (* debugger (); *)
  ()
(* let () = print_endline (string_of_float (100.0 +. parse_float "3.14")) *)
