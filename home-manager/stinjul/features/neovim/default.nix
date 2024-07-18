{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./lsp
    ./efmls.nix
    ./cmp.nix
    ./dap.nix
    ./neotest.nix
    ./opts.nix
  ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    colorschemes.base16 = {
      enable = true;
      setUpBar = true;
      colorscheme = "schemer-dark";
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraPlugins = with pkgs.vimPlugins; [ treesj ];

    extraConfigLua = ''
      require('treesj').setup({})
    '';

    opts = {
      number = true;
      relativenumber = true;
    };

    clipboard = {
      providers.wl-copy.enable = true;
    };

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>a";
        action = "<cmd>TSJToggle<CR>";
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];

    editorconfig.enable = true;

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight = {
            enable = true;
          };
        };
      };
      lualine = {
        enable = true;
      };
      gitsigns.enable = true;
      diffview.enable = true;
      neogit.enable = true;

      luasnip.enable = true;
      # surround.enable = true;

      coverage.enable = true;
      telescope.enable = true;
      trouble.enable = true;

      mini = {
        enable = true;
        modules = {
          hipatterns = {
            highlighters.hex_color.__raw = ''require("mini.hipatterns").gen_highlighter.hex_color()'';
          };
          indentscope = { };
          pairs = { };
          # splitjoin = { };
          surround = { };
        };
      };

      # TODO: wait for https://github.com/NixOS/nixpkgs/pull/302442
      # neorg = {
      #   enable = true;
      #   modules = {
      #     "core.defaults" = { __empty = null; };
      #     "core.completion" = {
      #       config = {
      #         engine = "nvim-cmp";
      #       };
      #     };
      #   };
      # };
    };

  };
}
