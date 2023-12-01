{ pkgs, inputs, ... }: {
  imports = [
    ./mgmt-pi
  ];


  services.k3s.serverAddr = "https://172.16.0.10:6443";
  networking.hostName = "mgmt-pi-3";
}

