{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
  ];

  home.packages = [
    pkgs.k6
    pkgs.jmeter
    pkgs.elixir_ls
    pkgs.talosctl
    pkgs.rnix-lsp
    pkgs.prismlauncher
    pkgs.inputs.nixgl.nixGLIntel
    pkgs.apache-directory-studio
    pkgs.avalonia-ilspy
    pkgs.devspace
    pkgs.starsector
    pkgs.font-manager
    pkgs.bundix
    pkgs.chef-cli
    pkgs.cookstyle
    pkgs.knife
    pkgs.berkshelf
    pkgs.test-kitchen
    pkgs.inspec-bin
    pkgs.chef-vault
    pkgs.vault
    pkgs.keystore-explorer
    pkgs.jd-gui
    pkgs.azure-cli
    pkgs.nodePackages.cdktf-cli
    pkgs.visualvm
    pkgs.ventoy
    pkgs.chromium
    pkgs.globalprotect-openconnect
    pkgs.payload-dumper-go
    pkgs.robo3t
    pkgs.r2modman
    pkgs.gp-saml-gui
    pkgs.grpc-client-cli
    pkgs.trackma-full
    pkgs.eww-wayland
    pkgs.gdbgui

  ];
}
