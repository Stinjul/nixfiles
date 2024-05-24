{ pkgs, ... }: {
  imports = [
    ./fish.nix
    ./ranger.nix
    ./htop.nix
    ./ssh.nix
  ];
  home.packages = with pkgs; [
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
