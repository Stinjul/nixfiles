{ pkgs, inputs, ... }: {
  imports = [
    ./mgmt-pi
  ];


  services.k3s.clusterInit = true;
  networking.hostName = "mgmt-pi-1";
}

