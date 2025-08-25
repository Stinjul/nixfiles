{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.hardware.nixosModules.raspberry-pi-4

    ./hardware-configuration.nix
    ./disko.nix

    ../../common/global
    ../../common/users/stinjul
    ../../common/users/deploy
    ../../common/features/persist.nix
  ];

  home-manager.users.stinjul = import ../../../home-manager/stinjul/headless-generic.nix;

  sops.secrets.k3s-token.sopsFile = ../secrets.yaml;
  # man-db is slow as fuck when "cross"-compiling via qemu binfmt, we don't need it on these machines anyway
  documentation.man.man-db.enable = false;

  networking = {
    useDHCP = false;
    interfaces.end0 = {
      useDHCP = true;
    };
    firewall = {
      # We switched to cilium Host FW
      enable = false;
      # cilium does not like this, disable it
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
    enable = false; # FIXME
    role = "server";
    tokenFile = config.sops.secrets.k3s-token.path;
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
      "--tls-san kube.k3s-prd.stinjul.com"
      "--node-name ${config.networking.hostName}"
    ];
    # serverAddr = "https://kube.k3s-prd.stinjul.com:6443";
  };

  console.keyMap = "azerty";

  system.stateVersion = "23.11";
}
