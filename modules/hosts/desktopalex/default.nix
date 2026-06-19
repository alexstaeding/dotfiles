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
  flake.modules.nixos.razer = config.flake.factory.nixos.razer [ "alex" ];
  flake.nixosConfigurations.desktopalex = withSystem "x86_64-linux" (
    { pkgs, ... }:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        { nixpkgs.pkgs = pkgs; }

        ./_hardware.nix

        {
          users.users.alex.extraGroups = [
            "docker"
            "openrazer"
          ];
        }
        flakeConfig.flake.modules.nixos.alex
        flakeConfig.flake.modules.nixos.nix
        flakeConfig.flake.modules.nixos.locale
        flakeConfig.flake.modules.nixos.ssh
        flakeConfig.flake.modules.nixos.networking
        flakeConfig.flake.modules.nixos.avahi
        flakeConfig.flake.modules.nixos.vpn
        flakeConfig.flake.modules.nixos.apps
        flakeConfig.flake.modules.nixos.audio
        flakeConfig.flake.modules.nixos.desktop
        flakeConfig.flake.modules.nixos.containers
        flakeConfig.flake.modules.nixos.nvidia
        flakeConfig.flake.modules.nixos.razer

        inputs.home-manager.nixosModules.home-manager

        (
          {
            config,
            lib,
            ...
          }:
          let
            zfsCompatibleKernelPackages = lib.filterAttrs (
              name: kernelPackages:
              (builtins.match "linux_[0-9]+_[0-9]+" name) != null
              && (builtins.tryEval kernelPackages).success
              && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
            ) pkgs.linuxKernel.packages;

            latestKernelPackage = lib.last (
              lib.sort (a: b: lib.versionOlder a.kernel.version b.kernel.version) (
                builtins.attrValues zfsCompatibleKernelPackages
              )
            );
          in
          {
            system.stateVersion = "24.11";
            networking.hostName = "desktopalex";
            networking.hostId = "f3eff353";

            boot.kernelPackages = latestKernelPackage;
            boot.loader.systemd-boot.enable = true;
            boot.loader.efi.canTouchEfiVariables = true;

            hardware.bluetooth.enable = true;
            hardware.xpadneo.enable = true;

            home-manager.extraSpecialArgs = {
              inherit inputs pkgs;
              inherit (inputs.self) outputs;
            };
            home-manager.users.alex.imports = [
              flakeConfig.flake.modules.homeManager.alex
              flakeConfig.flake.modules.homeManager.ssh

              flakeConfig.flake.modules.homeManager.nano
              flakeConfig.flake.modules.homeManager.vim
              flakeConfig.flake.modules.homeManager.vscode

              flakeConfig.flake.modules.homeManager.dev-base
              flakeConfig.flake.modules.homeManager.c
              flakeConfig.flake.modules.homeManager.java
              flakeConfig.flake.modules.homeManager.tex
              flakeConfig.flake.modules.homeManager.typst

              flakeConfig.flake.modules.homeManager.devops
              flakeConfig.flake.modules.homeManager.apps
              flakeConfig.flake.modules.homeManager.desktop
            ];
          }
        )
      ];
    }
  );
}
