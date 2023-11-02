{ config, pkgs, ... }:
{
  imports = [
    ./lsp.nix
    ./ui.nix
    ./syntax.nix
    ./testing.nix
  ];
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = neodev-nvim;
        type = "lua";
      }
      {
        plugin = vim-argwrap;
        type = "lua";
      }
      {
        plugin = vim-grammarous;
        type = "lua";
      }
      {
        plugin = nvim-surround;
        type = "lua";
        config = ''
          require("nvim-surround").setup()
        '';
      }
      {
        plugin = editorconfig-nvim;
        type = "lua";
      }
      {
        plugin = neorg;
        type = "lua";
        config = builtins.readFile (./lua/neorg.lua);
      }
    ];
    extraLuaConfig = builtins.readFile (./lua/init.lua);
  };
}
