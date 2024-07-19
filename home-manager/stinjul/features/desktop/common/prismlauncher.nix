{ pkgs, config, ... }:
{
  home = {
    packages = [ pkgs.prismlauncher ];
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [
        {
          directory = ".local/share/PrismLauncher";
          method = "symlink";
        }
      ];
    };
  };
}
