{ config, ... }:
{
  programs.direnv = {
    enable = true;
    # Auto enabled
    # enableFishIntegration = true;
    nix-direnv.enable = true;
  };
  home = {
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        directories = [
          ".local/share/direnv"
        ];
      };
    };
  };
}
