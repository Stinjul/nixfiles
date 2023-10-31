{ pkgs, ... }: {
  imports = [
    ./fish.nix
  ];
  home.packages = with pkgs; [
    unzip

    yubikey-personalization
    yubikey-manager
    age
    sops
    argocd
    kustomize
    ksops
  ];
}
