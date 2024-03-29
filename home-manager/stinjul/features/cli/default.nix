{ pkgs, ... }: {
  imports = [
    ./fish.nix
    ./ranger.nix
  ];
  home.packages = with pkgs; [
    htop
    ncdu
    ranger

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
