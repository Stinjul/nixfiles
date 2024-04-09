{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/stinjul
    ../common/users/deploy
    ../common/features/pipewire.nix
    ../common/features/libvirtd.nix
    ../common/features/greetd.nix
  ];
  
  home-manager.users.stinjul = import ../../home-manager/stinjul/nixtop.nix;

  networking = {
    hostName = "nixtop";
    useDHCP = true;
    interfaces.enp4s0.useDHCP = true;
    interfaces.wlp5s0.useDHCP = true;
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

  hardware = {
    nvidia = {
      prime = {
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  system.stateVersion = "23.11";
}
