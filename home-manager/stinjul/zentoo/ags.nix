{ inputs, pkgs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];
  
  home.packages = with pkgs; [
    bun
    dart-sass
    fd
  ];

  programs.ags = {
    enable = true;
    configDir = ../features/desktop/common/wayland/ags/config;
  };
}
