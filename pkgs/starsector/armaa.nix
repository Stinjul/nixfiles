{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "armaa";
  version = "3.1.5";

  src = fetchzip {
    url = "https://github.com/gomarz/SS-armaa/releases/download/v${version}/SS-armaa-${version}.zip";
    sha256 = "sha256-MnfN6zLH1tvsrlIw2OQuK7XuUHExgh1N42g2fQPnv+c=";
    stripRoot = false;
  };
  
  sourceRoot = "source/SS-armaa-${version}";
}
