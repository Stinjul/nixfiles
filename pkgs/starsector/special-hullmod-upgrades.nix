{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "special-hullmod-upgrades";
  version = "1.5a";

  src = fetchzip {
    url = "https://github.com/CremeDeFramboise/Special-Hullmod-Upgrades/releases/download/v${version}/Special.Hullmod.Upgrades.zip";
    sha256 = "sha256-teK5ykqiGjoJpEXNd94CqbDenD1bS8w69YyGb68348A=";
  };
}
