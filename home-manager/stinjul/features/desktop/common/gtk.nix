{ pkgs, config, ... }:
# home.packages = with pkgs; [
#   gnome.adwaita-icon-theme
# ];
let
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
in
{
  home = {
    file.".local/share/themes/${theme.name}" = {
      source = "${theme.package}/share/themes/${theme.name}";
    };
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ ".config/dconf" ];
    };
  };
  gtk = {
    inherit theme;
    enable = true;
    font = {
      name = config.fontProfiles.regular.family;
      size = 11;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
  };
}
