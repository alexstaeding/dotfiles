{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "vmd"
    "xhci_pci"
    "nvme"
    "usbhid"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-intel"
    "sg"
  ];
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f8c3dcd4-2d5c-4e52-b401-8b76a3c64c2f";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4B6C-ADB9";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };
  fileSystems."/ephemeral" = {
    device = "/dev/disk/by-uuid/712c2e44-75d2-4c31-8710-a0c956c3075f";
    fsType = "ext4";
  };
  fileSystems."/home/alex" = {
    device = "desktopalex-pond/home/alex";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
