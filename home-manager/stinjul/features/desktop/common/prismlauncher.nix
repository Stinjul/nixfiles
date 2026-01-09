{ pkgs, config, ... }:
{
  home = {
    packages = [ pkgs.prismlauncher ];
    persistence = {
      "/persist".directories = [
        ".local/share/PrismLauncher"
      ];
    };
  };
}
