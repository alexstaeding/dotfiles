{ ... }:
{
  flake.modules.nixos.avahi =
    { pkgs, ... }:
    {
      services.avahi = {
        enable = true;
        allowPointToPoint = true;
        nssmdns4 = true;
        publish = {
          enable = true;
          userServices = true;
        };
      };
    };
}
