{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "progressive-smods";
  version = "1.0.2";

  src = fetchzip {
    url = "https://github.com/qcwxezda/Starsector-Progressive-S-Mods/releases/download/v${version}/Progressive.S-Mods.zip";
    sha256 = "sha256-ockWyzD+4oZ8u5rcDF5eNSnVNtYCj0UXpxvQ4SmVTmA=";
  };
}
