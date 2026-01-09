{pkgs, config, ...}: {
  home = {
    packages = [
        pkgs.remmina
    ];
    persistence = {
      "/persist".directories = [ 
        ".config/remmina"
        ".local/share/remmina"
      ];
    };
  };
}
