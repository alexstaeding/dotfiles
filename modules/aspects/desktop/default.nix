{ inputs, ... }:
{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      imports = [
        inputs.plasma-manager.homeModules.plasma-manager
      ];
      programs = {
        plasma = {
          enable = true;

          workspace = {
            clickItemTo = "select";
            lookAndFeel = "org.kde.breezedark.desktop";
          };

          hotkeys.commands."launch-kitty" = {
            name = "Launch Kitty";
            key = "Meta+Return";
            command = "kitty";
          };
        };
      };
      home.packages = with pkgs; [
        gamescope
      ];
    };

  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      services.xserver.xkb.layout = "us";
      services.desktopManager.plasma6.enable = true;
      services.displayManager = {
        defaultSession = "plasma";
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };

      fonts.fontconfig.enable = true;

      programs = {
        sway.enable = true;
      };

      environment.systemPackages = with pkgs; [
        wl-clipboard
      ];
    };
}
