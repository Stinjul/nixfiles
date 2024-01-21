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
    yubikey-touch-detector
    age
    sops

    argocd
    kustomize
    k9s
    ksops
    k3s
    terraform
  ];
}
