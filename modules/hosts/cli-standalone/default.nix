{ inputs, config, ... }:
{
  flake.homeConfigurations = builtins.listToAttrs (
    map (system: {
      name = "alex@${system}";
      value = config.withSystem system ({ pkgs, ... }:
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs pkgs;
            nixCats = inputs.nixCats;
            inherit (inputs.self) outputs;
          };
          modules = [
            { programs.home-manager.enable = true; }
            config.flake.modules.homeManager.alex
            config.flake.modules.homeManager.nano
            config.flake.modules.homeManager.vim
          ];
        }
      );
    }) config.systems
  );
}
