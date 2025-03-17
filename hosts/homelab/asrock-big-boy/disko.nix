{
  disko.devices = {
    disk = {
      nvme1 = {
        type = "disk";
        device = "/dev/disk/by-path/pci-0000:01:00.0-nvme-1";
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
      nvme2 = {
        type = "disk";
        device = "/dev/disk/by-path/pci-0000:23:00.0-nvme-1";
        content = {
          type = "gpt";
          partitions = {
            lvm = {
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "ssd_storage";
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
      ssd_storage = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%FREE";
            content = {
              type = "btrfs";
              mountpoint = "/mnt/storage";
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
