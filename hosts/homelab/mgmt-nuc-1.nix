{ pkgs, inputs, ... }: {
  imports = [
    ./mgmt-nuc
  ];

  services.k3s.clusterInit = true;
  networking = {
    hostName = "mgmt-nuc-1";
    interfaces.enp86s0.ipv4.addresses = [{
      address = "172.16.10.5";
      prefixLength = 24;
    }];
  };
}

