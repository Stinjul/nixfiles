{
  programs.nixvim.plugins.efmls-configs = {
    enable = true;
    languages = {
      python = {
        formatter = [ "black" ];
      };
      javascript = {
        formatter = [ "prettier_d" ];
      };
      typescript = {
        formatter = [ "prettier_d" ];
      };
      css = {
        linter = [ "stylelint" ];
        formatter = [ "prettier_d" ];
      };
      less = {
        linter = [ "stylelint" ];
        formatter = [ "prettier_d" ];
      };
      sass = {
        linter = [ "stylelint" ];
        formatter = [ "prettier_d" ];
      };
      scss = {
        linter = [ "stylelint" ];
        formatter = [ "prettier_d" ];
      };
    };
  };
}
