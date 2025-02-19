{
  config,
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ../global
    ../features/neovim

    ./git.nix
    ./ssh.nix
  ];

  # TODO: fix this ugly hack when https://github.com/nix-community/impermanence/pull/171 gets fixed
  home.persistence = lib.mkForce { };

  home.packages = with pkgs; [
    # vagrant-wsl
    chef-cli
    cookstyle
    knife
    berkshelf
    test-kitchen
    inspec-bin
    chef-vault
    terraform
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  };

  sops.secrets.nix_github_access_token = { };

  nix.extraOptions = "!include ${config.sops.secrets.nix_github_access_token.path}";

  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        zentoo = {
          host = "10.8.0.1";
          identityFile = "~/.ssh/id_ed25519";
          localForwards = [
            {
              bind.port = 5900;
              host = {
                address = "127.0.0.1";
                port = 5900;
              };
            }
          ];
        };
      };
    };
  };
}
