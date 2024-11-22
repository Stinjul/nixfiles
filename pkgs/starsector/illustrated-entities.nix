{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "illustrated-entities";
  version = "1.1.b";

  src = fetchzip {
    url = "https://bitbucket.org/SirHartley/illustrated.entites/downloads/Illustrated.Entities${version}.zip";
    sha256 = "sha256-QtqFssS5biWuZ10iP/cfk5JWaJrPS8e/RrvlDzi9Lhg=";
  };
}
