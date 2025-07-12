{ self, system, ... }:
with self.packages.${system};
{
  dynamic = dynamic.env;
  static = static.env;
  default = self.devShells.${system}.dynamic;
}
