# Generated using `cabal2nix ..`
{ mkDerivation, aeson, base, bytestring, lens-aeson, lib, microlens
, optparse-applicative, terminal-size, vector, yaml
}:
mkDerivation {
  pname = "canonicalize-pipeline";
  version = "1.0.0.3";
  src = lib.cleanSource ./..;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base bytestring lens-aeson microlens optparse-applicative
    terminal-size vector yaml
  ];
  homepage = "https://github.com/neilmayhew/canonicalize-pipeline";
  description = "Canonicalize a Concourse pipeline file";
  license = lib.licenses.mit;
  maintainers = with lib.maintainers; [ neilmayhew ];
  mainProgram = "canonicalize-pipeline";
}
