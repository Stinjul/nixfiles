{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "sephira-conclave";
  version = "1.6eDEV";

  src = fetchzip {
    url = "https://gitgud.io/KindaStrange/sephira-conclave-bb/-/raw/master/Sephira%20Conclave-${version}.zip";
    sha256 = "sha256-30ec2kFa6kLsSd8dHd9+E3Y5fj9X/76t6pTvRni+iN8=";
  };
}
