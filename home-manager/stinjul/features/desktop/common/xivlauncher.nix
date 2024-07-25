{ config, pkgs, ... }:
{
  home = {
    packages = [ pkgs.xivlauncher-gamemode ];
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        allowOther = true;
        directories = [
          {
            directory = ".xlcore";
            method = "symlink";
          }
        ];
      };
    };
  };
}
