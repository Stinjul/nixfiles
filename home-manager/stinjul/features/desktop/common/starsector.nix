{pkgs, config, ...}: {
  home = {
    packages = [
        pkgs.starsector
    ];
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        directories = [ 
          ".local/share/starsector"
        ];
        files = [
          ".java/.userPrefs/com/fs/starfarer/prefs.xml"
        ];
      };
    };
  };
}
