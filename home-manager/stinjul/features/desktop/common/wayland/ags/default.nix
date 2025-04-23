{ inputs, pkgs, lib, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    bun
    dart-sass
    fd
  ];

  programs.ags = {
    enable = true;
    #package = pkgs.inputs.ags.agsFull;
    extraPackages = with pkgs.inputs.ags; [
      mpris
      network
      tray
      hyprland
      # (hyprland.overrideAttrs (old: {
      #   patches = [
      #     (builtins.toFile "ws_notif.patch" ''
      #       diff --git a/lib/hyprland/hyprland.vala b/lib/hyprland/hyprland.vala
      #       index ea95cab..36696a2 100644
      #       --- a/hyprland.vala
      #       +++ b/hyprland.vala
      #       @@ -364,6 +364,7 @@ public class Hyprland : Object {
      #                    case "moveworkspacev2":
      #                        yield sync_workspaces();
      #                        yield sync_monitors();
      #       +                notify_property("workspaces");
      #                        break;
      #        
      #                    case "renameworkspace":
      #     '')
      #   ];
      # }))
      wireplumber
      notifd
    ];
    configDir = ./config_v2;
    systemd.enable = true;
  };
  systemd.user.services.ags.Service.Restart = lib.mkForce "on-abort";
}
