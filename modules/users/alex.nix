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
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPQFj/m1DSh1SJ5BeVxqWqwgNWWoN9UOINQK3AGeQuAK alex@macbookpro"
          ];
          initialPassword = "password";
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
        crypto
        cli
        ssh
      ];

      home.username = "alex";
      home.stateVersion = "24.11";
      home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/alex" else "/home/alex";
    };
}
