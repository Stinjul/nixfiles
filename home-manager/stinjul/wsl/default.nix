{ config, inputs, outputs, pkgs, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ../global
    ../features/neovim

    ./git.nix
  ];

  home.packages = with pkgs; [
    vagrant-wsl
    chef-cli
    cookstyle
    knife
    berkshelf
    test-kitchen
    inspec-bin
    chef-vault
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
  };

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
