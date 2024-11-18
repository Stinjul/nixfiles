{ pkgs, lib, ... }:
{
  boot = {
    initrd = {
      includeDefaultModules = false;
      availableKernelModules = [ "xhci_pci" ];
    };
    kernelPackages =
      let
        crossPkgs = import pkgs.path {
          localSystem.system = "x86_64-linux";
          crossSystem.system = "aarch64-linux";
        };
      in
      pkgs.linuxPackagesFor (
        # The default kernel config for nixos is thicc AF, so let's turn it off since we need to build it ourselves for cilium 
        ## (and ceph/rook technically, but don't run that on a pi for the love of god)
        # We're talking about multiple hours vs 7 minutes on my AMD 3900X
        crossPkgs.linuxKernel.packages.linux_rpi4.kernel.override {
          # argsOverride seems to be the "normal way" of passing overrides to the kernel,
          ## but linux-rpi.nix also passes the normal args to the kernel anyway so ¯\_(ツ)_/¯
          # argsOverride = {
          autoModules = false;
          enableCommonConfig = false;
          # };
        }
      );
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
