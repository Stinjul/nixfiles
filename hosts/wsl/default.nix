{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl

    ../common/global
    ../common/users/stinjul
    ../common/features/pipewire.nix
  ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;
  };

  console.keyMap = "azerty";

  programs = {
    dconf.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  system.stateVersion = "23.11";
}
