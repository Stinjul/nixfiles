{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    argocd
    kustomize
    k9s
    ksops
    k3s
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
}
