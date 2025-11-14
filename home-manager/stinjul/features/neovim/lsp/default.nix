{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./jsonls.nix
  ];
  programs.nixvim = {
    extraPackages = with pkgs; [ nixfmt-rfc-style ];
    plugins.lsp = {

      enable = true;
      keymaps = {
        diagnostic = { };
        lspBuf = {
          "gD" = "declaration";
          "gd" = "definition";
          "K" = "hover";
          "gi" = "implementation";
          "<leader>rn" = "rename";
          "<leader>ca" = "code_action";
          "<leader>f" = "format";
        };
      };

      servers = {
        lua_ls.enable = true;
        pyright.enable = true;
        cssls.enable = true;
        elixirls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        templ.enable = true;
        html.enable = true;
        java_language_server.enable = true;
        # jsonls.enable = true;
        # nil_ls.enable = true;
        nixd = {
          enable = true;
          settings.formatting.command = [ "nixfmt" ];
        };
        omnisharp.enable = true;
        # r_language_server
        bashls.enable = true;
        solargraph.enable = true;
        sqls.enable = true;
        terraformls.enable = true;
        lemminx.enable = true;
        yamlls.enable = true;
        efm = {
          enable = true;
          extraOptions.init_options = {
            documentFormatting = true;
            documentRangeFormatting = true;
            hover = true;
            documentSymbol = true;
            codeAction = true;
            completion = true;
          };
        };
        ltex = {
          enable = true;
          package = pkgs.ltex-ls-plus;
          cmd = [ "ltex-ls-plus" ];
          settings.additionalRules.motherTongue = "nl-BE";
        };
        texlab = {
          enable = true;
        };
        kcl = {
          enable = true;
          package = pkgs.inputs.nixpkgs-stable.kcl-language-server;
        };
        qmlls.enable = true;
        ts_ls.enable = true;
      };
    };
  };
}
