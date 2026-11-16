{...}: {
  flake.modules.homeManager.crypto = {pkgs, ...}: {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentry.package = pkgs.pinentry-curses;
    };
  };
}
