{ config, inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ../global
    ../features/neovim

    ../features/desktop/common
    ../features/desktop/common/wayland

    ./git.nix
  ];

  home.packages = [
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  };

  programs = {
    ssh.enable = true;
  };
}
