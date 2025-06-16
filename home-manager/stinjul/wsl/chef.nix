{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    chef-cli
    cookstyle
    knife
    berkshelf
    test-kitchen
    inspec-bin
    chef-vault
  ];

  sops = {
    secrets = {
      chef_key_1 = {
        path = "${config.home.homeDirectory}/.chef/chef_key_1.pem";
      };
      chef_server_1_name = { };
      chef_server_1_client_name = { };
      chef_server_1_server_url = { };
    };
    templates = {
      "chef-credentials.toml" = {
        content = builtins.readFile (
          (pkgs.formats.toml { }).generate "chef-credentials-sops-template" {
            "${config.sops.placeholder.chef_server_1_name}" = {
              "client_name" = "${config.sops.placeholder.chef_server_1_client_name}";
              "client_key" = "${config.sops.secrets.chef_key_1.path}";
              "chef_server_url" = "${config.sops.placeholder.chef_server_1_server_url}";
            };
          }
        );
        path = "${config.home.homeDirectory}/.chef/credentials";
      };
    };
  };

  # home.file.".chef/credentials".source = config.sops.templates."chef-credentials.toml".path;
}
