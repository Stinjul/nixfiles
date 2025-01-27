{
  programs.nixvim = {
    extraPython3Packages = p: with p; [ plotly kaleido ];
    plugins = {
      molten = {
        enable = true;
        settings = {
          image_provider = "image.nvim";
        };
      };
      quarto = {
        enable = true;
        settings = {
          lspFeatures = {
            enabled = true;
            languages = [
              "python"
              "lua"
            ];
            chunks = "all";
          };
          codeRunner = {
            enabled = true;
            default_method = "molten";
          };
        };
      };
      jupytext = {
        enable = true;
        settings.custom_language_formatting = {
          python = {
            extension = "qmd";
            style = "quarto";
            force_ft = "quarto";
          };
        };
      };
    };
  };
}
