{config, ...}: {
  home = {
    persistence = {
      "/persist".directories = [ ".config/Mullvad VPN" ];
    };
  };
}
