{ config, lib, pkgs, ... }: {
  programs.wofi = {
    enable = true;
    package = pkgs.rofi-wayland-unwrapped;
  };
}
