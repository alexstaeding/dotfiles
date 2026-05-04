{ ... }:
{
  flake.modules.nixos.nvidia =
    { pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];
      boot.kernelModules = [ "nvidia-uvm" ];
      boot.extraModprobeConfig = ''
        options nvidia NVreg_PreserveVideoMemoryAllocations=1
        options nvidia NVreg_TemporaryFilePath=/var/tmp
      '';

      hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
      };

      environment.systemPackages = with pkgs; [
        nvtopPackages.nvidia
        nvidia-container-toolkit
      ];
    };
}
