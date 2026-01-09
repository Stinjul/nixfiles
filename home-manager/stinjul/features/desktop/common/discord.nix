{pkgs, config, ...}: {
  home = {
    packages = [
        # pkgs.discord-mod
        pkgs.vesktop
    ];
    persistence = {
      "/persist".directories = [ 
        ".config/discord"
        ".config/vesktop"
        ".config/Vencord"
      ];
    };
  };
}
