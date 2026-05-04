{ ... }:
{
  flake.modules.homeManager.crypto =
    { pkgs, ... }:
    {
      programs.gpg.enable = true;
      services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        pinentry.package = if pkgs.stdenv.isLinux then pkgs.pinentry-all else pkgs.pinentry_mac;
      };
    };
}
