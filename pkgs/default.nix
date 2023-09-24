{ pkgs ? import <nixpkgs> { } }: rec {
  # old-zstd = pkgs.callPackage ./zstd { };
  cookstyle = pkgs.callPackage ./chef-workstation/cookstyle { };
  knife = pkgs.callPackage ./chef-workstation/knife { };
  test-kitchen = pkgs.callPackage ./chef-workstation/test-kitchen { };
  berkshelf = pkgs.callPackage ./chef-workstation/berkshelf { };
  chef-cli = pkgs.callPackage ./chef-workstation/chef-cli { };
  inspec-bin = pkgs.callPackage ./chef-workstation/inspec-bin { };
  chef-vault = pkgs.callPackage ./chef-workstation/chef-vault { };
  starsector-mod-manager-rust = pkgs.callPackage ./starsector-mod-manager-rust { };
  trackma-full = pkgs.trackma.override { withQT = true; };
  eww-wayland = pkgs.eww.override { withWayland = true; };
}
