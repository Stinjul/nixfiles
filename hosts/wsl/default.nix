{ inputs, lib, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl

    ./hardware-configuration.nix

    ../common/global
    ../common/users/stinjul
    ../common/features/pipewire.nix

    ./wireguard.nix
  ];

  # TODO: fix this ugly hack when https://github.com/nix-community/impermanence/pull/171 gets fixed
  environment.persistence = lib.mkForce { };

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

  services = {
    openssh = {
      ports = [ 2022 ];
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  system.stateVersion = "23.11";
}
