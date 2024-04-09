{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl

    ./hardware-configuration.nix

    ../common/global
    ../common/users/stinjul
    ../common/features/pipewire.nix
  ];

  home-manager.users.stinjul = import ../../home-manager/stinjul/wsl;

  wsl = {
    enable = true;
    #automountPath = "/mnt";
    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = false;
    };
    defaultUser = "stinjul";
    startMenuLaunchers = true;
  };

  console.keyMap = "azerty";

  programs = {
    dconf.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  system.stateVersion = "23.11";
}
