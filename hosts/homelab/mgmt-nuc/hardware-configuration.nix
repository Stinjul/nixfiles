{ pkgs, lib, ... }:
{
  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "ahci"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
    };
    kernelModules = [
      "kvm-intel"
      "thunderbolt-net"
      "dm-snapshot"
      "drivetemp"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
      # These need to be increased for k8s
      # Although the default settings might not cause issues initially, you'll get strange behavior after a while
      "fs.inotify.max_user_instances" = 1048576;
      "fs.inotify.max_user_watches" = 1048576;
    };
  };

  fileSystems."/boot" = {
    # Disko uses GPT labels when setting "label", not filesystem labels
    device = "/dev/disk/by-partlabel/BOOT";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/" = {
    device = "/dev/ssd_boot/root";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/ssd_boot/root /btrfs_tmp
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

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
    # for i in $(find /btrfs_tmp/old_roots/ -mindepth 1 -maxdepth 1 | head -n -10); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  fileSystems."/nix" = {
    device = "/dev/ssd_boot/nix";
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/persist" = {
    device = "/dev/ssd_boot/persist";
    fsType = "btrfs";
    neededForBoot = true;
    options = [
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/k3s" = {
    device = "/dev/ssd_boot/k3s";
    fsType = "ext4";
    neededForBoot = true;
    options = [
      "discard"
    ];
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
