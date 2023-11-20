{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4

    ./hardware-configuration.nix

    ../../common/global
    ../../common/users/stinjul
  ];

  networking = {
    hostName = "mgmt-pi-1";
    useDHCP = true;
  };

  console.keyMap = "azerty";

  system.stateVersion = "23.11";
}
