{ lib, ... }:
{

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
      kernelModules = [ "dm-snapshot" ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/32b70672-644c-4292-8781-e0d24bb482cb";
    fsType = "btrfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F2BF-33D5";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/7f752fae-5e26-4387-a4a3-d97d0b7eb101";
    options = [
      "noatime"
      "compress=zstd"
    ];
    fsType = "btrfs";
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/a49a8668-5246-4766-95e9-5a8099fa2a79";
    neededForBoot = true;
    fsType = "ext4";
  };

  fileSystems."/mnt/steam_library" = {
    device = "/dev/disk/by-uuid/52576efe-a2e2-42d0-a828-3d4f9166f2fb";
    fsType = "xfs";
  };
  
  fileSystems."/mnt/hdd_steam_library" = {
    device = "/dev/disk/by-uuid/22c7fd3f-3d57-4857-9eba-25f84e2eff83";
    options = [
      "noatime"
      "compress=zstd"
    ];
    fsType = "btrfs";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
