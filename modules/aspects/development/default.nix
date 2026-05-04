{ ... }:
{
  flake.modules.homeManager.development =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          nixd
          nixfmt

          nerd-fonts.jetbrains-mono
          font-awesome

          kitty

          clang-tools
          cmake
          gnumake

          # cargo
          # rustc

          # (haskell.packages.ghc9122.ghcWithPackages (
          #   hpkgs: with hpkgs; [
          #     lens
          #     haskell-language-server
          #     cabal-install
          #     stylish-haskell
          #   ]
          # ))

          # lean4
          # dafny
          # z3

          typst
          typstyle
          algotex

          go-task
          python311Packages.pygments
        ];
      };
    };
}
