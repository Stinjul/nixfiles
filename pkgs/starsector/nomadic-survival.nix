{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "nomadic-survival";
  version = "1.4.1";

  src = fetchzip {
    url = "https://github.com/NateNBJ/NomadicSurvival/releases/download/v${version}/Nomadic.Survival.zip";
    sha256 = "sha256-/dfXnrX+rYwG0MCGj/qE/FRXLHcTp43kg8X5wSEMofI=";
  };
}
