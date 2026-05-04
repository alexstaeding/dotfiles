{
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "vsc-material-theme-but-i-wont-sue-you";
    publisher = "t3dotgg";
    version = "35.0.3";
    hash = "sha256-RTYB1xQF7qQCc7znUrUB4PkKlXF1yvgrECrZbNV7JEA=";
  };

  meta = {
    description = "A Apache-2 licensed fork of Material Theme with no threats of legal action";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=t3dotgg.vsc-material-theme-but-i-wont-sue-you";
    homepage = "https://github.com/t3dotgg/vsc-material-but-i-wont-sue-you";
    license = lib.licenses.asl20;
  };
}
