{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "detailed-combat-results";
  version = "5.4.1";

  src = fetchzip {
    url = "https://bitbucket.org/NickWWest/starsectorcombatanalytics/downloads/DetailedCombatResults.${version}.zip";
    sha256 = "sha256-H6OAa0x0bwmpGD1O496PUmd+yKzGum5Wp21cPOzgt2A=";
  };
}
