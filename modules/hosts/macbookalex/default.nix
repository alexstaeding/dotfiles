{
  inputs,
  config,
  withSystem,
  ...
}:
let
  inherit (inputs) home-manager;
in
{
  flake.darwinConfigurations.macbookalex = withSystem "aarch64-darwin" (
    { pkgs, ... }:
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit inputs pkgs;
        inherit (inputs.self) outputs;
      };

      modules = [
        { nixpkgs.pkgs = pkgs; }
        config.flake.modules.darwin.nix
        config.flake.modules.darwin.alex
        {
          system.stateVersion = 5;
        }
        home-manager.darwinModules.home-manager
        {
          # if needed later: home-manager.sharedModules = [ ... ];
          home-manager.extraSpecialArgs = {
            inherit inputs pkgs;
            inherit (inputs.self) outputs;
          };

          home-manager.users.alex.imports = [
            config.flake.modules.homeManager.alex
            config.flake.modules.homeManager.ssh

            config.flake.modules.homeManager.nano
            config.flake.modules.homeManager.vim
            config.flake.modules.homeManager.vscode

            config.flake.modules.homeManager.dev-base
            config.flake.modules.homeManager.c
            config.flake.modules.homeManager.java
            config.flake.modules.homeManager.tex
            config.flake.modules.homeManager.typst

            config.flake.modules.homeManager.devops
            config.flake.modules.homeManager.apps
          ];
        }
      ];
    }
  );
}
