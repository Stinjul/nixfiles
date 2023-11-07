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
      ssh_config = {
        path = "${config.home.homeDirectory}/.ssh/secret_config";
      };
      ssh_key_git_1 = {
        path = "${config.home.homeDirectory}/.ssh/key_git_1";
      };
      ssh_key_git_2 = {
        path = "${config.home.homeDirectory}/.ssh/key_git_2";
      };
    };
  };

  programs = {
    git = {
      enable = true;
      includes = [
        {
          path = "${config.sops.secrets.git_config.path}";
        }
      ];
    };
    ssh = {
      includes = [
        "${config.sops.secrets.ssh_config.path}"
      ];
    };
  };
}
