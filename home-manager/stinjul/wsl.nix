{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/neovim
  ];

  home.packages = [
  ];
}
