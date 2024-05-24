{ outputs, pkgs, lib, ... }: {
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
    stateVersion = "23.11";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    registry = {
      stinjul = {
        from = { type = "indirect"; id = "stinjul"; };
        flake = {
          outPath = "/home/stinjul/Git_Projects/nixfiles";
        };
      };
    };
  };

}
