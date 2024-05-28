{ config, lib, inputs, outputs, ... }:
let
    hasPersistence = config.environment.persistence ? "/persist";
in {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    inputs.impermanence.nixosModules.impermanence
    ./fish.nix
    ./nix.nix
    ./openssh.nix
    ./locale.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  
  sops = {
    defaultSopsFile = ../secrets.yaml;
    age.keyFile = "${lib.optionalString hasPersistence "/persist"}/var/lib/sops-nix/age-key.txt";
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  hardware.enableRedistributableFirmware = true;
}
