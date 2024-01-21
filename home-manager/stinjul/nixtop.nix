{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
    
    ./features/neovim
    ./features/desktop/hyprland
  ];

  home.packages = [
  ];
}
