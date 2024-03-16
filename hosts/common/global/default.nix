{ config, inputs, outputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    ./fish.nix
    ./nix.nix
    ./openssh.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs outputs; };
  
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
