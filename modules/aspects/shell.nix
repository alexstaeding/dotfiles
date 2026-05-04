{ ... }: {
  flake.modules.homeManager.shell = { pkgs, ... }: {
    programs = {
      zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        plugins = [{
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }];
        initContent = "source ~/.p10k.zsh";
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
