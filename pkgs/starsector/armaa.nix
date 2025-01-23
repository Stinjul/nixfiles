{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "armaa";
  version = "3.0.6"; # This file was swapped with a hotfixed version 3.0.6.1, but idk

  src = fetchzip {
    url = "https://github.com/gomarz/SS-armaa/releases/download/v${version}/SS-armaa-${version}.zip";
    sha256 = "sha256-fKiU7HSJCqiwOz2iC3z19W03U2kn1DqIzwEsWexgH7c=";
    stripRoot = false;
  };
  
  sourceRoot = "source/SS-armaa-${version}";
}
