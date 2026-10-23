{...}: {
  flake.modules.homeManager.dev-base = {pkgs, ...}: {
    home = {
      packages = with pkgs; [
        nixd
        nixfmt
        shfmt
        rustup
        nodejs
        pnpm
        nerd-fonts.jetbrains-mono
        font-awesome
        fira-sans
      ];
    };
  };
}
