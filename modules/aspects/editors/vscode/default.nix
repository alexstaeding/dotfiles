{ ... }:
{
  flake.modules.homeManager.vscode =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = false;
        profiles.default.extensions = with pkgs.vscode-extensions; [
          mkhl.direnv
          mechatroner.rainbow-csv
          ms-vscode.cpptools-extension-pack
          ms-vscode.cmake-tools
          tamasfe.even-better-toml
          rust-lang.rust-analyzer
          ms-kubernetes-tools.vscode-kubernetes-tools
          redhat.vscode-yaml
          ms-python.python
          leanprover.lean4
          mhutchie.git-graph
          haskell.haskell
          justusadam.language-haskell
          james-yu.latex-workshop
          jnoortheen.nix-ide
          myriad-dreamin.tinymist
          tomoki1207.pdf
          vscodevim.vim
          k--kato.intellij-idea-keybindings
          donjayamanne.githistory
          eamodio.gitlens
          codezombiech.gitignore
          foxundermoon.shell-format
        ] ++ (with pkgs; [
          # Not in nixpkgs
          vscode-gitstash
          vscode-dafny
          vscode-smt-z3
          vscode-material-theme
        ]);
      };
    };
}
