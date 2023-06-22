{ nixpkgs ? import <nixpkgs> {}, static ? true }:

with (if static then nixpkgs.pkgsStatic else nixpkgs);

(if static then haskell.lib.justStaticExecutables else lib.id)
  (haskellPackages.callPackage ./. {})
