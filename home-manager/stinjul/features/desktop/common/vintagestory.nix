{pkgs, config, ...}: {
  home = {
    packages = [
        pkgs.vintagestory
    ];
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ 
        ".config/VintagestoryData"
      ];
    };
  };
}
