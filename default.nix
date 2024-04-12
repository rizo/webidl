let
  # Obtain the latest onix package.
  onix = import (builtins.fetchGit {
    url = "https://github.com/rizo/onix.git";
    rev = "d2808d34e0932853ee5d42337238280c49cb6625";
  }) { verbosity = "info"; };

# Create your project environment.
in onix.env {
  # The path where opam files are looked up.
  path = ./.;

  # Optional: dependency variables to be used during lock generation.
  vars = {
    "with-test" = true;
    "with-doc" = true;
    "with-dev-setup" = true;
  };

  # Optional: specify the compiler version for the build environment.
  deps = { "ocaml-base-compiler" = "5.0.0"; };
}
