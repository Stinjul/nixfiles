{
  description = "Nix(os) configs";
  # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/flake.nix

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # WSL

    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
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
      url = "github:hyprwm/hyprland";
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
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      # Custom packages
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });

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

      # 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
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
      };

      # 'home-manager --flake .#stinjul@hostname'
      homeConfigurations = {
        "stinjul@zentoo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home-manager/stinjul/zentoo.nix
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
