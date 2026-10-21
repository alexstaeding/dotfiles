{
  lib,
  config,
  ...
}: let
  hm = config.flake.modules.homeManager;
in {
  flake.modules.homeManager.apps = {pkgs, ...}: {
    imports = [
      hm.mpv
    ];
    home.packages = with pkgs;
      [
        signal-desktop
        spotify
        feishin
        ffmpeg
        qbittorrent
        prismlauncher
        # zotero
        inkscape
        insomnia
        google-chrome
        vimgolf
        antigravity-hub
        antigravity-ide
        antigravity-cli
      ]
      ++ lib.optionals stdenv.hostPlatform.isLinux [
        teams-for-linux
        mission-center
        obs-studio
        makemkv
        popsicle
        resilio-sync
        proton-pass
        gimp
        kdiskmark
        teamviewer
      ]
      ++ lib.optionals stdenv.hostPlatform.isDarwin [
        skimpdf
        rectangle
      ];
    programs = {
      discord.enable = true;
      firefox = {
        enable = true;
        # configPath = "${config.xdg.configHome}/mozilla/firefox";
      };
      obsidian.enable = true;
      thunderbird.enable = true;
      vesktop.enable = true;
      kitty = {
        enable = true;
        font = {
          name = "JetBrainsMono Nerd Font Mono";
          size = 12;
        };
        settings = {
          macos_colorspace = "displayp3";
          "modify_font cell_width" = "95%";
          disable_ligatures = "always";
          macos_option_as_alt = "both";
        };
        keybindings = {
          "alt+left" = "send_text all \\x1bb";
          "alt+right" = "send_text all \\x1bf";
          "cmd+left" = "send_text all \\x01";
          "cmd+right" = "send_text all \\x05";
          "cmd+backspace" = "send_text all \\x15";
          "alt+backspace" = "send_text all \\x1b\\x7f";
        };
      };
    };

    targets.darwin = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
      copyApps.enable = true;
      linkApps.enable = false;
    };

    # home.activation.cleanOldAppSymlinks = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin (
    #   lib.hm.dag.entryBefore ["copyApps"] ''
    #     if [ -L "$HOME/Applications/Home Manager Apps" ]; then
    #       run rm -f "$HOME/Applications/Home Manager Apps"
    #     fi
    #   ''
    # );
  };
  flake.modules.nixos.apps = {...}: {
    programs = {
      steam.enable = true;
    };
  };
}
