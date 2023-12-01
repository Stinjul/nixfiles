{ inputs, outputs, pkgs, ... }: {
  imports = [
    ./global
  ];

  home.packages = with pkgs; [
    k6
    jmeter
    elixir_ls
    talosctl
    rnix-lsp
    prismlauncher
    pkgs.inputs.nixgl.nixGLIntel
    apache-directory-studio
    avalonia-ilspy
    devspace
    starsector
    font-manager
    bundix
    chef-cli
    cookstyle
    knife
    berkshelf
    test-kitchen
    inspec-bin
    chef-vault
    vault
    keystore-explorer
    jd-gui
    azure-cli
    nodePackages.cdktf-cli
    visualvm
    ventoy
    chromium
    globalprotect-openconnect
    payload-dumper-go
    robo3t
    r2modman
    gp-saml-gui
    grpc-client-cli
    trackma-full
    eww-wayland
    gdbgui
    yubikey-manager-qt
    yubikey-personalization-gui
    grpcurl
    nixpkgs-fmt
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
