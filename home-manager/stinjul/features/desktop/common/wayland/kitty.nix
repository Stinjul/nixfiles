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
        size = 12;
    };
  };
}
