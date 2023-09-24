{ inputs, outputs, ... }: {
  imports = [
    ./fish.nix
    ./nix.nix
    ./openssh.nix
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
