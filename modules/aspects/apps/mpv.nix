{ ... }:
{
  flake.modules.homeManager.mpv =
    { pkgs, lib, ... }:
    {
      programs.mpv = {
        enable = true;
        config = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
          vo = "gpu-next";
          gpu-api = "vulkan";
          gpu-context = "waylandvk";
          target-colorspace-hint = "yes";
          hwdec = "auto-safe";
          profile = "gpu-hq";
        };
        scripts = lib.optionals pkgs.stdenv.hostPlatform.isLinux (
          with pkgs.mpvScripts;
          [
            autocrop
          ]
        );
      };

      home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux (
        with pkgs;
        [
          jellyfin-mpv-shim
        ]
      );

      xdg.configFile = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        "jellyfin-mpv-shim/mpv.conf".text = ''
          vo=gpu-next
          gpu-api=vulkan
          gpu-context=waylandvk
          target-colorspace-hint=yes
          hwdec=auto-safe
          profile=gpu-hq
        '';
        "jellyfin-mpv-shim/scripts/autocrop.lua".source =
          "${pkgs.mpvScripts.autocrop}/share/mpv/scripts/autocrop.lua";
      };
    };
}
