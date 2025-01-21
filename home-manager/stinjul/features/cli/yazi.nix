{ pkgs, ... }:
let
  plugins = {
    yazi = pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "7707c09f03e02144e528625ba82f54c6177715b2";
      hash = "sha256-oWdptgAtTAHX5u7lYe1o2TlvyCiOsuV1D5gm85J4dSE=";
    };
  };

in
{
  programs.yazi = {
    enable = true;
    plugins = {
      git = "${plugins.yazi}/git.yazi";
    };
    initLua = ''
      require("git"):setup()
    '';
    settings = {
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = "!";
          run = "shell \"$SHELL\" --block";
          desc = "open shell here";
        }
      ];
    };
  };
}
