{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.hardware.nixosModules.common-cpu-intel-cpu-only

    ./hardware-configuration.nix
    ./disko.nix

    ../../common/global
    ../../common/users/stinjul
    ../../common/users/deploy
    ../../common/features/persist.nix
  ];

  home-manager.users.stinjul = import ../../../home-manager/stinjul/headless-generic.nix;

  sops.secrets.k3s-token-mgmt.sopsFile = ../secrets.yaml;

  networking = {
    useDHCP = false;
    interfaces.enp86s0.useDHCP = true;
    # defaultGateway = {
    #   address = "172.16.10.1";
    #   interface = "enp86s0";
    # };
    # nameservers = [
    #   "172.16.10.1"
    # ];
    firewall = {
      # We switched to cilium Host FW
      enable = false;
      # # cilium does not like this, disable it
      # checkReversePath = false;
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

  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = config.sops.secrets.k3s-token-mgmt.path;
    extraFlags = "--disable local-storage --disable metrics-server --disable traefik --disable servicelb --flannel-backend=none --disable-network-policy --disable-helm-controller --disable-kube-proxy --tls-san kube.k3s-mgmt.stinjul.com --node-name ${config.networking.hostName}";
    # serverAddr = "https://kube.k3s-mgmt.stinjul.com:6443";
  };

  console.keyMap = "azerty";

  system.stateVersion = "23.11";
}
