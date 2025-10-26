{
  disko.devices = {
    disk = {
      sata = {
        type = "disk";
        device = "/dev/disk/by-path/pci-0000:58:00.0-nvme-1";
        content = {
          type = "gpt";
          partitions = {
            BOOT = {
              priority = 1;
              size = "16G";
              type = "EF00";
              label = "BOOT";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "fmask=0022"
                  "dmask=0022"
                ];
              };
            };
            lvm = {
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "ssd_boot";
              };
            };
          };
        };
      };
    };
    lvm_vg = {
      ssd_boot = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "16G";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # Override existing partition
              subvolumes = {
                "/root" = {
                  mountpoint = "/";
                };
              };
            };
          };
          nix = {
            size = "128G";
            content = {
              type = "btrfs";
              mountpoint = "/nix";
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
            };
          };
          k3s = {
            size = "16G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/k3s";
              mountOptions = [ "discard" ];
            };
          };
          persist = {
            size = "100%FREE";
            content = {
              type = "btrfs";
              mountpoint = "/persist";
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
            };
          };
        };
      };
    };
  };
}
