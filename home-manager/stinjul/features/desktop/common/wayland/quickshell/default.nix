{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  home.packages = [
    pkgs.inputs.quickshell.quickshell
  ];
}
