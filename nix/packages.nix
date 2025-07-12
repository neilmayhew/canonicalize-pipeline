{ self, nixpkgs, system, ... }:
with import nixpkgs { inherit system; };
{
  dynamic = haskell.lib.justStaticExecutables
    (haskellPackages.callPackage ./canonicalize-pipeline.nix { });
  static = haskell.lib.justStaticExecutables
    (pkgsStatic.haskellPackages.callPackage ./canonicalize-pipeline.nix { });

  default = with self.packages.${system};
    if stdenv.hostPlatform.isDarwin then dynamic else static;
}
