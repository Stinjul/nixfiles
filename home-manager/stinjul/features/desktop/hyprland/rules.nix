{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # "bordersize 0, floating:0, onworkspace:w[tv1] s[false]"
      # "rounding 0, floating:0, onworkspace:w[tv1] s[false]"
      "bordersize 0, floating:0, onworkspace:f[1] s[false]"
      "rounding 0, floating:0, onworkspace:f[1] s[false]"
      "workspace 4,class:firefox"
      "workspace 5,class:(i?)libreoffice.*"
      "workspace 7,class:^steam_app_.*"
      "workspace 7,title:.*(i?)wine.*"
      "workspace 8 silent,class:^[Ss]team$"
      "workspace 9,class:^[Vv]esktop$"
      "workspace 9,class:^[Dd]iscord$"
    ];
    workspace =
      let
        terminal = config.home.sessionVariables.TERMINAL;
      in
      [
        # "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
        "special:scratchpad, gapsout:20, on-created-empty:${terminal} --class dropdown --session ~/.config/kitty/scratchpad.session --instance-group scratchpad --override background_opacity=1"
      ];
  };
}
