{ config, ... }: {
  home.persistence = {
    "/persist${config.home.homeDirectory}" = {
      allowOther = true;
      directories = [
        {
          directory = ".local/share/Steam";
          method = "symlink";
        }
        ".factorio"
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
}
