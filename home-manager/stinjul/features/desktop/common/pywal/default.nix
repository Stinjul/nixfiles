{ pkgs, config, lib, ... }:
let
  inherit (lib) mkIf;
  configFolder = "${config.xdg.configHome}/wal";
in
{
  home.packages = [ pkgs.pywal ];

  xdg.configFile."templates/" = {
    source = ./templates;
    recursive = true;
  };
  xdg.configFile."colorschemes/" = {
    source = ./colorschemes;
    recursive = true;
  };

  programs.kitty.extraConfig = mkIf config.programs.kitty.enable ''
    include ${config.xdg.cacheHome}/wal/colors-kitty.conf
  '';

  wayland.windowManager.hyprland.extraConfig = mkIf config.wayland.windowManager.hyprland.enable  ''
    source=${config.xdg.cacheHome}/wal/hyprland_colors.conf
  '';

  programs.rofi.theme = "${config.xdg.cacheHome}/wal/colors-rofi-dark.rasi";
}
