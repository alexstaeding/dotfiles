{...}: {
  flake.modules.homeManager.tex = {pkgs, ...}: {
    home = {
      packages = with pkgs; [
        texliveFull
        python311Packages.pygments
      ];
    };
  };
}
