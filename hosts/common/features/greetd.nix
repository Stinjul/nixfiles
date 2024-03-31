{ pkgs, lib, config, ... }:
let
  homeShares = lib.mapAttrsToList (_: u: "${u.home.path}/share") config.home-manager.users;
  vars = "XDG_DATA_DIRS=\"$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeShares}\"";
  # vars = ''XDG_DATA_DIRS="$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeShares}" GTK_USE_PORTAL=0'';

  sway-cmd = cmd: "${pkgs.dbus}/bin/dbus-run-session ${lib.getExe pkgs.sway} --unsupported-gpu --config ${pkgs.writeText "sway.config" ''
    input "type:keyboard" {
        xkb_layout be,us
        xkb_numlock enabled
    }
    input "type:touchpad" {
      tap enabled
    }
    xwayland disable
    output * bg #000000 solid_color
    exec '${vars} ${cmd}; ${pkgs.sway}/bin/swaymsg exit'
    ''}";
in
{
  users.users.greeter = {
    home = "/tmp/greeter-home";
    createHome = true;
  };
  programs.regreet = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = sway-cmd (lib.getExe config.programs.regreet.package);
  };
}
