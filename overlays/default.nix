{inputs}: final: prev:
import ../pkgs {
  pkgs = final;
  inherit inputs;
}
// {
  zed-latest = inputs.zed.packages.${final.stdenv.hostPlatform.system}.default;
}
