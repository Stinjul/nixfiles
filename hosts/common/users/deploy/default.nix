{ config, pkgs, ... }: {

  users.groups.deploy = { };
  users.users.deploy = {
    isSystemUser = true;
    group = "deploy";
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [ (builtins.readFile ./yk_123.pub) ];
  };

  nix.settings.trusted-users = [ "deploy" ];

  # If something breaks check nixos-rebuild on git:
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/nixos-rebuild/nixos-rebuild.sh

  security.sudo.extraRules = [
    {
      users = [ "deploy" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/env";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/nix-env";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/nix/store/*/bin/switch-to-configuration";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/nix/store/*/activate-rs";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/rm /tmp/deploy-rs-canary-*";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/systemd-run -E LOCALE_ARCHIVE -E NIXOS_INSTALL_BOOTLOADER --collect --no-ask-password --pty --quiet --same-dir --service-type=exec --unit=nixos-rebuild-switch-to-configuration --wait true";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/systemd-run -E LOCALE_ARCHIVE -E NIXOS_INSTALL_BOOTLOADER --collect --no-ask-password --pty --quiet --same-dir --service-type=exec --unit=nixos-rebuild-switch-to-configuration --wait /nix/store/*/bin/switch-to-configuration *";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
