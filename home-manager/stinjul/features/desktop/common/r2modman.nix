{ config, pkgs, ... }:
{
  home = {
    packages = [ pkgs.r2modman ];
    persistence = {
      "/persist" = {
        directories = [
          ".config/r2modman"
          ".config/r2modmanPlus-local"
        ];
      };
    };
  };
}
