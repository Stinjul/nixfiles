{config, lib, ...}: {
  sops.secrets.wg_server_key.sopsFile = ./secrets.yaml;
  sops.secrets.wg_homelab_key.sopsFile = ./secrets.yaml;

  networking = {
    firewall.allowedUDPPorts = [ 51820 38240 ];
    wireguard.interfaces = {
      wg-server = {
        ips = [ "10.8.0.1/24" ]; # Server ip
        listenPort = 51820;

        privateKeyFile = config.sops.secrets.wg_server_key.path;
        peers = [
          { # Shittop
              publicKey = "GSLRWEKej4HLD5SEp7NCBs+ews8G63k0I30WcQkGuWs=";
              allowedIPs = [ "10.8.0.2/32" ]; # Client IP
          }
          { # Phone
              publicKey = "avUZV4aKRb0ROrYHxl+4KZT7Hm+vIodmFCHdvim8fT4=";
              allowedIPs = [ "10.8.0.3/32" ]; # Client IP
          }
        ];
      };
      wg-homelab = {
        ips = [ "172.16.200.2/24" ]; # Client IP
        listenPort = 38240;

        privateKeyFile = config.sops.secrets.wg_homelab_key.path;
        peers = [
          {
              publicKey = "84ikge3Spyc4nVgdkGzw74iR5Vfs6ldPqZXgbN5kM2Q=";
              allowedIPs = [ "172.16.200.1/32" "172.16.0.0/16" ]; # IPs this peer should receive the traffic for
              endpoint = "192.168.1.59:51820";
          }
        ];
      };
    };
  };

  systemd.targets."wireguard-wg-homelab".wantedBy = lib.mkForce [];
}
