{ ... }:
{
  flake.modules.nixos.networking = {
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
    };
  };
}
