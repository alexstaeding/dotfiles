{
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "ide-vscode";
    publisher = "dafny-lang";
    version = "3.5.4";
    hash = "sha256-4SgWKpCkcLDgYFDzEkYzUcUEdW/8yKHL5y+h+wi6KQc=";
  };

  meta = {
    description = "A Apache-2 licensed fork of Material Theme with no threats of legal action";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=dafny-lang.ide-vscode";
    homepage = "https://github.com/dafny-lang/ide-vscode";
    license = lib.licenses.mit;
  };
}
