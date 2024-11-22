{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "commissioned-crews";
  version = "1.999999gggg";

  src = fetchzip {
    url = "https://github.com/TechpriestEnginseer/solid-winner/releases/download/${version}/Commissioned.Crews.zip";
    sha256 = "sha256-wpMeqmia8tdbOCAIBk7LCi3/vVLEqGr519N+FDHDlXM=";
  };
}
