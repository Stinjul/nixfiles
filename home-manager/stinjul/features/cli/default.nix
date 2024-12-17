{ pkgs, ... }: {
  imports = [
    ./fish.nix
    ./starship.nix
    ./ranger.nix
    ./htop.nix
    ./ssh.nix
    ./k8s.nix
    ./direnv.nix
  ];
  home.packages = with pkgs; [
    ncdu
    ranger
    sshfs
    bind

    unzip

    yubikey-personalization
    yubikey-manager
    yubikey-touch-detector
    age
    sops
    wireguard-tools
  ];
}
