{ ... }:
{
  flake.modules.nixos.audio =
    { pkgs, ... }:
    {
      security.rtkit.enable = true;
      services.pulseaudio.enable = false;
      services.pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        extraConfig.pipewire.adjust-sample-rate = {
          "context.properties"."default.clock.rate" = 192000;
        };
      };
      environment.systemPackages = with pkgs; [
        alsa-utils
        linuxptp
      ];
    };
}
