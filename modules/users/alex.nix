{ inputs, config, ... }:
let
  hm = config.flake.modules.homeManager;
in
{
  flake.modules.nixos.alex =
    { pkgs, ... }:
    {
      users = {
        defaultUserShell = pkgs.zsh;
        users.alex = {
          shell = pkgs.zsh;
          home = "/home/alex";
          isNormalUser = true;
          extraGroups = [ "wheel" ];
        };
      };
      programs.zsh.enable = true;
    };

  flake.modules.darwin.alex =
    { pkgs, ... }:
    {
      users.users.alex = {
        shell = pkgs.zsh;
        home = "/Users/alex";
      };
      programs.zsh.enable = true;
    };

  flake.modules.homeManager.alex =
    { pkgs, ... }:
    {
      imports = with hm; [
        shell
        vscode
        nano
        vim
        development
        java
        radicle
        devops
        crypto
        cli
        apps
      ];

      home.username = "alex";
      home.stateVersion = "24.11";
      home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/alex" else "/home/alex";
    };
}
