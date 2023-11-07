{ config, ... }: {
  sops = {
    secrets = {
      git_config = {
        path = "${config.xdg.configHome}/git/secret_config.gitconfig";
      };
      git_config_1 = {
        path = "${config.xdg.configHome}/git/secret_config_1.gitconfig";
      };
      git_config_2 = {
        path = "${config.xdg.configHome}/git/secret_config_2.gitconfig";
      };
    };
  };

  programs.git = {
    enable = true;
    includes = [
        {
            path = "${config.sops.secrets.git_config.path}";
        }
    ];
  };
}
