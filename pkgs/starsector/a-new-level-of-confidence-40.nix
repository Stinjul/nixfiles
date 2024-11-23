{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "a-new-level-of-confidence-40";
  version = "3.2";

  src = fetchzip {
    url = "https://drive.google.com/u/0/uc?id=12Ib3x43T3rfZGFbZQhsru9NJ2KO_F0Wn&export=download";
    extension = "zip";
    sha256 = "sha256-wX//vzl/FH+2pRftmRJx0ThSHpWCSI3pdtXUtJ/iY8Y=";
  };
}
