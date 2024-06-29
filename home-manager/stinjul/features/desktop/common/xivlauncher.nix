{config, pkgs, ...}: {
  home = {
    packages = [
        pkgs.xivlauncher-manual
    ];
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        allowOther = true;
        directories = [".xlcore"];
      };
    };
  };
}
