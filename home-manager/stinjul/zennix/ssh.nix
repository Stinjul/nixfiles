{ config, ... }: {
  sops.secrets = {
    ssh_config = {
      path = "${config.home.homeDirectory}/.ssh/secret_config";
    };
    ssh_key_1 = {
      path = "${config.home.homeDirectory}/.ssh/key_1";
    };
    ssh_key_zennix = {
      path = "${config.home.homeDirectory}/.ssh/yk_25_809_123_zennix";
    };
    ssh_key_deploy = {
      path = "${config.home.homeDirectory}/.ssh/yk_25_809_123_deploy";
    };
  };

  programs.ssh = {
    enable = true;
    extraConfig = "IdentityFile ${config.sops.secrets.ssh_key_zennix.path}";
    matchBlocks = {
      "deploy" = {
        match = "host 172.16.0.* user deploy";
        identityFile = config.sops.secrets.ssh_key_deploy.path;
      };
      "github" = {
        hostname = "github.com";
        identityFile = config.sops.secrets.ssh_key_zennix.path;
      };
      "gitlab" = {
        hostname = "gitlab.com";
        identityFile = config.sops.secrets.ssh_key_zennix.path;
      };
      "default key" = {
        host = "*";
        identityFile = config.sops.secrets.ssh_key_zennix.path;
      };
    };
    includes = [
      config.sops.secrets.ssh_config.path
    ];
  };
}
