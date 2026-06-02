{ ... }:
{
  flake.modules.nixos.networking =
    { pkgs, ... }:
    {
      networking.networkmanager.enable = true;

      environment.systemPackages = with pkgs; [
        ethtool
        nethogs
      ];
    };
}
