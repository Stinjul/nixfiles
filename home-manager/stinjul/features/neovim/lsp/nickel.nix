{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.vim-nickel ];
    plugins.lsp.servers.nickel_ls.enable = true;
  };
}
