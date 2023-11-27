{ lib, ... }: {

  imports = [
    ../hosts/common/users/deploy
  ];
  nixpkgs.hostPlatform = "aarch64-linux";

  users.extraUsers.nixos.openssh.authorizedKeys.keys = [
    (builtins.readFile ../home-manager/stinjul/ssh.pub)
  ];
}
