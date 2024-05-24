{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/stinjul
    ../common/features/persist.nix
    ../common/features/pipewire.nix
    ../common/features/libvirtd.nix
    ../common/features/greetd.nix
  ];

  home-manager.users.stinjul = import ../../home-manager/stinjul/zennix;

  networking = {
    hostName = "zennix";
    useDHCP = true;
  };

  console.keyMap = "azerty";

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_testing;
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

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
