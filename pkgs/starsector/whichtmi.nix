{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "whichtmi";
  version = "1.2.0";

  src = fetchzip {
    url = "https://github.com/PrincessOfEvil/WhichTMI/archive/refs/tags/${version}.zip";
    sha256 = "sha256-l9TLPUQ40pZ2dxvIzw/HHOEXa6ENyuGRtxOvnC4pWJw=";
  };
}
