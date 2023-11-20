{ inputs, outputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
    ./fish.nix
    ./nix.nix
    ./openssh.nix
  ];
  
  sops = {
    defaultSopsFile = ../secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
