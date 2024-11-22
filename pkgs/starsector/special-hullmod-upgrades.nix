{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "special-hullmod-upgrades";
  version = "1.5";

  src = fetchzip {
    url = "https://github.com/CremeDeFramboise/Special-Hullmod-Upgrades/releases/download/v${version}/Special.Hullmod.Upgrades.zip";
    sha256 = "sha256-I8EzI7SruAVkAfuEs+sk1QDsVuBFIBqjf3D2sN7Hnl8=";
  };
}
