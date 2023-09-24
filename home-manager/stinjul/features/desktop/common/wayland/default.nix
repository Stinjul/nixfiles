{
  imports = [
    ./kitty.nix
    ./rofi.nix
  ];
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
  };
}
