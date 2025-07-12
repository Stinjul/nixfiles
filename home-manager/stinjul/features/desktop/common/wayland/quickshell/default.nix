{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  # home.packages = [
  #   pkgs.inputs.quickshell.quickshell
  # ];
  programs.quickshell = {
    enable = true;
    package = pkgs.inputs.quickshell.quickshell;
    configs = {
      main = ./config;
    };
    activeConfig = "main";
    systemd.enable = true;
  };
}
