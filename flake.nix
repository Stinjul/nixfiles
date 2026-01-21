{
  description = "Nix(os) configs";
  # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/flake.nix

  nixConfig = {
    extra-substituters = [ "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nixpkgs 25.05
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # https://wiki.hyprland.org/Nix/Cachix/
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neorg = {
    #   url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    #   # https://github.com/NixOS/nixpkgs/issues/356274
    #   # https://github.com/nvim-neorg/nixpkgs-neorg-overlay/pull/11
    #   # url = "github:nvim-neorg/nixpkgs-neorg-overlay?ref=pull/11/head";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-generators,
      deploy-rs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (
        system:
        import nixpkgs {
          inherit system;
          overlays = builtins.attrValues outputs.overlays;
          config.allowUnfree = true;
        }
      );
    in
    {
      # Custom packages
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });

      # Overlay for custom packages
      overlays = import ./overlays { inherit inputs; };
      # Custom modules
      nixosModules = import ./modules/nixos;
      # Custom home-manager modules
      homeManagerModules = import ./modules/home-manager;

      # installers
      prd-pi-installer = nixos-generators.nixosGenerate {
        system = "aarch64-linux";
        modules = [ ./installers/prd-pi.nix ];

        format = "sd-aarch64-installer";
      };

      mgmt-nuc-installer = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [ ./installers/mgmt-nuc.nix ];

        format = "install-iso";
      };

      # 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
        zennix = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/zennix ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/wsl ];
        };
        nixtop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/nixtop ];
        };
        prd-pi-1 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/prd-pi-1.nix ];
        };
        prd-pi-2 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/prd-pi-2.nix ];
        };
        prd-pi-3 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/prd-pi-3.nix ];
        };
        prd-ms01-1 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/prd-ms01-1.nix ];
        };
        prd-ms01-2 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/prd-ms01-2.nix ];
        };
        prd-ms01-3 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/prd-ms01-3.nix ];
        };
        mgmt-nuc-1 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/mgmt-nuc-1.nix ];
        };
        mgmt-nuc-2 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/mgmt-nuc-2.nix ];
        };
        mgmt-nuc-3 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/mgmt-nuc-3.nix ];
        };
        asrock-big-boy = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./hosts/homelab/asrock-big-boy ];
        };

      };

      # 'home-manager --flake .#stinjul@hostname'
      homeConfigurations = {
        "stinjul@zennix" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/stinjul/zennix ];
        };
        "stinjul@zentoo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/stinjul/zentoo ];
        };
        "stinjul@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/stinjul/wsl ];
        };
        "stinjul@nixtop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [ ./home-manager/stinjul/nixtop.nix ];
        };
      };

      deploy = {
        sshUser = "deploy";
        user = "root";
        nodes = {
          nixtop = {
            hostname = "192.168.1.4";
            profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.nixtop;
          };
          asrock-big-boy = {
            hostname = "172.16.10.20";
            profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.asrock-big-boy;
          };
          mgmt-nuc-1 = {
            hostname = "172.16.10.5";
            profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.mgmt-nuc-1;
          };
          mgmt-nuc-2 = {
            hostname = "172.16.10.6";
            profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.mgmt-nuc-2;
          };
          mgmt-nuc-3 = {
            hostname = "172.16.10.7";
            profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.mgmt-nuc-3;
          };
          prd-pi-1 = {
            hostname = "172.16.0.15";
            profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.prd-pi-1;
          };
          prd-pi-2 = {
            hostname = "172.16.0.16";
            profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.prd-pi-2;
          };
          prd-pi-3 = {
            hostname = "172.16.0.17";
            profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.prd-pi-3;
          };
        };
      };
      checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
