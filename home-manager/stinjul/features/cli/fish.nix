{ pkgs, config, ... }: {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
  };
    home = {
      persistence = {
        "/persist${config.home.homeDirectory}".files = [
            ".local/share/fish/fish_history"
            ## Fish freaks out because of "Invalid cross-device link"
            # ".config/fish/fish_variables"
        ];
      };
    };
}
