{
  programs.nixvim = {
    files."ftplugin/quarto.lua".keymaps = [
      {
        mode = [ "n" ];
        key = "<localleader>os";
        action = ":noautocmd MoltenEnterOutput<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<localleader>mi";
        action = ":MoltenInit<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<localleader>rc";
        action = ":QuartoSend<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = [ "n" ];
        key = "<localleader>ra";
        action = ":QuartoSendAll<CR>";
        options = {
          silent = true;
        };
      }
    ];
    extraPython3Packages =
      p: with p; [
        plotly
        kaleido
      ];
    plugins = {
      molten = {
        enable = true;
        settings = {
          image_provider = "image.nvim";
          wrap_output = true;
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
