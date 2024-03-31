{config, ...}: {
  home = {
    sessionVariables = {
      TERMINAL = "kitty -1";
    };
  };
  xdg.configFile."kitty/scratchpad.session" = {
    source = ./scratchpad.session;
  };
  programs.kitty = {
    enable = true;
    font = {
        name = config.fontProfiles.monospace.family;
        size = 11;
    };
    settings = {
        window_padding = 10;
        background_opacity = "0.8";
    };
  };
}
