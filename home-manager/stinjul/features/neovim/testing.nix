{ pkgs, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = neotest-elixir;
      type = "lua";
    }
    {
      plugin = neotest-python;
      type = "lua";
    }
    {
      plugin = neotest;
      type = "lua";
      config = builtins.readFile (./lua/neotest.lua);
    }
  ];
}
