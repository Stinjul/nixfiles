{
  config,
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}:
{
  sops = {
    secrets = {
      kubeconfig_1 = {
        path = "${config.home.homeDirectory}/.kube/kubeconfig_1";
      };
    };
  };
  home = {
    packages = with pkgs; [
      tanzu-cli
    ];
    sessionVariables = {
      KUBECONFIG = builtins.concatStringsSep ":" [
        "${config.home.homeDirectory}/.kube/config"
        # "${config.home.homeDirectory}/.kube/kubeconfig_1"
        config.sops.secrets.kubeconfig_1.path
      ];
    };
  };
}
