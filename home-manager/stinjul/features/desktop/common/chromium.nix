{pkgs, config, ...}: {
    home = {
      packages = [
          pkgs.chromium
      ];
      persistence = {
        "/persist".directories = [ ".config/chromium" ];
      };
    };
}
