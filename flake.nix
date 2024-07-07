{
  description = "Nix(os) configs";
  # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/flake.nix

  nixConfig = {
    extra-substituters = [ "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
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
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nixos-generators, deploy-rs, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
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
      mgmt-pi-installer = nixos-generators.nixosGenerate {
        system = "aarch64-linux";
        modules = [
          ./installers/mgmt-pi.nix
        ];

        format = "sd-aarch64-installer";
      };

      mgmt-nuc-installer = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          ./installers/mgmt-nuc.nix
        ];

        format = "install-iso";
      };

      # 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
        zennix = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/zennix ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/wsl ];
        };
        nixtop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/nixtop ];
        };
        mgmt-pi-1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/homelab/mgmt-pi-1.nix ];
        };
        mgmt-pi-2 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/homelab/mgmt-pi-2.nix ];
        };
        mgmt-pi-3 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/homelab/mgmt-pi-3.nix ];
        };
        mgmt-nuc-1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/homelab/mgmt-nuc-1.nix ];
        };
      };

      # 'home-manager --flake .#stinjul@hostname'
      homeConfigurations = {
        "stinjul@zennix" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/stinjul/zennix
          ];
        };
        "stinjul@zentoo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/stinjul/zentoo
          ];
        };
        "stinjul@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/stinjul/wsl
          ];
        };
        "stinjul@nixtop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/stinjul/nixtop.nix
          ];
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
          mgmt-nuc-1 = {
            hostname = "172.16.10.5";
            profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.mgmt-nuc-1;
          };
          mgmt-pi-1 = {
            hostname = "172.16.0.10";
            profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.mgmt-pi-1;
          };
          mgmt-pi-2 = {
            hostname = "172.16.0.11";
            profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.mgmt-pi-2;
          };
          mgmt-pi-3 = {
            hostname = "172.16.0.12";
            profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.mgmt-pi-3;
          };
        };
      };
      checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
