{ pkgs, config, ... }:
{
  home = {
    packages = [
      (pkgs.starsector.overrideAttrs (old: {
        postPatch =
          old.postPatch
          + ''
            substituteInPlace starsector.sh \
              --replace-fail "-Xms1536m -Xmx1536m" "-Xms4096m -Xmx4096m"
          '';
      }))
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
