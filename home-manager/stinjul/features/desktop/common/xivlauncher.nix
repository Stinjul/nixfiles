{ config, pkgs, ... }:
{
  home = {
    packages = [ pkgs.xivlauncher-gamemode ];
    persistence = {
      "/persist" = {
        directories = [
          ".xlcore"
        ];
      };
    };
  };
}
