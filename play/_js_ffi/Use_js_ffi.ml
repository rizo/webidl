open Js_ffi.Ffi
module Console = Js_ffi.Console

let () =
  Console.log "HELLO";
  Console.log (1, 2);
  let obj = js_of_float 3.14 in
  let ret = meth_call obj "toFixed" [||] in
  Console.log ret
