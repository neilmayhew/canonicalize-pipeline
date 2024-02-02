{
  description = "Canonicalize a Concourse pipeline file";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "canonicalize-pipeline";
      overlay = nix/overlay.nix;
      shell = nix/shell.nix;
    };
}
