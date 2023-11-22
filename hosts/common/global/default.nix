{ config, inputs, outputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    ./fish.nix
    ./nix.nix
    ./openssh.nix
  ];
  
  sops = {
    defaultSopsFile = ../secrets.yaml;
    age.keyFile = "/var/lib/sops-nix/age-key.txt";
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
