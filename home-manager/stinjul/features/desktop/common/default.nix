{ pkgs, ... }: {
  imports = [
    ./font.nix
    ./gtk.nix
    ./qt.nix
    ./pywal
  ];
  home.packages = with pkgs; [
    yubikey-manager-qt
    yubikey-personalization-gui
  ];
  xdg.portal.enable = true;
}
