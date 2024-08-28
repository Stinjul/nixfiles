{ config, pkgs, ... }:
{
  home = {
    packages = [ pkgs.r2modman ];
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        allowOther = true;
        directories = [
          {
            directory = ".config/r2modman";
            method = "symlink";
          }
          {
            directory = ".config/r2modmanPlus-local";
            method = "symlink";
          }
        ];
      };
    };
  };
}
