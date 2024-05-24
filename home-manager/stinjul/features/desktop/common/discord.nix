{pkgs, config, ...}: {
  home = {
    packages = [
        pkgs.discord-mod
    ];
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ 
        ".config/discord"
        ".config/Vencord"
      ];
    };
  };
}
