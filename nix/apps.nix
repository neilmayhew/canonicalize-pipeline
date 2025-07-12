{ self, flake-utils, system, ... }:
{
  default = flake-utils.lib.mkApp {
    drv = self.packages.${system}.default;
  };
}
