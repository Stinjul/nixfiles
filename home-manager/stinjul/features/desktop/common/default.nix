{ pkgs, ... }:
{
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
    ./mpv.nix
    ./prismlauncher.nix
    ./r2modman.nix
    ./dconf.nix
  ];
  home.packages = with pkgs; [
    yubikey-manager-qt
    yubikey-personalization-gui

    coppwr
    pavucontrol

    yt-dlp
    ffmpeg-full
  ];
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "gtk";
    };
    mimeApps.enable = true;
  };
}
