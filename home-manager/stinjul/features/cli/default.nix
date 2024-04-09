{ pkgs, ... }: {
  imports = [
    ./fish.nix
    ./ranger.nix
  ];
  home.packages = with pkgs; [
    htop
    ncdu
    ranger
    sshfs

    unzip

    yubikey-personalization
    yubikey-manager
    yubikey-touch-detector
    age
    sops
    wireguard-tools

    argocd
    kustomize
    k9s
    ksops
    k3s
    terraform
  ];
}
