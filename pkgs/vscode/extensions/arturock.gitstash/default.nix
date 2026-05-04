{
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "gitstash";
    publisher = "arturock";
    version = "6.13.0";
    hash = "sha256-5hwfn9HldBo0WfymMKKrVhh6mKHzxjNAR90+VnLbiyw=";
  };

  meta = {
    description = "Give extra stash abilities to Code. Visually browse stashes, review and extract changes. Get all stash commands and more.";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=arturock.gitstash";
    homepage = "https://github.com/artrz/vscode-gitstash";
    license = lib.licenses.mit;
  };
}
