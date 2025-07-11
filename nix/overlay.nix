final: prev:
{
  canonicalize-pipeline = rec {
    defaultPackage = if final.stdenv.hostPlatform.isDarwin then dynamic else static;
    dynamic = final.haskell.lib.justStaticExecutables
      (final.haskellPackages.callPackage ./default.nix {});
    static = final.haskell.lib.justStaticExecutables
      (final.pkgsStatic.haskellPackages.callPackage ./default.nix {});
  };
}
