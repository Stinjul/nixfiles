{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/neovim
    
    ./features/desktop/common
    ./features/desktop/common/wayland
  ];

  home.packages = [
  ];
}
