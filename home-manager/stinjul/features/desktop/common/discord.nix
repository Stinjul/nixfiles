{pkgs, config, ...}: {
  home = {
    packages = [
        # pkgs.discord-mod
        pkgs.vesktop
    ];
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ 
        ".config/discord"
        ".config/vesktop"
        ".config/Vencord"
      ];
    };
  };
}
