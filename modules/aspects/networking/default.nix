{ ... }:
{
  flake.modules.nixos.networking =
    { pkgs, ... }:
    {
      networking.networkmanager.enable = true;

      services.avahi = {
        enable = true;
        allowPointToPoint = true;
        nssmdns4 = true;
        publish = {
          enable = true;
          userServices = true;
        };
      };

      services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
      };

      environment.systemPackages = with pkgs; [
        ethtool
        nethogs
      ];
    };
}
