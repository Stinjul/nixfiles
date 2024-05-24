{ config, lib, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package  = pkgs.rofi-wayland;
    extraConfig = {
        run-command = "fish -c '{cmd}'";
        run-list-command = "fish -c functions";
    };
  };
}
