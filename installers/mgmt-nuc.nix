{ lib, ... }: {

  imports = [
    ../hosts/common/users/deploy
  ];
  nixpkgs.hostPlatform = "x86_64-linux";

  users.extraUsers.nixos.openssh.authorizedKeys.keys =
    lib.splitString "\n" (builtins.readFile ../home-manager/stinjul/ssh.pub);
  
  users.extraUsers.root.openssh.authorizedKeys.keys =
    lib.splitString "\n" (builtins.readFile ../home-manager/stinjul/ssh.pub);
}
