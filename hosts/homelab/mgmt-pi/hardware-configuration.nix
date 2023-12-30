{ pkgs, lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" ];
    };
    # kernelPackages = pkgs.pkgsCross.aarch64-multiplatform.linuxKernel.packages.linux_rpi4;
    kernelPackages =
      let
        crossPkgs = import pkgs.path {
          localSystem.system = "x86_64-linux";
          crossSystem.system = "aarch64-linux";
        };
      in
      crossPkgs.linuxKernel.packages.linux_rpi4;
    kernelParams = [
      "cgroup_enable=cpuset"
      "cgroup_memory=1"
      "cgroup_enable=memory"
    ];
    kernelPatches = [
      {
        name = "cilium-config";
        patch = null;
        # extraConfig = ''
        #   PGTABLE_LEVELS 4
        # '';
        extraStructuredConfig = with lib.kernel; {
          ARM64_VA_BITS_48 = yes; # Enable PGTABLE_LEVELS 4, makes envoy work :), see https://github.com/torvalds/linux/blob/master/arch/arm64/Kconfig#L369
        };
      }
    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform = "aarch64-linux";
}
