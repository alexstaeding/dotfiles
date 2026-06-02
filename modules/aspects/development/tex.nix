{ ... }:
{
  flake.modules.homeManager.tex =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          algotex
          python311Packages.pygments
        ];
      };
    };
}
