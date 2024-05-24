{ inputs, outputs, pkgs, lib, ... }: {
  imports = [
    ./global
  ];
  
  # TODO: fix this ugly hack when https://github.com/nix-community/impermanence/pull/171 gets fixed
  home.persistence = lib.mkForce {};
}
