{ config, pkgs, ... }:
{
  imports = [
    ./lsp.nix
  ];
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
  };
}
