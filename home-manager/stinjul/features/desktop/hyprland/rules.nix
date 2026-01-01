{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # "border_size 0, match:float 0, match:workspace w[tv1]s[false]"
      # "rounding 0, match:float 0, match:workspace w[tv1]s[false]"
      "border_size 0, match:float 0, match:workspace f[1]s[false]"
      "rounding 0, match:float 0, match:workspace f[1]s[false]"
      "workspace 4,match:class firefox"
      "workspace 5,match:class (i?)libreoffice.*"
      "workspace 7,match:class ^steam_app_.*"
      "workspace 7,match:title .*(i?)wine.*"
      "workspace 8 silent,match:class ^[Ss]team$"
      "workspace 9 silent,match:class ^[Vv]esktop$"
      "workspace 9 silent,match:class ^[Dd]iscord$"
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
