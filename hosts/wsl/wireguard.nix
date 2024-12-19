{config, lib, ...}: {
  sops.secrets.wg_key.sopsFile = ./secrets.yaml;

  networking = {
    firewall.allowedUDPPorts = [ 51820 ];
    wireguard.interfaces = {
      wg-zennix = {
        ips = [ "10.8.0.2/24" ]; # Client ip
        listenPort = 51820;

        privateKeyFile = config.sops.secrets.wg_key.path;
        peers = [
          { # Zennix
              publicKey = "wF0kKm3oJGOimi8aBzACSHP5KIDXiMYlCar+rPbBuz4=";
              allowedIPs = [ "10.8.0.1/32" ]; # Server IP
              endpoint = "stinjul.ddns.net:51820";
          }
        ];
      };
    };
  };
}
