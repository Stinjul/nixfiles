{
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" ];
    };
  };
  
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform = "aarch64-linux";
}
