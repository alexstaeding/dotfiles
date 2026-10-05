{
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "slint";
    publisher = "Slint";
    version = "1.18.1";
    hash = "sha256-KTcPX95VObILTkrHCXh64JEvezfo/d7tbA4EEmpl9hA=";
  };

  meta = {
    description = "This extension for VS Code adds support for the Slint design markup language.";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=Slint.slint";
    homepage = "https://github.com/slint-ui/slint";
    license = lib.licenses.gpl3Only;
  };
}
