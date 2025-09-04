{
  inputs,
  config,
  pkgs,
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
      enable = true; # TODO: wait for https://github.com/NixOS/nixpkgs/pull/327099
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

  # systemd.tmpfiles.rules = [
  #   # "C /opt/cni/bin/host-device - - - - ${pkgs.cni-plugins}/bin/host-device"
  #   # "C /opt/cni/bin/host-local - - - - ${pkgs.cni-plugins}/bin/host-local"
  # ];

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
    # I've seen people put logrotate in this but it wants to rename this file while updating it
    # Which doesn't work when it's a bind mount it seems
    # Don't think it's that important anyway, logs get killed after each reboot
    # files = [ "/var/lib/logrotate.status" ];
    directories = [
      "/etc/rancher"
      "/var/lib/rancher"
      "/var/lib/kubelet"
      "/var/lib/rook"
      "/var/lib/grafana-alloy"
      "/opt/cni"
      "/etc/cni"
    ];
  };

  environment.persistence."/k3s" = {
    directories = [
      "/var/lib/rancher/k3s/server/db"
    ];
  };

  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = config.sops.secrets.k3s-token-mgmt.path;
    # extraFlags = "--disable local-storage --disable metrics-server --disable traefik --disable servicelb --flannel-backend=none --disable-network-policy --disable-helm-controller --disable-kube-proxy --etcd-expose-metrics --tls-san kube.k3s-mgmt.stinjul.com --node-name ${config.networking.hostName}";
    extraFlags = lib.concatStringsSep " " [
      "--disable local-storage"
      "--disable metrics-server"
      "--disable traefik"
      "--disable servicelb"
      "--flannel-backend=none"
      "--disable-network-policy"
      "--disable-helm-controller"
      "--disable-kube-proxy"
      "--etcd-expose-metrics"
      "--tls-san mgmt.k3s.stinjul.com"
      "--node-name ${config.networking.hostName}"
    ];
    # serverAddr = "https://kube.k3s-mgmt.stinjul.com:6443";
    registries = {
      mirrors = {
        "docker.io".endpoint = [ "https://docker-registry.mgmt.stinjul.com" ];
        "registry.k8s.io".endpoint = [ "https://k8s-registry.mgmt.stinjul.com" ];
        "ghcr.io".endpoint = [ "https://github-registry.mgmt.stinjul.com" ];
        "quay.io".endpoint = [ "https://quay-registry.mgmt.stinjul.com" ];
        "xpkg.upbound.io".endpoint = [ "https://upbound-registry.mgmt.stinjul.com" ];
      };
    };
  };

  systemd.services.k3s.serviceConfig.CPUAffinity = "0-7";

  console.keyMap = "azerty";

  system.stateVersion = "23.11";
}
