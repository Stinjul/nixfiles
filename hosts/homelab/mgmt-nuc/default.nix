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
    thunderboltFabric = {
      enable = true; #TODO: wait for https://github.com/NixOS/nixpkgs/pull/327099
      interfaces = [
        config.systemd.network.links."20-thunderbolt-port-1".linkConfig.Name
        config.systemd.network.links."20-thunderbolt-port-2".linkConfig.Name
      ];
    };
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

  systemd.network = {
    enable = true;
    links = {
      "20-thunderbolt-port-1" = {
        matchConfig = {
          Path = "pci-0000:00:0d.3";
          Driver = "thunderbolt-net";
        };
        linkConfig = {
          Name = "enp0s13f3";
          Alias = "tb1";
          AlternativeName = "tb1";
        };
      };
      "20-thunderbolt-port-2" = {
        matchConfig = {
          Path = "pci-0000:00:0d.2";
          Driver = "thunderbolt-net";
        };
        linkConfig = {
          Name = "enp0s13f2";
          Alias = "tb2";
          AlternativeName = "tb2";
        };
      };
    };
    networks = {
      "20-lan" = {
        matchConfig.Name = "enp86s0";
        networkConfig = {
          DHCP = "ipv4";
        };
        linkConfig.RequiredForOnline = "routable";
      };
    };
  };

  environment.persistence."/persist" = {
    files = [ "/var/lib/logrotate.status" ];
    directories = [
      "/etc/rancher"
      "/var/lib/rancher"
      "/var/lib/kubelet"
      "/opt/cni"
      "/etc/cni"
    ];
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
