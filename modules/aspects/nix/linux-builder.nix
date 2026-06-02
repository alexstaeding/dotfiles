{ ... }:
{
  flake.modules.darwin.nix = { pkgs, ... }: {
    nix.linux-builder = {
      enable = true;
      maxJobs = 4;
    };
  };
}
