{ pkgs, inputs, config, ... }: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4

    ./hardware-configuration.nix

    ../../common/global
    ../../common/users/stinjul
    ../../common/users/deploy
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
      checkReversePath = false;
      allowedTCPPorts = [
        6443
        2379
        2380
        4240
        4244
      ];
      allowedUDPPorts = [
        8472
      ];
    };
  };

  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = config.sops.secrets.k3s-token.path;
    extraFlags = "--disable local-storage --disable metrics-server --disable traefik --disable servicelb --flannel-backend=none --disable-network-policy --disable-helm-controller --disable-kube-proxy --tls-san kube.k3s-mgmt.stinjul.com --node-name ${config.networking.hostName}";
    # serverAddr = "https://kube.k3s-mgmt.stinjul.com:6443";
  };

  console.keyMap = "azerty";

  system.stateVersion = "23.11";
}
