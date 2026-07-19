{ ... }:
{
  flake.modules.homeManager.devops =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        k9s
        kubernetes-helm
        clusterctl
        fluxcd
        talosctl
        minikube
        lens
        podman
        age
        sops
      ];
    };
}
