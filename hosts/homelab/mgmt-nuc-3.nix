{ pkgs, inputs, ... }:
{
  imports = [
    ./mgmt-nuc
  ];

  services.k3s.serverAddr = "https://172.16.10.5:6443";
  networking = {
    hostName = "mgmt-nuc-3";
    thunderboltFabric = {
      loopbackAddress = {
        ipv4 = "172.16.255.3/32";# TODO: move and extend range
        ipv6 = "fdb4:5edb:1b00::3/128";
      };
      nsap = "49.0000.0000.0003.00";
    };
  };
}
