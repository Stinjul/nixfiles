{ inputs, outputs, pkgs, config, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ../global

    ../features/persist.nix
    ../features/neovim
    ../features/desktop/hyprland

    ./ssh.nix
    ./git.nix
    ./monitors.nix
  ];

  sops = {
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
  };


  home.persistence."/persist/home/stinjul" = {
    directories = [
      "Work"
    ];
    files = [".config/sops/age/keys.txt"];
  };

  home.packages = with pkgs; [
  ];

  services = {
    blueman-applet.enable = true;
  };
  
  nix = {
    registry = {
      stinjul = {
        from = { type = "indirect"; id = "stinjul"; };
        flake = {
          outPath = "/home/stinjul/Git/nixfiles";
        };
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    monitor =
      # let
      #   disp1 = "DP-2";
      #   disp2 = "DP-3";
      #   dispKVM = "HDMI-A-1";
      # in
      # [
      #   "${disp1}, 2560x1440@120, 0x0, 1, transform, 3"
      #   "${disp2}, 2560x1440@120, 1440x0, 1"
      #   "${dispKVM}, preferred, 5000x0, 1"
      # ];
      map (
        m: "${m.name}, ${
            if m.enabled
            then "${toString m.width}x${toString m.height}@${toString m.refreshRate}, ${toString m.x}x${toString m.y}, 1"
            else "disable"
        }, transform, ${toString ((builtins.div m.rotate 90) + (if m.flipped then 4 else 0))}"
      ) (config.monitors);
  };
}