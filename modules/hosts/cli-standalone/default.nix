{
  inputs,
  config,
  withSystem,
  ...
}:
let
  users = [
    "alex"
  ];
in
{
  flake.homeConfigurations = builtins.listToAttrs (
    builtins.concatLists (
      map (
        user:
        map (system: {
          name = "${user}@${system}";
          value = withSystem system (
            { pkgs, ... }:
            inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit inputs pkgs;
                nixCats = inputs.nixCats;
                inherit (inputs.self) outputs;
              };
              modules = [
                { programs.home-manager.enable = true; }
                config.flake.modules.homeManager.${user}
                config.flake.modules.homeManager.dev-base
                config.flake.modules.homeManager.lean
                config.flake.modules.homeManager.nano
                config.flake.modules.homeManager.vim
              ];
            }
          );
        }) config.systems
      ) users
    )
  );
}
