{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "ruthless-sector";
  version = "1.6.2";

  src = fetchzip {
    url = "https://github.com/NateNBJ/RuthlessSector/releases/download/v${version}/Ruthless.Sector.zip";
    sha256 = "sha256-Y2rXzjWaUx4xcJ5z9aDY/qocqygt3GXdRlttiU2Xflk=";
  };
}
