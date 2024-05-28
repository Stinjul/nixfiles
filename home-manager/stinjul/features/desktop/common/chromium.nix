{pkgs, config, ...}: {
    home = {
      packages = [
          pkgs.chromium
      ];
      persistence = {
        "/persist${config.home.homeDirectory}".directories = [ ".config/chromium" ];
      };
    };
}
