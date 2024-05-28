{ pkgs, ... }: {
  imports = [
    ./font.nix
    ./gtk.nix
    ./qt.nix
    ./pywal
    ./firefox.nix
    ./discord.nix
    ./kdeconnect.nix
    ./polkit-agent.nix
    ./steam.nix
    ./xivlauncher.nix
    ./remmina.nix
  ];
  home.packages = with pkgs; [
    yubikey-manager-qt
    yubikey-personalization-gui

    coppwr
    pavucontrol
  ];
  xdg.portal.enable = true;
}
