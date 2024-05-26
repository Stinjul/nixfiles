{ pkgs, config, options, lib, ... }: 
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
    ];
  };
  home = {
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        files = [
          ## Fish freaks out because of "Invalid cross-device link",
          # ".local/share/fish/fish_history"
          # ".config/fish/fish_variables"
        ];
        directories = [
          ".config/fish"
          ".local/share/fish"
        ];
      };
    };
  };
}
