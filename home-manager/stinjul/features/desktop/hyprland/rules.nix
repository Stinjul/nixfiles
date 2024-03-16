{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "windowrulev2 = workspace 4,class:firefox"
      "windowrulev2 = workspace 5,class:(i?)libreoffice.*"
      "windowrulev2 = workspace 7,class:^steam_app_.*"
      "windowrulev2 = workspace 7,title:.*(i?)wine.*"
      "windowrulev2 = workspace 8,class:^[Ss]team$"
      "windowrulev2 = workspace 9,class:^discord$"
    ];
  };
}
