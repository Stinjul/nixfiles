{config, ...}: {
  home = {
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ ".config/qt5ct" ".config/qt6ct" ];
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    # style.name = "breeze";
  };
}
