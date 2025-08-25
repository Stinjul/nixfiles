{ lib, ... }:
{

  imports = [
    ../hosts/common/users/deploy
  ];
  nixpkgs.hostPlatform = "aarch64-linux";

  users.extraUsers.nixos.openssh.authorizedKeys.keys = lib.splitString "\n" (
    builtins.readFile ../home-manager/stinjul/ssh.pub
  );
}
