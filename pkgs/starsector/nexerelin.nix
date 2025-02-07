{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "nexerelin";
  version = "0.11.3c";

  src = fetchzip {
    url = "https://github.com/Histidine91/Nexerelin/releases/download/v${version}/Nexerelin_${version}.zip";
    sha256 = "sha256-inh4dZDgMDC+/8rT7J262W4dKegfn2TzEPPry1oiIts=";
  };
}
