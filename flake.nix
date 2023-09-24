{
  description = "Nix(os) configs";
  # https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/flake.nix

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:nixos/nixos-hardware";
    nixgl.url = "github:guibou/nixGL";
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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

      # 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
        nixtop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
          ];
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
      };
    };
}
