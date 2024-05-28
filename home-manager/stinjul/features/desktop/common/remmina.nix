{pkgs, config, ...}: {
  home = {
    packages = [
        pkgs.remmina
    ];
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ 
        ".config/remmina"
        ".local/share/remmina"
      ];
    };
  };
}
