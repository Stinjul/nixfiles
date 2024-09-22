{ lib, config, ... }:
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
      fabric = {
        enable = true;
        config = ''
          interface lo
           openfabric passive
           ip router openfabric 1
           ipv6 router openfabric 1
          !
          ${lib.concatMapStringsSep "\n" (interface: ''
            interface ${interface}
             ip router openfabric 1
             ipv6 router openfabric 1
            !'') cfg.interfaces}
          router openfabric 1
           net ${cfg.nsap}'';
      };
      zebra = {
        enable = true;
        config = ''
          ip forwarding
          ipv6 forwarding
        '';
      };
    };
    systemd.network = {
      networks = {
        "20-loopback-openfabric" = {
          matchConfig = {
            Name = "lo";
          };
          addresses = [
            {
              Address = cfg.loopbackAddress.ipv4;
              Scope = "host";
            }
            {
              Address = cfg.loopbackAddress.ipv6;
              Scope = "host"; # IPv6 technically ignores this, but w/e
            }
          ];
        };
        "21-thunderbolt" = {
          matchConfig.Driver = "thunderbolt-net";
          linkConfig = {
            ActivationPolicy = "up";
          };
          networkConfig = {
            LinkLocalAddressing = "no";
          };
        };
      };
    };
  };
}
