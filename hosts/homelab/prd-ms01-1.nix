{ pkgs, inputs, ... }:
{
  imports = [
    ./prd-ms01
  ];

  services.k3s.clusterInit = true;
  networking.hostName = "prd-ms01-1";
}
