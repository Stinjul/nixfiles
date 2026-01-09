{ config, ... }:
{
  home = {
    persistence = {
      "/persist" = {
        directories = [
          ".android"
        ];
      };
    };
  };
}
