{config, ...}: {
  sops.secrets.wg_server_key.sopsFile = ./secrets.yaml;

  networking = {
    firewall.allowedUDPPorts = [ 51820 ];
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
    };
  };
}
