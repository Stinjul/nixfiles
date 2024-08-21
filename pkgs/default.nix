{
  pkgs ? import <nixpkgs> { },
}:
{
  # old-zstd = pkgs.callPackage ./zstd { };
  cookstyle = pkgs.callPackage ./chef-workstation/cookstyle { };
  knife = pkgs.callPackage ./chef-workstation/knife { };
  test-kitchen = pkgs.callPackage ./chef-workstation/test-kitchen { };
  berkshelf = pkgs.callPackage ./chef-workstation/berkshelf { };
  chef-cli = pkgs.callPackage ./chef-workstation/chef-cli { };
  inspec-bin = pkgs.callPackage ./chef-workstation/inspec-bin { };
  chef-vault = pkgs.callPackage ./chef-workstation/chef-vault { };
  vagrant-wsl = pkgs.callPackage ./vagrant-wsl.nix { };
  ksops = pkgs.callPackage ./ksops.nix { };
  trackma-full = pkgs.trackma.override { withQT = true; };
  discord-mod = pkgs.discord.override {
    withOpenASAR = true;
    withVencord = true;
  };
  starsector-mod-manager-rust = pkgs.callPackage ./starsector-mod-manager-rust { };
  xivlauncher-manual = pkgs.callPackage ./xivlauncher { };
  bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor { };

  # Both seem to have the same result, but they also both build kclvm for some reason
  # Keeping the second one around just in case
  # kcl-language-server = pkgs.callPackage ./kcl-language-server { };
  kcl-language-server = pkgs.kclvm.override (prev: {
    rustPlatform = prev.rustPlatform // {
      buildRustPackage =
        args:
        prev.rustPlatform.buildRustPackage (
          args
          // {
            pname = "kcl-language-server";
            cargoBuildFlags = [
              "--manifest-path"
              "tools/src/LSP/Cargo.toml"
            ];
          }
        );
    };

  });

  xivlauncher-gamemode = pkgs.xivlauncher.override {
    steam = pkgs.steam.override { extraLibraries = pkgs: [ pkgs.gamemode.lib ]; };
  };

  # Disabled/Unifished packages
  # nuget-to-nix_7 = pkgs.nuget-to-nix.override { dotnet-sdk = pkgs.dotnet-sdk_7; };
  # powershell-editor-services = pkgs.callPackage ./powershell-editor-services { };
}
