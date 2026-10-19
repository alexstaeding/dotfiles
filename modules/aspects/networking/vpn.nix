{ ... }:
{
  flake.modules.nixos.vpn =
    { pkgs, ... }:
    {
      services.mullvad-vpn = {
        enable = true;
        gui.enable = true;
      };
    };
}
