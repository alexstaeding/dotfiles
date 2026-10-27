{inputs, ...}: {
  systems = [
    "aarch64-darwin"
    "aarch64-linux"
    "x86_64-linux"
  ];

  perSystem = {system, ...}: let
    overlay = import ../overlays {inherit inputs;};
    pkgs' = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "firefox-esr-140-bin-unwrapped-140.17.0esr"
        ];
      };
      overlays = [overlay];
    };
  in {
    _module.args.pkgs = pkgs';

    formatter = pkgs'.alejandra;
    packages = import ../pkgs {
      pkgs = pkgs';
      inherit inputs;
    };
  };
}
