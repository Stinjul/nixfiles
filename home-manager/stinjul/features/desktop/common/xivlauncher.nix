{ config, pkgs, ... }:
{
  home = {
    packages = [ pkgs.xivlauncher ];
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
