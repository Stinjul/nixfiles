{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind =
      let
        mainMod = "SUPER";
        terminal = config.home.sessionVariables.TERMINAL;
        menu = "rofi";
        left = "h";
        down = "j";
        up = "k";
        right = "l";
      in
      [
        "${mainMod}, Return, exec, ${terminal}"
        "${mainMod} + SHIFT, Return, togglespecialworkspace, scratchpad"

        "${mainMod} + SHIFT, q, killactive,"

        "${mainMod}, d, exec, ${menu} -show run"
        "${mainMod}, tab, exec, ${menu} -show window"

        "${mainMod} + SHIFT, e, exit,"

        "${mainMod}, n, exec, dunstctl close"
        "${mainMod} + SHIFT, n, exec, dunstctl close-all"
        "CONTROL, tab, exec, dunstctl context"
        "CONTROL + SHIFT, Tab, exec, dunstctl history-pop"

        "${mainMod} + SHIFT, s, exec, grimblast copy active"
        "${mainMod} + CONTROL, s, exec, grimblast copy area"

        "${mainMod}, KP_Add, exec, ~/scripts/rofi/playerctl_selector.sh -c 'volume 0.05+'"
        "${mainMod}, XF86AudioRaiseVolume , exec, ~/scripts/rofi/playerctl_selector.sh -c 'volume 0.05+'"

        "${mainMod}, KP_Subtract, exec, ~/scripts/rofi/playerctl_selector.sh -c 'volume 0.05-'"
        "${mainMod}, XF86AudioLowerVolume , exec, ~/scripts/rofi/playerctl_selector.sh -c 'volume 0.05-'"

        "${mainMod}, KP_Divide, exec, ~/scripts/rofi/playerctl_selector.sh -r"
        "${mainMod}, KP_Multiply, exec, ~/scripts/rofi/playerctl_selector.sh"

        ",XF86AudioPlay, exec, mpc play"
        ",XF86AudioPause, exec, mpc pause"
        ",XF86AudioStop, exec, mpc stop"
        ",XF86AudioNext, exec, mpc next"
        ",XF86AudioPrev, exec, mpc prev"

        "${mainMod}, ${left}, movefocus, l"
        "${mainMod}, ${up}, movefocus, u"
        "${mainMod}, ${down}, movefocus, d"
        "${mainMod}, ${right}, movefocus, r"

        "${mainMod}, left, movefocus, l"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"
        "${mainMod}, right, movefocus, r"

        "${mainMod} + SHIFT, ${left}, movewindow, l"
        "${mainMod} + SHIFT, ${up}, movewindow, u"
        "${mainMod} + SHIFT, ${down}, movewindow, d"
        "${mainMod} + SHIFT, ${right}, movewindow, r"

        "${mainMod} + SHIFT, Left, movewindow, l"
        "${mainMod} + SHIFT, Up, movewindow, u"
        "${mainMod} + SHIFT, Down, movewindow, d"
        "${mainMod} + SHIFT, Right, movewindow, r"

        "${mainMod} + CONTROL, ${left}, movecurrentworkspacetomonitor, l"
        "${mainMod} + CONTROL, ${up}, movecurrentworkspacetomonitor, u"
        "${mainMod} + CONTROL, ${down}, movecurrentworkspacetomonitor, d"
        "${mainMod} + CONTROL, ${right}, movecurrentworkspacetomonitor, r"

        "${mainMod} + CONTROL, Left, movecurrentworkspacetomonitor, l"
        "${mainMod} + CONTROL, Up, movecurrentworkspacetomonitor, u"
        "${mainMod} + CONTROL, Down, movecurrentworkspacetomonitor, d"
        "${mainMod} + CONTROL, Right, movecurrentworkspacetomonitor, r"

        "${mainMod}, ampersand, workspace, 1"
        "${mainMod}, eacute, workspace, 2"
        "${mainMod}, quotedbl, workspace, 3"
        "${mainMod}, apostrophe, workspace, 4"
        "${mainMod}, parenleft, workspace, 5"
        "${mainMod}, section, workspace, 6"
        "${mainMod}, egrave, workspace, 7"
        "${mainMod}, exclam, workspace, 8"
        "${mainMod}, ccedilla, workspace, 9"
        "${mainMod}, agrave, workspace, 10"

        "${mainMod} + SHIFT, ampersand, movetoworkspace, 1"
        "${mainMod} + SHIFT, eacute, movetoworkspace, 2"
        "${mainMod} + SHIFT, quotedbl, movetoworkspace, 3"
        "${mainMod} + SHIFT, apostrophe, movetoworkspace, 4"
        "${mainMod} + SHIFT, parenleft, movetoworkspace, 5"
        "${mainMod} + SHIFT, section, movetoworkspace, 6"
        "${mainMod} + SHIFT, egrave, movetoworkspace, 7"
        "${mainMod} + SHIFT, exclam, movetoworkspace, 8"
        "${mainMod} + SHIFT, ccedilla, movetoworkspace, 9"
        "${mainMod} + SHIFT, agrave, movetoworkspace, 10"

        "${mainMod}, f, fullscreen, 0"
        "${mainMod} + SHIFT, space, togglefloating, active"
      ];
  };
}
