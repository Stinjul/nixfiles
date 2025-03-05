{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      pkcs11Modules = [ pkgs.eid-mw ];
      nativeMessagingHosts = [ pkgs.plasma-browser-integration ];
    };
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
  home = {
    persistence = {
      "/persist${config.home.homeDirectory}".directories = [ ".mozilla/firefox" ];
    };
  };
}
