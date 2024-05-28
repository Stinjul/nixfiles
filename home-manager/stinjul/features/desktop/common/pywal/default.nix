{ pkgs, config, lib, ... }:
let
  inherit (lib) mkIf;
in
{
  home.packages = [ pkgs.pywal ];

  xdg.configFile."wal/templates/" = {
    source = ./templates;
    recursive = true;
  };
  xdg.configFile."wal/colorschemes/" = {
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
  
  systemd.user.services.pywal = {
    Unit = {
      Description = "Run pywal";
    };
    Install = {
      WantedBy = [ "graphical-session-pre.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.pywal}/bin/wal --theme main -ste
      '';
    };
  };
}
