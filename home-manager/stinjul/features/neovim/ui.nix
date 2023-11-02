{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = vim-fugitive;
      type = "lua";
    }
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = ''
        require("gitsigns").setup()
      '';
    }
    {
      plugin = playground;
      type = "lua";
    }
    {
      plugin = lualine-nvim;
      type = "lua";
      config = builtins.readFile (./lua/lualine.lua);
    }
    {
      plugin = nvim-coverage;
      type = "lua";
      config = ''
        require("coverage").setup()
      '';
    }
    {
      plugin = telescope-nvim;
      type = "lua";
    }
    {
      plugin = trouble-nvim;
      type = "lua";
      config = ''
        require("trouble").setup()
      '';
    }
  ];
}
