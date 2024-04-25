let () =
  match Sys.argv with
  | [| _; input_file_path; output_file_path |] ->
    let input =
      if input_file_path = "-" then stdin else open_in input_file_path
    in
    let output =
      if output_file_path = "-" then stdout else open_out output_file_path
    in
    Jx_of_webidl.gen_mli ~input ~output ()
  | _ ->
    Printf.eprintf "usage: %s INPUT OUTPUT\n" Sys.argv.(0);
    exit 1
