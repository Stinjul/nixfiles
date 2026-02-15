{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    # https://github.com/NixOS/nixpkgs/issues/490442
    # argocd
    kustomize
    ksops
    k3s
    kubernetes-helm
    kustomize-kcl
  ];
  home = {
    persistence = {
      "/persist" = {
        files = [
          ".kube/config"
        ];
      };
    };
  };
  programs.k9s = {
    enable = true;
    plugins = {
      raw-logs-follow = {
        shortCut = "Ctrl-L";
        description = "logs -f";
        scopes = [ "po" ];
        command = "kubectl";
        background = false;
        args = [
          "logs"
          "-f"
          "$NAME"
          "-n"
          "$NAMESPACE"
          "--context"
          "$CONTEXT"
        ];
      };
      log-less = {
        shortCut = "Shift-L";
        description = "logs|less";
        scopes = [ "po" ];
        command = "bash";
        background = false;
        args = [
          "-c"
          "\"$@\" | less"
          "dummy-arg"
          "kubectl"
          "logs"
          "$NAME"
          "-n"
          "$NAMESPACE"
          "--context"
          "$CONTEXT"
        ];
      };
      log-less-container = {
        shortCut = "Shift-L";
        description = "logs|less";
        scopes = [ "containers" ];
        command = "bash";
        background = false;
        args = [
          "-c"
          "\"$@\" | less"
          "dummy-arg"
          "kubectl"
          "logs"
          "-c"
          "$NAME"
          "$POD"
          "-n"
          "$NAMESPACE"
          "--context"
          "$CONTEXT"
        ];
      };
    };
    settings = {
      k9s = {
        liveViewAutoRefresh = false;
        screenDumpDir = "${config.xdg.stateHome}/k9s/screen-dumps";
        refreshRate = 2;
        maxConnRetry = 5;
        readOnly = false;
        noExitOnCtrlC = false;
        ui = {
          enableMouse = false;
          headless = false;
          logoless = false;
          crumbsless = false;
          reactive = false;
          noIcons = false;
          defaultsToFullScreen = false;
          skin = "dark";
        };
        skipLatestRevCheck = false;
        disablePodCounting = false;
        shellPod = {
          image = "busybox:1.35.0";
          namespace = "default";
          limits = {
            cpu = "100m";
            memory = "100Mi";
          };
        };
        imageScans = {
          enable = false;
          exclusions = {
            namespaces = [ ];
            labels = { };
          };
        };
        logger = {
          tail = 100;
          buffer = 5000;
          sinceSeconds = -1;
          textWrap = false;
          showTime = false;
        };
        thresholds = {
          cpu = {
            critical = 90;
            warn = 70;
          };
          memory = {
            critical = 90;
            warn = 70;
          };
        };
      };
    };
  };
}
