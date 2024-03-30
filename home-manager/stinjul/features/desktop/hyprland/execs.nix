{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags -b hypr"
    ];
  };
}
