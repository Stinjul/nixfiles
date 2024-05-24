{pkgs, config, ...}: {
    programs.firefox = {
        enable = true;
    };
    home = {
      persistence = {
        "/persist${config.home.homeDirectory}".directories = [ ".mozilla/firefox" ];
      };
    };
}
