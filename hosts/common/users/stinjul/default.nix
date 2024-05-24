{ config, pkgs, lib, ... }: {
  # home-manager.users.stinjul = import ../../../../home-manager/stinjul/${config.networking.hostName};

  users.mutableUsers = false;
  sops.secrets.stinjul-password.neededForUsers = true;

  users.users.stinjul = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.stinjul-password.path;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../../../home-manager/stinjul/ssh.pub);
    packages = [ pkgs.home-manager pkgs.kitty.terminfo ];
  };
}
