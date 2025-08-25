{ pkgs, inputs, ... }:
let
  configtxt = pkgs.writeText "config.txt" ''
    [pi4]
    kernel=u-boot-rpi4.bin
    enable_gic=1
    armstub=armstub8-gic.bin

    # Otherwise the resolution will be weird in most cases, compared to
    # what the pi3 firmware does by default.
    disable_overscan=1

    # Supported in newer board revisions
    arm_boost=1

    [cm4]
    # Enable host mode on the 2711 built-in XHCI USB controller.
    # This line should be removed if the legacy DWC2 controller is required
    # (e.g. for USB device mode) or if USB support is not required.
    otg_mode=1

    [all]
    # Boot in 64-bit mode.
    arm_64bit=1

    # U-Boot needs this to work, regardless of whether UART is actually used or not.
    # Look in arch/arm/mach-bcm283x/Kconfig in the U-Boot tree to see if this is still
    # a requirement in the future.
    enable_uart=1

    # Prevent the firmware from smashing the framebuffer setup done by the mainline kernel
    # when attempting to show low-voltage or overtemperature warnings.
    avoid_warnings=1
  '';
in
{
  disko = {
    imageBuilder = {
      enableBinfmt = true;
      # inherit pkgs;
      # kernelPackages = pkgs.linuxPackages_latest;
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      kernelPackages = inputs.nixpkgs.legacyPackages.x86_64-linux.linuxPackages_latest;
    };
    devices = {
      disk = {
        sata = {
          imageSize = "128G";
          type = "disk";
          device = "platform-fd500000.pcie-pci-0000:01:00.0-usb-0:2:1.0-scsi-0:0:0:0";
          content = {
            type = "gpt";
            partitions = {
              ## BOOT = {
              ##   priority = 1;
              ##   size = "16G";
              ##   type = "EF00";
              ##   label = "BOOT";
              ##   content = {
              ##     type = "filesystem";
              ##     format = "vfat";
              ##     mountpoint = "/boot";
              ##   };
              ## };
              firmware = {
                size = "30M";
                priority = 1;
                type = "0700";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/firmware";
                  postMountHook = toString (
                    pkgs.writeScript "postMountHook.sh" ''
                      (cd ${pkgs.raspberrypifw}/share/raspberrypi/boot && cp bootcode.bin fixup*.dat start*.elf /mnt/firmware/)
                      cp ${pkgs.ubootRaspberryPi4_64bit}/u-boot.bin /mnt/firmware/u-boot-rpi4.bin
                      cp ${pkgs.raspberrypi-armstubs}/armstub8-gic.bin /mnt/firmware/armstub8-gic.bin
                      cp ${pkgs.raspberrypifw}/share/raspberrypi/boot/bcm2711-rpi-4-b.dtb /mnt/firmware/
                      cp ${configtxt} /mnt/firmware/config.txt
                    ''
                  );
                };
              };
              boot = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                };
              };
              lvm = {
                size = "100%";
                content = {
                  type = "lvm_pv";
                  vg = "boot";
                };
              };
            };
          };
        };
      };
      lvm_vg = {
        boot = {
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
              size = "64G";
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
  };
}
