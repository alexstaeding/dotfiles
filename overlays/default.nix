{ inputs }:
final: prev:
let
  internalPkgs = import ../pkgs {
    pkgs = final;
    inherit inputs;
  };
in internalPkgs
// {
  algotex = inputs.algotex.packages.${final.stdenv.hostPlatform.system}.default;
  zed-latest = inputs.zed.packages.${final.stdenv.hostPlatform.system}.default;
}
