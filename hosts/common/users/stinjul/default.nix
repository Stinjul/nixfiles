{ pkgs, ... } :{
  # users.mutableUsers = false;
  users.users.stinjul = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home-manager/stinjul/ssh.pub) ];
    packages = [ pkgs.home-manager ];
  };
}
