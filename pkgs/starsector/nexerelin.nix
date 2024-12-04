{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "nexerelin";
  version = "0.11.3";

  src = fetchzip {
    url = "https://github.com/Histidine91/Nexerelin/releases/download/v${version}/Nexerelin_${version}.zip";
    sha256 = "sha256-erY4o+kalMzSiBhE9Pt380k8ndvgrCDWGQ9FhWAgcZE=";
  };
}
