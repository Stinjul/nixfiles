{ inputs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = ../features/desktop/common/wayland/ags/config;
  };
}
