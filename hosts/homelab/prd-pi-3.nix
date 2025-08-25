{ pkgs, inputs, ... }:
{
  imports = [
    ./prd-pi
  ];

  # FIXME
  # services.k3s.serverAddr = "https://172.16.0.10:6443";
  networking.hostName = "prd-pi-3";
}
