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
    ../common/features/bluetooth.nix
  ];

  home-manager.users.stinjul = import ../../home-manager/stinjul/zennix;

  networking = {
    hostName = "zennix";
    useDHCP = true;
    firewall = {
      # 1714 -> 1764: KDEConnect
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
    };
  };

  console.keyMap = "azerty";

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_testing;
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  programs = {
    dconf.enable = true;
    yubikey-touch-detector.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  system.stateVersion = "23.11";
}
