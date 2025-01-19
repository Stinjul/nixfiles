{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.services.k3s;
  yamlFormat = pkgs.formats.yaml { };
in
{
  options.services.k3s = {
    registries = lib.mkOption {
      type = lib.types.nullOr yamlFormat.type;
      default = null;
      example = {
        mirrors."docker.io".endpoint = [ "https://registry.example.com:5000" ];
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.etc."rancher/k3s/registries.yaml" = lib.mkIf (cfg.registries != null) {
      source = yamlFormat.generate "registries.yaml" cfg.registries;
    };
  };
}
