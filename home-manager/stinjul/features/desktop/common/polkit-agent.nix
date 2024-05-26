{pkgs, ...}: {
  systemd.user.services = {
    polkit-agent = {
      Unit = {
        Description = "Polkit agent";
        Wants = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Install = {
          WantedBy = [ "graphical-session.target" ];
      };
  
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
