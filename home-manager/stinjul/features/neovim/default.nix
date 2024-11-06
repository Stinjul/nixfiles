{
  inputs,
  pkgs,
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
    ./keybinds.nix
    ./neorg.nix
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

    extraPlugins = with pkgs.vimPlugins; [
      treesj
      kcl-nvim
      vim-alloy
    ];

    extraConfigLua = ''
      require('treesj').setup({})
    '';

    clipboard = {
      providers.wl-copy.enable = true;
    };

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

      image.enable = true;

      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
          hipatterns = {
            highlighters.hex_color.__raw = ''require("mini.hipatterns").gen_highlighter.hex_color()'';
          };
          icons = { };
          indentscope = { };
          pairs = { };
          # splitjoin = { };
          surround = { };
        };
      };
    };
  };
}
