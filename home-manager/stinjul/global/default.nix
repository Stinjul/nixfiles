{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
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
    stateVersion = "23.05";
  };

  nix.registry = {
    stinjul = {
      from = { type = "indirect"; id = "stinjul"; };
      flake = {
        outPath = "/home/stinjul/Git_Projects/nixfiles";
      };
    };
  };

}
