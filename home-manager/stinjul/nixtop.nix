{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop/hyprland
  ];

  home.packages = [
  ];
}
