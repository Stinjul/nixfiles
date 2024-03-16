{ pkgs, config, ... }:
let
  configFolder = "${config.xdg.configHome}/wal";
in
{
  home.packages = [ pkgs.pywal ];

  home.file."${configFolder}/templates/" = {
    source = ./templates;
    recursive = true;
  };
  home.file."${configFolder}/colorschemes/" = {
    source = ./colorschemes;
    recursive = true;
  };

  programs.kitty.extraConfig = ''
    include ${config.xdg.cacheHome}/wal/colors-kitty.conf
  '';

  wayland.windowManager.hyprland.extraConfig = ''
    source=${config.xdg.cacheHome}/wal/hyprland_colors.conf
  '';
}
