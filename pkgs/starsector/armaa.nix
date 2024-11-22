{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "armaa";
  version = "3.0.6";

  src = fetchzip {
    url = "https://github.com/gomarz/SS-armaa/releases/download/${version}/SS-armaa-${version}.zip";
    sha256 = "sha256-38DiwC6QxFIa/1ke5Y05ZRG2cxjAGoAzjAKWy3v6cpE=";
  };
}
