{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "starship-legends";
  version = "2.5.2";

  src = fetchzip {
    url = "https://github.com/NateNBJ/StarshipLegends/releases/download/v${version}/Starship.Legends.zip";
    sha256 = "sha256-NKa1rkI1JTzwWeMUQMYJcU2IJMK76IbrASsvnQGSNV4=";
  };
}
