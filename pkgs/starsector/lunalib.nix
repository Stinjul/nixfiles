{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "lunalib";
  version = "1.8.5";

  src = fetchzip {
    url = "https://github.com/Lukas22041/LunaLib/releases/download/${version}/LunaLib.zip";
    sha256 = "sha256-xxRK1aA7GxsvQdlNVHkhIbL3M3UmVMvWPfZ0m2/Jr7E=";
  };
}
