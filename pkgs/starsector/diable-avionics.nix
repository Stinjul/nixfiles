{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "diable-avionics";
  version = "2.9.2c";

  src = fetchzip {
    url = "https://github.com/CaymonJoestar/Diable-Avionics/releases/download/v${version}/Diable-Avionics.zip";
    sha256 = "sha256-NjRoqgJBF/DXog9c4rO4JEH/eW88MN8G01/kWz/d2tU=";
  };
}
