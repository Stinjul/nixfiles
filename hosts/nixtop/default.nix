{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/features/pipewire.nix
  ];

  networking = {
    hostName = "nixtop";
    useDHCP = true;
    interfaces.enp4s0.useDHCP = true;
    interfaces.wlp5s0.useDHCP = true;
  };

  system.stateVersion = "23.11";
}
