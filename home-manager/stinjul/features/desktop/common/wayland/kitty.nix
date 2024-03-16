{config, ...}: {
  home = {
    sessionVariables = {
      TERMINAL = "kitty -1";
    };
  };
  programs.kitty = {
    enable = true;
    font = {
        name = config.fontProfiles.monospace.family;
        size = 11;
    };
    settings = {
        window_padding = 10;
    };
  };
}
