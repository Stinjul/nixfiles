{ pkgs, lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "ahci" "nvme" "usb_storage" "sd_mod" ];
    };
    kernelModules = [ "kvm-intel" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/boot" = {
    # Disko uses GPT labels when setting "label", not filesystem labels
    device = "/dev/disk/by-partlabel/BOOT";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };
  
  fileSystems."/" = {
    device = "/dev/ssd_boot/root";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };
  
  fileSystems."/nix" = {
    device = "/dev/ssd_boot/nix";
    fsType = "btrfs";
    options = [ "compress=zstd" "noatime" ];
  };
  
  fileSystems."/persist" = {
    device = "/dev/ssd_boot/persist";
    fsType = "btrfs";
    neededForBoot = true;
    options = [ "compress=zstd" "noatime" ];
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
