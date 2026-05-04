{ ... }:
{
  flake.modules.homeManager.nano = {
    programs.nano = {
      enable = true;
      nanorc = ''
        set tabsize 2
        set tabstospaces
      '';
    };
  };
}
