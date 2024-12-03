{ pkgs, ... }:
{
  fontProfiles = {
    enable = true;
    monospace = {
      family = "IosevkaTerm Nerd Font Mono";
      package = pkgs.nerd-fonts.iosevka-term;
    };
    regular = {
      family = "Iosevka";
      package = pkgs.iosevka;
    };
  };
}
