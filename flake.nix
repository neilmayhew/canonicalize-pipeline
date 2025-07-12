{
  description = "Canonicalize a Concourse pipeline file";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = allInputs@{ self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let args = (allInputs // { inherit system; }); in {
        packages = import nix/packages.nix args;
        devShells = import nix/shells.nix args;
        apps = import nix/apps.nix args;
      }
    );
}
