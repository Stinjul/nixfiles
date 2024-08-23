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
    # device = "/dev/disk/by-uuid/32b70672-644c-4292-8781-e0d24bb482cb";
    device = "/dev/disk/by-uuid/a5983d64-30fe-4d37-918a-8bd9e7f5fe15";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/disk/by-uuid/a5983d64-30fe-4d37-918a-8bd9e7f5fe15 /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    # for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
    for i in $(find /btrfs_tmp/old_roots/ -mindepth 1 -maxdepth 1 | head -n -10); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

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
