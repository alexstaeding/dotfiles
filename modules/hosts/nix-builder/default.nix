{
  inputs,
  config,
  lib,
  withSystem,
  ...
}:
let
  flakeConfig = config;
in
{
  flake.modules.homeManager.ssh = {
    programs.ssh.settings."nix-builder" = {
      hostname = "130.82.172.104";
      user = "alex";
      identityFile = "~/.ssh/id_ed25519";
    };
  };

  flake.nixosConfigurations.nix-builder = withSystem "x86_64-linux" (
    { pkgs, ... }:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        { nixpkgs.pkgs = pkgs; }

        flakeConfig.flake.modules.nixos.alex
        flakeConfig.flake.modules.nixos.nix
        flakeConfig.flake.modules.nixos.locale
        flakeConfig.flake.modules.nixos.ssh
        flakeConfig.flake.modules.nixos.networking
        flakeConfig.flake.modules.nixos.containers

        inputs.home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko

        (
          {
            config,
            lib,
            modulesPath,
            ...
          }:
          {
            imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
            system.stateVersion = "25.11";
            networking.hostName = "nix-builder";
            networking.hostId = "1459bf8d";

            boot.loader.systemd-boot.enable = true;
            boot.loader.efi.canTouchEfiVariables = false;
            boot.loader.efi.efiSysMountPoint = "/boot";

            disko.devices.disk.main = {
              device = "/dev/vda";
              type = "disk";
              content = {
                type = "gpt";
                partitions = {
                  ESP = {
                    size = "512M";
                    type = "EF00";
                    content = {
                      type = "filesystem";
                      format = "vfat";
                      mountpoint = "/boot";
                      mountOptions = [ "umask=0077" ];
                    };
                  };
                  root = {
                    size = "100%";
                    content = {
                      type = "filesystem";
                      format = "ext4";
                      mountpoint = "/";
                    };
                  };
                };
              };
            };

            home-manager.extraSpecialArgs = {
              inherit inputs pkgs;
              inherit (inputs.self) outputs;
            };

            home-manager.users.alex.imports = [
              flakeConfig.flake.modules.homeManager.alex

              flakeConfig.flake.modules.homeManager.nano
              flakeConfig.flake.modules.homeManager.vim

              flakeConfig.flake.modules.homeManager.dev-base
              flakeConfig.flake.modules.homeManager.c
              flakeConfig.flake.modules.homeManager.java
            ];
          }
        )
      ];
    }
  );
}
