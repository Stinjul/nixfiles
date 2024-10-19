{ inputs, config, lib, ... }: {
  nix = {
    settings = {
    extra-substituters = [ "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" ];
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
