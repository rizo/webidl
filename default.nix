let
  onix = import (builtins.fetchGit {
    url = "https://github.com/rizo/onix.git";
    rev = "d2808d34e0932853ee5d42337238280c49cb6625";
  }) { verbosity = "info"; };

in onix.env {
  path = ./.;

  vars = {
    "with-test" = true;
    "with-doc" = true;
    "with-dev-setup" = true;
  };

  deps = { "ocaml-base-compiler" = "5.0.0"; };
}
