{ pkgs, inputs }:
{
  vscode-gitstash = pkgs.callPackage ./vscode/extensions/arturock.gitstash { };
  vscode-dafny = pkgs.callPackage ./vscode/extensions/dafny-lang.ide-vscode { };
  vscode-smt-z3 = pkgs.callPackage ./vscode/extensions/Soaibuzzaman.smt-z3 { };
  vscode-material-theme = pkgs.callPackage ./vscode/extensions/t3dotgg.vsc-material-theme-but-i-wont-sue-you { };
}
