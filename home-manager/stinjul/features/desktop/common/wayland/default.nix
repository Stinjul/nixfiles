{ pkgs, ... }: {
  imports = [
    ./kitty
    ./rofi.nix
    # ./ags
    ./quickshell
  ];
  home.packages = with pkgs; [
    wayvnc
  ];
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
  };
}
