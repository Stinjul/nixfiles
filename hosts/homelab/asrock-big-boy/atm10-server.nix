{ config, lib, ... }:
let
  op = "58c337ba-c1c5-42a7-bc86-f532fe52c4c4";
  whitelist = lib.concatStringsSep "," [
    op
  ];
in
{
  sops.secrets.cf-token-env = {
    format = "dotenv";
    sopsFile = ./cf-token.env;
  };

  virtualisation.oci-containers.containers."mc-atm10" = {
    autoStart = true;
    image = "docker.io/itzg/minecraft-server:stable";
    volumes = [ "/mnt/storage/mc/atm10/data:/data" ];
    environment = {
      EULA = "TRUE";
      TYPE = "AUTO_CURSEFORGE";
      CF_SLUG = "all-the-mods-10";
      INIT_MEMORY = "4G";
      MAX_MEMORY = "16G";
      TZ = "Europe/Brussels";
      USE_AIKAR_FLAGS = "true";
      DIFFICULTY = "hard";
      DEBUG = "true";
      EXISTING_WHITELIST_FILE = "SYNCHRONIZE";
      WHITELIST = whitelist;
      EXISTING_OPS_FILE = "SYNCHRONIZE";
      OPS = op;
      # From env file:
      # CF_API_KEY = "";
    };
    environmentFiles = [
      config.sops.secrets.cf-token-env.path
    ];
    ports = [
      "0.0.0.0:25565:25565"
    ];
    extraOptions = [
      "--hostname=mc-atm10"
      "--health-cmd=mc-health"
      "--health-start-period=10m"
      "--health-interval=5s"
      "--health-retries=20"
      "--health-timeout=1s"
      "--pull=newer"
    ];
    podman = {
      sdnotify = "healthy";
    };
  };
  networking.firewall.allowedTCPPorts = [ 25565 ];
}
