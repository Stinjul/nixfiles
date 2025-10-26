{ pkgs, inputs, ... }:
{
  imports = [
    ./prd-ms01
  ];

  services.k3s.serverAddr = "https://prd.k3s.stinjul.com:6443";
  networking.hostName = "prd-ms01-2";
}
