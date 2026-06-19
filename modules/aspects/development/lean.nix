{ ... }:
{
  flake.modules.homeManager.lean =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          lean4
        ];
      };
    };
}
