{ ... }:
{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      programs = {
        zsh = {
          enable = true;
          oh-my-zsh.enable = true;
          autosuggestion.enable = true;
          enableCompletion = true;
          plugins = [
            {
              name = "powerlevel10k";
              src = pkgs.zsh-powerlevel10k;
              file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
          ];
          initContent = "source ~/.p10k.zsh";
          profileExtra = ''
            # Homebrew: sets PATH, MANPATH, etc.
            eval "$(/opt/homebrew/bin/brew shellenv)"

            # JetBrains Toolbox scripts
            export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

            if [[ -z "$LC_ALL" ]]; then
              export LC_ALL='en_US.UTF-8'
            fi
          '';
        };
        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };
      };
    };
}
