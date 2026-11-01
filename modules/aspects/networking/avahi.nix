{...}: {
  flake.modules.nixos.avahi = {pkgs, ...}: {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      settings = {
        server = {
          allow-point-to-point = true;
        };
        publish = {
          "disable-publishing" = false;
          "disable-user-service-publishing" = false;
          "publish-addresses" = true;
        };
      };
    };
  };
}
