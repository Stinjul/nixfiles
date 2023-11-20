{ lib, ... }: {

  imports = [
    inputs.nixos-generators.nixosModules.sd-aarch64
  ];

  users.extraUsers.nixos.openssh.authorizedKeys.keys = [
    (builtins.readFile ../home-manager/stinjul/ssh.pub)
  ];
  services.sshd.enabled = true;
}
