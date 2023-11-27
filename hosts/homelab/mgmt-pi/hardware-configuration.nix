{
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" ];
    };
    kernelParams = [
      "cgroup_enable=cpuset"
      "cgroup_memory=1"
      "cgroup_enable=memory"
    ];
#    kernelPatches = [
#      {
#        name = "cilium-config";
#        patch = null;
#        extraConfig = ''
#          SCHEDSTATS y
#        '';
#      }
#    ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform = "aarch64-linux";
}
