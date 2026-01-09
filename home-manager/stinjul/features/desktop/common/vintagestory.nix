{pkgs, config, ...}: {
  home = {
    packages = [
        pkgs.vintagestory
    ];
    persistence = {
      "/persist".directories = [ 
        ".config/VintagestoryData"
      ];
    };
  };
}
