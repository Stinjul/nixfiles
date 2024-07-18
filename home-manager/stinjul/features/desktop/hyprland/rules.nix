{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
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
        "special:scratchpad, gapsout:20, on-created-empty:${terminal} --class dropdown --session ~/.config/kitty/scratchpad.session --override background_opacity=1"
      ];
  };
}
