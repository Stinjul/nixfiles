{ inputs, lib, config, ... }: {
  environment.persistence = {
    "/persist" = {
      directories = [
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/var/log"
      ];
      files = [
        "/etc/machine-id"
        "/etc/adjtime"
        # "/var/lib/sops-nix/age-key.txt"
      ];
    };
  };
  programs.fuse.userAllowOther = true;
  systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];

  system.activationScripts.persistent-dirs.text =
    let
      mkHomePersist = user:
        lib.optionalString user.createHome ''
          mkdir -p /persist/${user.home}
          chown ${user.name}:${user.group} /persist/${user.home}
          chmod ${user.homeMode} /persist/${user.home}
        '';
      users = lib.attrValues config.users.users;
    in
    lib.concatLines (map mkHomePersist users);
}
