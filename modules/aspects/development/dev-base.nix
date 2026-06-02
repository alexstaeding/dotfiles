{ ... }:
{
  flake.modules.homeManager.dev-base =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          nixd
          nixfmt
          nerd-fonts.jetbrains-mono
          font-awesome
        ];
      };
    };
}
