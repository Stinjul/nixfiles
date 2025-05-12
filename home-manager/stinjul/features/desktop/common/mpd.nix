{
  config,
  osConfig,
  lib,
  ...
}:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Music";
      dataDir = "${config.xdg.dataHome}/mpd";
      extraConfig = builtins.concatStringsSep "\n" (
        [
          ''
            auto_update "yes"
            restore_paused "yes"
            audio_output {
                type                    "fifo"
                name                    "local_fifo"
                path                    "/tmp/mpd.fifo"
                format                  "44100:16:2"
            }
          ''
        ]
        ++ lib.optional osConfig.services.pipewire.enable ''
          audio_output {
            type            "pipewire"
            name            "PW Audio"
          }
        ''
      );
    };
    mpd-mpris = {
      enable = true;
      mpd.useLocal = true;
    };
  };
  home.persistence = {
    "/persist${config.home.homeDirectory}".directories = [ ".local/share/mpd" ];
  };
}
