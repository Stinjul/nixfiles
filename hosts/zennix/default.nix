{ pkgs, inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ../common/global
    ../common/users/stinjul
    ../common/features/persist.nix
    ../common/features/pipewire.nix
    ../common/features/libvirtd.nix
    ../common/features/greetd.nix
    ../common/features/bluetooth.nix
    ../common/features/polkit.nix
    ../common/features/mullvad.nix
    ../common/features/podman.nix
    ../common/features/adb.nix

    ./hardware-configuration.nix
    ./wireguard.nix
    ./dns.nix
    ./monitors.nix
  ];

  home-manager = {
    backupFileExtension = "backup";
    users.stinjul = import ../../home-manager/stinjul/zennix;
  };

  networking = {
    hostName = "zennix";
    useDHCP = true;
    firewall = {
      # 1714 -> 1764: KDEConnect
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };

  console.keyMap = "azerty";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  environment.systemPackages = with pkgs; [ eid-mw ];

  programs = {
    dconf.enable = true;
    partition-manager.enable = true;
    nix-ld.enable = true;
    wireshark.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
    gamemode.enable = true;
    ydotool.enable = true;
  };

  services = {
    pcscd = {
      enable = true;
      plugins = [ pkgs.libacr38u ];
    };
    gvfs.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  system.stateVersion = "23.11";
}
