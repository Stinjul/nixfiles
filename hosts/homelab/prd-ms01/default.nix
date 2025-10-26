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
    "${inputs.hardware}/common/cpu/intel/alder-lake"

    ./hardware-configuration.nix
    ./disko.nix

    ../../common/global
    ../../common/users/stinjul
    ../../common/users/deploy
    ../../common/features/persist.nix
  ];

  home-manager.users.stinjul = import ../../../home-manager/stinjul/headless-generic.nix;

  sops.secrets.k3s-token-prd.sopsFile = ../secrets.yaml;

  networking = {
    useDHCP = false;
    firewall = {
      enable = false;
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
        matchConfig.Name = "enp87s0";
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
    tokenFile = config.sops.secrets.k3s-token-prd.path;
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
      "--tls-san prd.k3s.stinjul.com"
      "--node-name ${config.networking.hostName}"
    ];
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

  console.keyMap = "azerty";

  system.stateVersion = "25.05";
}
