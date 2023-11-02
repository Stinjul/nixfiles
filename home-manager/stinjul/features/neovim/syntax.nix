{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = (nvim-treesitter.withPlugins (_: nvim-treesitter.allGrammars ++ [
        (pkgs.tree-sitter.buildGrammar {
          language = "templ";
          version = "89e5957";
          src = pkgs.fetchFromGitHub {
            owner = "vrischmann";
            repo = "tree-sitter-templ";
            rev = "89e5957b47707b16be1832a2753367b91fb85be0";
            sha256 = "0mrxpacdagjrfc34mw4jvp4jfxkivgb413jsg0hs1r17rfcb9l4w";
          };
        })
      ]));
      type = "lua";
      config = builtins.readFile (./lua/treesitter.lua);
    }
    {
      plugin = yuck-vim;
      type = "lua";
    }
    {
      plugin = obsidian-nvim;
      type = "lua";
      config = builtins.readFile (./lua/obsidian.lua);
    }
  ];
}
