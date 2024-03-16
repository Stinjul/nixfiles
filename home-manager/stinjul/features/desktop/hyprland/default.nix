{ lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../common/wayland

    #./init.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.inputs.hyprland.hyprland;

    settings = {
      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 3;
        cursor_inactive_timeout = 4;
      };
      input = {
        kb_layout = "be,us";
        numlock_by_default = true;
        follow_mouse = 1;
      };
      dwindle.no_gaps_when_only = 1;
      decoration = {
        rounding = 15;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
        };
      };


      bind =
        let
          mainmod = "SUPER";
          terminal = config.home.sessionVariables.TERMINAL;
        in
        [
          "${mainmod},Return,exec,${terminal}"
        ];
    };
  };


  xdg.portal = {
    extraPortals = [ pkgs.inputs.hyprland.xdg-desktop-portal-hyprland ];
    configPackages = [ pkgs.inputs.hyprland.hyprland ];
  };

}
