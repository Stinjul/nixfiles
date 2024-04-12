{
  programs.nixvim.plugins.lsp.servers.jsonls = {
    enable = true;
    extraOptions = {
      settings = {
        json = {
          schemas = [
            {
              description = "TypeScript compiler configuration file";
              fileMatch = [
                "tsconfig.json"
                "tsconfig.*.json"
              ];
              url = "https://json.schemastore.org/tsconfig.json";
            }
            {
              description = "ESLint config";
              fileMatch = [
                ".eslintrc.json"
                ".eslintrc"
              ];
              url = "https://json.schemastore.org/eslintrc.json";
            }
            {
              description = "Prettier config";
              fileMatch = [
                ".prettierrc"
                ".prettierrc.json"
                "prettier.config.json"
              ];
              url = "https://json.schemastore.org/prettierrc";
            }
            {
              description = "Stylelint config";
              fileMatch = [
                ".stylelintrc"
                ".stylelintrc.json"
                "stylelint.config.json"
              ];
              url = "https://json.schemastore.org/stylelintrc";
            }
            {
              description = "Packer template JSON configuration";
              fileMatch = [
                "packer.json"
              ];
              url = "https://json.schemastore.org/packer.json";
            }
            {
              description = "NPM configuration file";
              fileMatch = [
                "package.json"
              ];
              url = "https://json.schemastore.org/package.json";
            }
          ];
        };
      };
    };
  };
}
