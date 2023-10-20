{ pkgs, ... }: {
    imports = [
        ./fish.nix
    ];
    home.packages = with pkgs; [
        yubikey-personalization
        yubikey-manager
        age
        sops
        ksops
    ];
}
