{ mkDerivation, lib, base, lens-aeson, microlens
, optparse-applicative, terminal-size, yaml
}:
mkDerivation {
  pname = "canonicalize-pipeline";
  version = "1.0.0.1";
  src = lib.cleanSource ./..;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base lens-aeson microlens optparse-applicative terminal-size yaml
  ];
  mainProgram = "canonicalize-pipeline";
  description = "Canonicalize a Concourse pipeline file";
  homepage = "https://github.com/neilmayhew/canonicalize-pipeline";
  license = lib.licenses.mit;
  maintainers = with lib.maintainers; [ neilmayhew ];
}
