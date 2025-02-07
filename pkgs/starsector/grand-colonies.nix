{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "grand-colonies";
  version = "2.1.a";

  src = fetchzip {
    url = "https://bitbucket.org/SirHartley/grand.colonies/downloads/Grand.Colonies${version}.zip";
    sha256 = "sha256-Dw3npTutTXLfoXng7DnAfflwzU5sVi8W8ErjnkUM/Mg=";
  };
}
