{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "nomadic-survival";
  version = "1.4.0";

  src = fetchzip {
    url = "https://github.com/NateNBJ/NomadicSurvival/releases/download/v${version}/Nomadic.Survival.zip";
    sha256 = "sha256-5W+YuuEEw2TF/2FNIwP7WRqF6XQ65jd2/AON3kNnFP4=";
  };
}
