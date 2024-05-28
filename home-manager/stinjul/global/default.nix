{ inputs, outputs, pkgs, lib, config, ... }:
let
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/systemd-lib.nix#L54
  shellEscape = s: (lib.replaceStrings [ "\\" ] [ "\\\\" ] s);
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/lib/systemd-lib.nix#L338
  makeJobScript = name: text:
    let
      scriptName = lib.replaceStrings [ "\\" "@" ] [ "-" "_" ] (shellEscape name);
      out = (pkgs.writeShellScriptBin scriptName ''
        set -e
        ${text}
      '').overrideAttrs (_: {
        # The derivation name is different from the script file name
        # to keep the script file name short to avoid cluttering logs.
        name = "unit-script-${scriptName}";
      });
    in "${out}/bin/${scriptName}";

in {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../features/cli
  ] ++ (builtins.attrValues outputs.homeManagerModules);
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = "stinjul";
    homeDirectory = "/home/stinjul";
    stateVersion = "23.11";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    gc = {
      automatic = true;
      frequency = "weekly";
      # Keep the last 3 generations
      options = "--delete-older-than +3";
    };
    settings = {
    extra-substituters = [ "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };
  
  systemd.user.services.nix-gc.Service.ExecStart = lib.mkForce (makeJobScript ''nix-gc-start''  ''
    ${config.nix.package.out}/bin/nix-env --delete-generations +5
    ${config.nix.package.out}/bin/nix-collect-garbage
    ${config.nix.package.out}/bin/nix-store --optimise
  '');
}
