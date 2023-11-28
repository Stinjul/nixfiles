{ config, inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ../global
    ../features/neovim

    ../features/desktop/common
    ../features/desktop/common/wayland

    ./git.nix
  ];

  home.packages = with pkgs; [
    vagrant-wsl
    chef-cli
    cookstyle
    knife
    berkshelf
    test-kitchen
    inspec-bin
    chef-vault
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  };

  programs = {
    ssh.enable = true;
  };
}
