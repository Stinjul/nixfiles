{ config, ... }: {
  sops = {
    secrets = {
      ssh_config = {
        path = "${config.home.homeDirectory}/.ssh/secret_config";
      };
      ssh_key_server_1 = {
        path = "${config.home.homeDirectory}/.ssh/key_server_1";
      };
    };
  };

  programs = {
    ssh = {
      includes = [
        "${config.sops.secrets.ssh_config.path}"
      ];
    };
  };
}
