{ pkgs, inputs, ... }:
{
  imports = [
    ./prd-pi
  ];

  services.k3s.clusterInit = true;
  networking.hostName = "prd-pi-1";
}
