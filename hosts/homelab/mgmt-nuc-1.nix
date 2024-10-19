{ pkgs, inputs, ... }:
{
  imports = [
    ./mgmt-nuc
  ];

  services.k3s.clusterInit = true;
  networking = {
    hostName = "mgmt-nuc-1";
    thunderboltFabric = {
      loopbackAddress = {
        ipv4 = "172.16.255.1/32"; #TODO: extend range
        ipv6 = "fdb4:5edb:1b00::1/128";
      };
      nsap = "49.0000.0000.0001.00";
    };
  };
}
