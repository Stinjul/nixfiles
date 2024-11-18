{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # "ags run"
    ];
  };
}
