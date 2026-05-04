{ ... }:
{
  flake.modules.homeManager.java =
    { pkgs, ... }:
    {
      programs.java = {
        enable = true;
        package = pkgs.jdk25;
      };

      home = {
        shellAliases.idea = "idea-ultimate";
        packages = with pkgs; [
          gradle
          sbt
          scala-cli
          coursier

          scala
          kotlin

          metals
          jetbrains-toolbox
        ];
      };
    };

  flake.modules.nixos.java =
    { pkgs, ... }:
    {
      environment.etc = with pkgs; {
        "jdk17".source = jdk17;
        "jdk21".source = jdk;
        "jdk25".source = jdk25;
      };
    };
}
