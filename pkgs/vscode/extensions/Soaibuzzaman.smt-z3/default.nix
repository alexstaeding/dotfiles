{
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "smt-z3";
    publisher = "Soaibuzzaman";
    version = "4.16.0";
    hash = "sha256-iFTo7RHFpH+0Wiqtat7mlDS/1YDFQiyUccwDBsDKYZY=";
  };

  meta = {
    description = "Z3 Extension for Visual Studio Code";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=Soaibuzzaman.smt-z3";
    homepage = "https://github.com/soaibsafi/smt-z3-vscode";
    license = lib.licenses.mit;
  };
}
