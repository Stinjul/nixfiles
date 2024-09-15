{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = [ pkgs.typescript-language-server ];
    plugins.lsp.enabledServers = [
      {
        name = "ts_ls";
        extraOptions = {};
      }
    ];
  };
}
