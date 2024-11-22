{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "progressive-smods";
  version = "1.0.0";

  src = fetchzip {
    url = "https://github.com/qcwxezda/Starsector-Progressive-S-Mods/releases/download/v${version}/Progressive.S-Mods.zip";
    sha256 = "sha256-Q7JUEofFu0G9koxF0rVgH05YCDuaFbnE1NvwJFsxsMg=";
  };
}
