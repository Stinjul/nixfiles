{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "nexerelin";
  version = "0.11.3b";

  src = fetchzip {
    url = "https://github.com/Histidine91/Nexerelin/releases/download/v${version}/Nexerelin_${version}.zip";
    sha256 = "sha256-5LTCQHHxTz14Jy0Y/WLM0bvYU8JJe+DMy5+p8Kui7fg=";
  };
}
