{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace 4,class:firefox"
      "workspace 5,class:(i?)libreoffice.*"
      "workspace 7,class:^steam_app_.*"
      "workspace 7,title:.*(i?)wine.*"
      "workspace 8,class:^[Ss]team$"
      "workspace 9,class:^discord$"
    ];
  };
}
