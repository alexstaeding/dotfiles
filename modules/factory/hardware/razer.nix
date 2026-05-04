{ ... }: {
  flake.factory.nixos.razer = users: { pkgs, ... }: {
    hardware.openrazer = {
      inherit users;
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      openrazer-daemon
      polychromatic
    ];
  };
}
