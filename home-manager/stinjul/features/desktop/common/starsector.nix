{ pkgs, config, ... }:
{
  home = {
    packages = [
      (pkgs.starsector.overrideAttrs (old: {
        postPatch =
          old.postPatch
          + ''
            substituteInPlace starsector.sh \
              --replace-fail "-Xms2048m" "-Xms4096m" \
              --replace-fail "-Xmx2048m" "-Xmx4096m"
          '';
      }))
      pkgs.trios
    ];
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        directories = [
          # {
          #   directory = ".local/share/starsector";
          #   method = "symlink";
          # }
          # ".local/share/starsector"
          ".local/share/starsector/saves"
          ".java/.userPrefs/com/fs/starfarer"
          ".local/share/org.wisp.trios"
        ];
        # files = [
        #   # Starsector keeps copying/overwriting the symlink :(
        #   ".java/.userPrefs/com/fs/starfarer/prefs.xml"
        #   ".local/share/starsector/mods/enabled_mods.json"
        # ];
      };
    };
  };
  # systemd.user.services."bindMount--persist-home-stinjul-local-share-starsector-".Service.LimitNOFILE = "1048576:1048576";
}
