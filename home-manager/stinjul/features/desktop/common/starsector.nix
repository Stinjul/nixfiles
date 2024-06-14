{ pkgs, config, ... }: {
  home = {
    packages = [
      pkgs.starsector
    ];
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        directories = [
          # { directory = ".local/share/starsector"; method = "symlink"; }
          ".local/share/starsector"
        ];
        files = [
          ".java/.userPrefs/com/fs/starfarer/prefs.xml"
        ];
      };
    };
  };
  systemd.user.services."bindMount--persist-home-stinjul-local-share-starsector-".Service.LimitNOFILE = "1048576:1048576";
}
