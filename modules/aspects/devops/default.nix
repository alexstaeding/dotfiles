{ ... }:
{
  flake.modules.homeManager.devops =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        kubectl
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
