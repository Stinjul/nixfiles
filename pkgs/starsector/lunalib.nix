{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "lunalib";
  version = "1.8.6";

  src = fetchzip {
    url = "https://github.com/Lukas22041/LunaLib/releases/download/${version}/LunaLib.zip";
    sha256 = "sha256-F+5CESaWHufk0NHoGirajlT0GDaUzEb63TBW3Wbx37k=";
  };
}
