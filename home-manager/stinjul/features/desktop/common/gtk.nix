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
      "/persist".directories = [ ".config/dconf" ];
    };
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
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
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
