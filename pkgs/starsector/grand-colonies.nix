{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "grand-colonies";
  version = "2.0.f";

  src = fetchzip {
    url = "https://bitbucket.org/SirHartley/grand.colonies/downloads/Grand.Colonies${version}.zip";
    sha256 = "sha256-C39XSTP5yABMZ/w6cYNuOOKEHGRWMSXa4uVvca3iUWk=";
  };
}
