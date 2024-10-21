{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.networking.thunderboltFabric;
in
{
  options.networking.thunderboltFabric = {
    enable = lib.mkEnableOption "Enable thunderbolt + fabric networking";
    loopbackAddress = {
      ipv4 = lib.mkOption {
        type = lib.types.str;
        example = "172.16.255.1/32";
      };
      ipv6 = lib.mkOption {
        type = lib.types.str;
        example = "fdb4:5edb:1b00::1/128";
      };
    };
    interfaces = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      example = [
        "en0"
        "en1"
      ];
    };
    nsap = lib.mkOption {
      type = lib.types.str;
      example = "49.0000.0000.0001.00";
    };
  };

  config = lib.mkIf cfg.enable {
    #TODO: wait for https://github.com/NixOS/nixpkgs/pull/327099 and rework if required
    services.frr = {
      fabricd.enable = true;
      config = ''
        ip forwarding
        ipv6 forwarding
        !
        interface lo
         ip address ${cfg.loopbackAddress.ipv4}
         ip router openfabric 1
         ipv6 address ${cfg.loopbackAddress.ipv6}
         ipv6 router openfabric 1
         openfabric passive
        !
        ${lib.concatMapStringsSep "\n" (interface: ''
          interface ${interface}
           ip router openfabric 1
           ipv6 router openfabric 1
           openfabric csnp-interval 2
           openfabric hello-interval 1
           openfabric hello-multiplier 2
          !'') cfg.interfaces}
        router openfabric 1
         net ${cfg.nsap}
         fabric-tier 0
         lsp-gen-interval 1
         max-lsp-lifetime 600
         lsp-refresh-interval 180'';
    };
    systemd = {
      services = {
        frr = {
          requires = lib.lists.forEach cfg.interfaces (i: "sys-subsystem-net-devices-${i}.device");
          after = lib.lists.forEach cfg.interfaces (i: "sys-subsystem-net-devices-${i}.device");
        };
        "pin-thunderbolt-to-p-cores" = {
          description = "Pins the thunderbolt IRQs to the P-Cores";
          serviceConfig = {
            Type = "oneshot";
          };
          wantedBy = lib.lists.forEach cfg.interfaces (i: "sys-subsystem-net-devices-${i}.device");
          bindsTo = lib.lists.forEach cfg.interfaces (i: "sys-subsystem-net-devices-${i}.device");
          after = lib.lists.forEach cfg.interfaces (i: "sys-subsystem-net-devices-${i}.device");
          script = ''
            for id in $(${pkgs.gnugrep}/bin/grep 'thunderbolt' /proc/interrupts | ${pkgs.gawk}/bin/awk '{print $1}' | ${pkgs.coreutils}/bin/cut -d ':' -f1); do
              echo 00ff > /proc/irq/$id/smp_affinity
            done
          '';
          serviceConfig = {
            RemainAfterExit = true;
          };
        };
      };
      network = {
        config.networkConfig = {
          IPv4Forwarding = true;
          IPv6Forwarding = true;
        };
        networks = {
          # "20-loopback-openfabric" = {
          #   matchConfig = {
          #     Name = "lo";
          #   };
          #   addresses = [
          #     {
          #       Address = cfg.loopbackAddress.ipv4;
          #       Scope = "host";
          #     }
          #     {
          #       Address = cfg.loopbackAddress.ipv6;
          #       Scope = "host"; # IPv6 technically ignores this, but w/e
          #     }
          #   ];
          # };
          "21-thunderbolt" = {
            matchConfig.Driver = "thunderbolt-net";
            linkConfig = {
              ActivationPolicy = "up";
              MTUBytes = "1500";
            };
            networkConfig = {
              LinkLocalAddressing = "no";
            };
          };
        };
      };
    };
  };
}
