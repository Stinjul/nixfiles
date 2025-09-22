{ config, lib, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    extraConfig = {
        run-command = "fish -c '{cmd}'";
        run-list-command = "fish -c functions";
    };
  };
}
