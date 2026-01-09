{ pkgs, config, ... }:
{
  home = {
    packages = [ pkgs.yafc-ce ];
    persistence = {
      "/persist" = {
        directories = [
          ".local/share/Steam"
          ".factorio"
          ".local/share/YAFC"
          ".config/unity3d/IronGate/Valheim"
          ".config/unity3d/Ludeon Studios/RimWorld by Ludeon Studios"
          ".local/share/Paradox Interactive"
          ".local/share/Terraria"
          ".paradoxlauncher"
        ];
        files = [
          ".steam/steam.token"
          ".steam/registry.vdf"
        ];
      };
    };
  };
}
