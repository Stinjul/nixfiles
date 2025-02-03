{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    argocd
    kustomize
    kustomize-sops
    k3s
    kubernetes-helm
    kustomize-kcl
  ];
  home = {
    persistence = {
      "/persist${config.home.homeDirectory}" = {
        files = [
          ".kube/config"
        ];
      };
    };
  };
  programs.k9s = {
    enable = true;
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
            namespaces =  [];
            labels =  {};
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
