{ pkgs, config, ... }:
let
  cursor = "Bibata-Modern-Classic-Hyprcursor";
  cursorPackage = pkgs.bibata-hyprcursor;
in
{
  imports = [
    ../common
    ../common/wayland

    #./init.nix
    ./binds.nix
    ./rules.nix
    ./execs.nix
  ];

  # Yeah, I know, but I need to set the primary monitor for XWayland somehow
  home.packages = with pkgs; [
    xorg.xrandr
    grimblast
  ];

  # Yeah, hyprland has state now
  # I'll just add the folder in case more stuff shows up
  home.persistence = {
    "/persist${config.home.homeDirectory}".directories = [ ".local/share/hyprland" ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # package = pkgs.inputs.hyprland.hyprland;

    sourceFirst = true;

    settings = {
      env = [
        "HYPRCURSOR_THEME,${cursor}"
        "HYPRCURSOR_SIZE,${toString config.home.pointerCursor.size}"
      ];
      exec-once = [ "hyprctl setcursor ${cursor} ${toString config.home.pointerCursor.size}" ];

      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 3;
        #cursor_inactive_timeout = 4;
      };
      input = {
        kb_layout = "be,us";
        numlock_by_default = true;
        follow_mouse = 1;
      };
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
    };
  };

  xdg.dataFile."icons/${cursor}".source = "${cursorPackage}/share/icons/${cursor}";

  xdg.portal = {
    # extraPortals = [ pkgs.inputs.hyprland.xdg-desktop-portal-hyprland ];
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    # configPackages = [ pkgs.inputs.hyprland.hyprland ];
    configPackages = [ pkgs.hyprland ];
  };

}
