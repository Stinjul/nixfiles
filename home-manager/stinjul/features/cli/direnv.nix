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
      "/persist" = {
        directories = [
          ".local/share/direnv"
        ];
      };
    };
  };
}
