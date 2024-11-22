{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "nexerelin";
  version = "0.11.2c";

  src = fetchzip {
    url = "https://github.com/Histidine91/Nexerelin/releases/download/v0.11.2c/Nexerelin_${version}.zip";
    sha256 = "sha256-cYdlzsDH74PH4mhuYDfqsZJGje8T1e5NvhKF/T8D/os=";
  };
}
