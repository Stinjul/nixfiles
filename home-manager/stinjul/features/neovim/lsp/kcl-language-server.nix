{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = [ pkgs.kcl-language-server ];
    plugins.lsp = {
      preConfig = ''
        do
            local server_config = require 'lspconfig.configs'
            server_config.kcl = { default_config = {}, }
        end
      '';
      enabledServers = [
        {
          name = "kcl";
          extraOptions = {
            cmd = [ "kcl-language-server" ];
            root_dir.__raw = ''
              require 'lspconfig.util'.root_pattern('.git')
            '';
            filetypes = [ "kcl" ];
          };
        }
      ];
    };
  };
}
