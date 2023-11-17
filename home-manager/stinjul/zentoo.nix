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
    pkgs.yubikey-manager-qt
    pkgs.yubikey-personalization-gui
    pkgs.grpcurl
  ];

  programs.fish = {
    interactiveShellInit =
    ''
    set -x MANPAGER "nvim +Man!"
    set -x EDITOR "nvim"
    set -x TERMINAL "kitty"
    set -x BROWSER "firefox"
    set -x VIRTUAL_ENV_DISABLE_PROMPT 1
    set -x PIPENV_VENV_IN_PROJECT 1
    set -x TEXINPUT .:/home/stan/Documents/School/templates/:$TEXINPUT
    set -x DOTNET_ROOT "/opt/dotnet_core"
    set -x SPARK_LOCAL_IP "127.0.0.1"
    set -x WIREPLUMBER_DEBUG "3"
    set -x _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on"
    set -x XDG_CURRENT_DESKTOP "sway"
    set -x NIX_PATH $HOME/.nix-defexpr/channels
    
    fish_vi_key_bindings
    fish_add_path $HOME/go/bin/
    fish_add_path $HOME/.krew/bin/
    fish_add_path $HOME/.cargo/bin
    '';
  };
}
