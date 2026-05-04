{ inputs, ... }:
{
  systems = [
    "aarch64-darwin"
    "aarch64-linux"
    "x86_64-linux"
  ];

  perSystem =
    { system, ... }:
    let
      overlay = import ../overlays { inherit inputs; };
      pkgs' = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ overlay ];
      };
    in
    {
      _module.args.pkgs = pkgs';

      formatter = pkgs'.alejandra;
      packages = import ../pkgs {
        pkgs = pkgs';
        inherit inputs;
      };
    };
}
