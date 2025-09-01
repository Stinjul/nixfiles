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
  trackma-full = pkgs.trackma.override { withQT = true; };
  discord-mod = pkgs.discord.override {
    withOpenASAR = true;
    withVencord = true;
  };
  bibata-hyprcursor = pkgs.callPackage ./bibata-hyprcursor { };
  # starsectorMods = pkgs.lib.recurseIntoAttrs (pkgs.callPackage ./starsector { });
  trios = pkgs.callPackage ./trios { };
  tanzu-cli = pkgs.callPackage ./tanzu-cli { };

  # I switched to the upstream package only to notice they don't put ksops in the path
  # Like bruh, this is literally mentioned in the readme as a sanity check
  ksops = pkgs.kustomize-sops.overrideAttrs (prev: {
    installPhase = ''
      mkdir -p $out/bin
      mv $GOPATH/bin/kustomize-sops $out/bin/ksops
    '';
  });

  kustomize-kcl = pkgs.callPackage ./kustomize-kcl { };

  # See the comment block in the thunderbolt-network-frr.nix module
  # This should go away whenever the relevant PR gets merged
  frr-fixed = pkgs.frr.overrideAttrs (prev: {
    configureFlags = pkgs.lib.lists.forEach prev.configureFlags (
      x: if x == "--sbindir=$(out)/libexec/frr" then "--sbindir=${placeholder "out"}/libexec/frr" else x
    );
    postPatch = ''
      substituteInPlace tools/frr-reload \
        --replace-quiet /usr/lib/frr/ $out/libexec/frr/
      sed -i '/^PATH=/ d' tools/frr.in tools/frrcommon.sh.in
    '';
  });

  xivlauncher-gamemode = pkgs.xivlauncher.override {
    steam = pkgs.steam.override { extraLibraries = pkgs: [ pkgs.gamemode.lib ]; };
  };

  # Disabled/Unifished packages
  # nuget-to-nix_7 = pkgs.nuget-to-nix.override { dotnet-sdk = pkgs.dotnet-sdk_7; };
  # powershell-editor-services = pkgs.callPackage ./powershell-editor-services { };
}
