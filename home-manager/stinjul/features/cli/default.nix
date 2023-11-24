{ pkgs, ... }: {
  imports = [
    ./fish.nix
  ];
  home.packages = with pkgs; [
    htop
    ncdu

    unzip

    yubikey-personalization
    yubikey-manager
    age
    sops

    argocd
    kustomize
    ksops
    k3s
    terraform
  ];
}
