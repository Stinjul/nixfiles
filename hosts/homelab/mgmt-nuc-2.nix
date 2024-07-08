{ pkgs, inputs, ... }: {
  imports = [
    ./mgmt-nuc
  ];

  services.k3s.serverAddr = "https://172.16.10.5:6443";
  networking = {
    hostName = "mgmt-nuc-2";
    # interfaces.enp86s0.ipv4.addresses = [{
    #   address = "172.16.10.6";
    #   prefixLength = 24;
    # }];
  };
}

