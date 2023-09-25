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

}
