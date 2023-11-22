{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4

    ./hardware-configuration.nix

    ../../common/global
    ../../common/users/stinjul
  ];

  networking = {
    useDHCP = true;
  };

  console.keyMap = "azerty";

  system.stateVersion = "23.11";
}
