{config, ...}: {
  home.persistence = {
    "/persist${config.home.homeDirectory}" = {
      allowOther = true;
      directories = [
        ".local/share/Steam"
        ".factorio"
        ".config/unity3d/IronGate/Valheim"
        ".config/unity3d/Ludeon Studios/RimWorld by Ludeon Studios"
        ".local/share/Paradox Interactive"
        ".paradoxlauncher"
      ];
      files = [
        ".steam/steam.token"
        ".steam/registry.vdf"
      ];
    };
  };
}
