{
  config,
  pkgs,
  lib,
  ...
}:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # home-manager.users.stinjul = import ../../../../home-manager/stinjul/${config.networking.hostName};

  users.mutableUsers = false;
  sops.secrets.stinjul-password.neededForUsers = true;

  users.users.stinjul = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.stinjul-password.path;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ] ++ ifTheyExist [ "wireshark" ];
    openssh.authorizedKeys.keys = lib.splitString "\n" (
      builtins.readFile ../../../../home-manager/stinjul/ssh.pub
    );
    packages = [
      pkgs.home-manager
      pkgs.kitty.terminfo
    ];
  };

  security.pam.loginLimits = [
    {
      domain = "stinjul";
      item = "nofile";
      type = "-";
      value = "1048576";
    }
  ];
}
