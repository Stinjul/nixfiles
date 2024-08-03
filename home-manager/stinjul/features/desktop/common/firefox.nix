{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override { pkcs11Modules = [ pkgs.eid-mw ]; };
  };
  home = {
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ ".mozilla/firefox" ];
    };
  };
}
