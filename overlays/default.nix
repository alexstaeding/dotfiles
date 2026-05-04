{ inputs }:
final: prev:
import ../pkgs {
  pkgs = final;
  inherit inputs;
}
// {
  algotex = inputs.algotex.packages.${final.stdenv.hostPlatform.system}.default;
  zed-latest = inputs.zed.packages.${final.stdenv.hostPlatform.system}.default;
}
