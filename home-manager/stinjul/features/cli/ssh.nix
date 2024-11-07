{
  config,
  lib,
  ...
}:
let
in
# hasPersistence = options.home ? "persistence" && config.home.persistence ? "/persist/home/stinjul";
{
  programs.ssh = {
    enable = lib.mkDefault true;
  };

  home.persistence."/persist/home/stinjul".files = [
    ".ssh/known_hosts"
  ];

  # home = { }
  #   // lib.optionalAttrs hasPersistence {
  #   persistence."/persist/home/stinjul".files = [
  #     ".ssh/known_hosts"
  #   ];
  # };
}
