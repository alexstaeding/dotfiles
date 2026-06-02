{ ... }:
{
  flake.modules.nixos.ssh = {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowedUsers = null;
        UseDns = true;
      };
    };
  };
  flake.modules.homeManager.ssh = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
    };
  };
}
