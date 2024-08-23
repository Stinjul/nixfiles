{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.yubikey-touch-detector ];

  systemd.user = {
    sockets.yubikey-touch-detector = {
      Unit.Description = "Unix socket activation for YubiKey touch detector service";
      Socket = {
        ListenStream = "%t/yubikey-touch-detector.sock";
        RemoveOnStop = true;
      };
      Install.WantedBy = [ "sockets.target" ];
    };

    services.yubikey-touch-detector = {
      Unit = {
        Description = "Detects when your YubiKey is waiting for a touch";
        Requires = [ "yubikey-touch-detector.socket" ];
      };
      Service = {
        ExecStart = "${pkgs.yubikey-touch-detector}/bin/yubikey-touch-detector --libnotify";
        Environment = [ "PATH=${lib.makeBinPath [ pkgs.gnupg ]}" ];
        # EnvironmentFile = "-%E/yubikey-touch-detector/service.conf";
      };
      Install = {
        Also = [ "yubikey-touch-detector.socket" ];
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
