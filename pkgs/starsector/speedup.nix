{
  buildStarsectorMod,
  fetchzip,
  p7zip,
}:
buildStarsectorMod rec {
  pname = "speedup";
  version = "1.1.0";

  src = fetchzip {
    url = "https://bitbucket.org/DarkRevenant/speedup/downloads/SpeedUp_${version}.7z";
    sha256 = "sha256-/A93pYyx5U1i+J7H8qO2dAJEMZXedg0jwbqCnIyN+JU=";
    nativeBuildInputs = [ p7zip ];
  };
}
