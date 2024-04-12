{ inputs, config, pkgs, lib, ... }:
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

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-argwrap
    ];

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>a";
        action = "<cmd>ArgWrap<CR>";
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];

    editorconfig.enable = true;

    plugins = {
      treesitter.enable = true;
      lualine = {
        enable = true;
        theme = "16color";
      };
      gitsigns.enable = true;
      diffview.enable = true;
      neogit.enable = true;

      luasnip.enable = true;
      surround.enable = true;

      coverage.enable = true;
      telescope.enable = true;
      trouble.enable = true;

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
