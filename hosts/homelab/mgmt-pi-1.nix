{ pkgs, inputs, ... }: {
  imports = [
    ./mgmt-pi
  ];

  networking.hostName = "mgmt-pi-1";
}

