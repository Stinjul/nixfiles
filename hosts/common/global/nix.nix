{ inputs, config, lib, ... }: {
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
      system-features = [ "kvm" "big-parallel" "nixos-test" ];
      flake-registry = ""; # Disable global flake registry
      max-jobs = "auto";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      # Keep the last 3 generations
      options = "--delete-older-than +3";
    };
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
  };
  systemd.services.nix-gc.script = lib.mkForce ''
    ${config.nix.package.out}/bin/nix-env --delete-generations +5
    ${config.nix.package.out}/bin/nix-collect-garbage
    ${config.nix.package.out}/bin/nix-store --optimise
  '';
}
