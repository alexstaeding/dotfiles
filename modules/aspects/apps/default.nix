{ lib, ... }:
{
  flake.modules.homeManager.apps =
    { pkgs, ... }:
    {
      home.packages =
        with pkgs;
        [
          signal-desktop
          teams-for-linux
          zoom-us
          spotify
          feishin
          ffmpeg
          qbittorrent
          prismlauncher
          zotero
          inkscape
          insomnia
          google-chrome
          vimgolf
        ]
        ++ lib.optionals stdenv.isLinux [
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
        ++ lib.optionals pkgs.stdenv.isDarwin [
          skimpdf
          rectangle
        ];
      programs = {
        discord.enable = true;
        firefox = {
          enable = true;
          # configPath = "${config.xdg.configHome}/mozilla/firefox";
        };
        mpv.enable = true;
        obsidian.enable = true;
        thunderbird.enable = true;
        vesktop.enable = true;
      };
    };
  flake.modules.nixos.apps =
    { ... }:
    {
      programs = {
        steam.enable = true;
      };
    };
}
