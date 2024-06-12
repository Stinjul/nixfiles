{ pkgs ? import <nixpkgs> { } }: {
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
  discord-mod = pkgs.discord.override { withOpenASAR = true; withVencord = true; };
  starsector-mod-manager-rust = pkgs.callPackage ./starsector-mod-manager-rust { };


  # Disabled/Unifished packages
  # nuget-to-nix_7 = pkgs.nuget-to-nix.override { dotnet-sdk = pkgs.dotnet-sdk_7; };
  # powershell-editor-services = pkgs.callPackage ./powershell-editor-services { };
}
