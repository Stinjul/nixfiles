{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neodev-nvim;
      type = "lua";
    }
    {
      plugin = plenary-nvim;
      type = "lua";
    }
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
      plugin = lualine-nvim;
      type = "lua";
      config = builtins.readFile (./lua/lualine.lua);
    }
    {
      plugin = nvim-treesitter;
      type = "lua";
      config = builtins.readFile (./lua/treesitter.lua);
    }
    {
      plugin = playground;
      type = "lua";
    }
    {
      plugin = luasnip;
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
      plugin = yuck-nvim;
      type = "lua";
    }
    {
      plugin = cmp-nvim-lsp;
      type = "lua";
    }
    {
      plugin = cmp-path;
      type = "lua";
    }
    {
      plugin = cmp_luasnip;
      type = "lua";
    }
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile (./lua/cmp.lua);
    }
    {
      plugin = mason-nvim;
      type = "lua";
      config = ''
        require("mason").setup()
      '';
    }
    {
      plugin = mason-lspconfig-nvim;
      type = "lua";
    }
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile (./lua/lsp.lua);
    }
    {
      plugin = nvim-dap-ui;
      type = "lua";
    }
    {
      plugin = mason-nvim-dap-nvim;
      type = "lua";
    }
    {
      plugin = nvim-dap;
      type = "lua";
      config = builtins.readFile (./lua/dap.lua);
    }
    {
      plugin = neotest-elixir;
      type = "lua";
    }
    {
      plugin = neotest-python;
      type = "lua";
    }
    {
      plugin = neotest;
      type = "lua";
      config = builtins.readFile (./lua/neotest.lua);
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
    {
      plugin = obsidian-nvim;
      type = "lua";
      config = builtins.readFile (./lua/obsidian.lua);
    }
    {
      plugin = neorg;
      type = "lua";
      config = builtins.readFile (./lua/neorg.lua);
    }
  ];
}
