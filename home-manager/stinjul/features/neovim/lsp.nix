{ pkgs, ... }: {
  programs.neovim = {
    extraPackages = with pkgs; [
      ## LSP
      nodePackages.bash-language-server
      efm-langserver
      elixir-ls
      fsautocomplete
      vscode-langservers-extracted # html,css,json
      gopls
      jdt-language-server
      lemminx
      lua-language-server
      omnisharp-roslyn
      # powershell_es
      nodePackages.pyright
      nil
      rPackages.languageserver
      rust-analyzer
      rubyPackages_3_2.solargraph
      # sql-language-server
      # templ
      terraform-ls
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      yaml-language-server

      ## DAP
      lldb
      # elixir debugger is part of ls
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = luasnip;
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
      ## Missing some servers atm
      {
        plugin = mason-lspconfig-nvim;
        type = "lua";
      }
      {
        plugin = efmls-configs-nvim;
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
      # {
      #   plugin = mason-nvim-dap-nvim;
      #   type = "lua";
      # }
      {
        plugin = nvim-dap;
        type = "lua";
        config = builtins.readFile (./lua/dap.lua);
      }
    ];
  };
}
