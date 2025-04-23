{ pkgs, ... }:
# let
#   plugins = {
#     yazi = pkgs.fetchFromGitHub {
#       owner = "yazi-rs";
#       repo = "plugins";
#       rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";
#       hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";
#     };
#   };
# 
# in
{
  programs.yazi = {
    enable = true;
    plugins = {
      # git = "${plugins.yazi}/git.yazi";
      git = pkgs.yaziPlugins.git;
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
