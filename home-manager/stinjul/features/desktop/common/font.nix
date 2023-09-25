{ pkgs, ... }: {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Iosevka Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "Iosevka" "IosevkaTerm" ]; };
    };
    regular = {
      family = "Iosevka";
      package = pkgs.iosevka;
    };
  };
}
