{
  config,
  options,
  lib,
  ...
}:
let
  hasPersistence = options.home ? "persistence" && config.home.persistence ? "/persist";
in
{
  programs.ssh = {
    enable = lib.mkDefault true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      userKnownHostsFile = "${lib.optionalString hasPersistence "/persist"}${config.home.homeDirectory}/.ssh/known_hosts";
    };
  };

  # home.persistence."/persist".files = [
  #   {
  #     file = ".ssh/known_hosts";
  #     method = "symlink";
  #   }
  # ];

  # home = { }
  #   // lib.optionalAttrs hasPersistence {
  #   persistence."/persist/home/stinjul".files = [
  #     ".ssh/known_hosts"
  #   ];
  # };
}
