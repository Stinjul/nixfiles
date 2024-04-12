{
  programs.nixvim.plugins.lsp = {
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
      lua-ls.enable = true;
      pyright.enable = true;
      cssls.enable = true;
      elixirls.enable = true;
      eslint.enable = true;
      gopls.enable = true;
      templ.enable = true;
      html.enable = true;
      java-language-server.enable = true;
      jsonls.enable = true;
      # nil_ls.enable = true;
      nixd.enable = true;
      omnisharp.enable = true;
      # r_language_server
      bashls.enable = true;
      solargraph.enable = true;
      sqls.enable = true;
      terraformls.enable = true;
      tsserver.enable = true;
      lemminx.enable = true;
      yamlls.enable = true;
      efm.enable = true;
      ltex.enable = true;
    };
  };
}
