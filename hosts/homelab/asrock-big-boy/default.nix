{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.hardware.nixosModules.common-cpu-amd-pstate

    ./hardware-configuration.nix
    ./disko.nix
    ./atm10-server.nix

    ../../common/global
    ../../common/users/stinjul
    ../../common/users/deploy
    ../../common/features/persist.nix
    ../../common/features/podman.nix
  ];

  home-manager.users.stinjul = import ../../../home-manager/stinjul/headless-generic.nix;

  # sops.secrets.k3s-token-mgmt.sopsFile = ../secrets.yaml;

  networking = {
    useDHCP = false;
    hostName  = "asrock-big-boy";
    firewall = {
      enable = true;
      # allowedTCPPorts = [
      #   6443
      #   2379
      #   2380
      #   4240
      #   4244
      # ];
      # allowedUDPPorts = [
      #   8472
      # ];
    };
  };

  # systemd.tmpfiles.rules = [
  #   # "C /opt/cni/bin/host-device - - - - ${pkgs.cni-plugins}/bin/host-device"
  #   # "C /opt/cni/bin/host-local - - - - ${pkgs.cni-plugins}/bin/host-local"
  # ];

  systemd.network = {
    enable = true;
    networks = {
      "20-lan" = {
        matchConfig.Name = "enp38s0";
        networkConfig = {
          DHCP = "ipv4";
        };
        linkConfig.RequiredForOnline = "routable";
      };
    };
  };

  environment.persistence."/persist" = {
    # I've seen people put logrotate in this but it wants to rename this file while updating it
    # Which doesn't work when it's a bind mount it seems
    # Don't think it's that important anyway, logs get killed after each reboot
    # files = [ "/var/lib/logrotate.status" ];
    directories = [
    ];
  };

  console.keyMap = "azerty";

  system.stateVersion = "25.05";
}
