{
  buildStarsectorMod,
  fetchzip,
  p7zip
}:
buildStarsectorMod rec {
  pname = "graphicslib";
  version = "1.9.0";

  src = fetchzip {
    url = "https://bitbucket.org/DarkRevenant/graphicslib/downloads/GraphicsLib_${version}.7z";
    nativeBuildInputs = [ p7zip ];
    sha256 = "sha256-ZnpTOQTwzfBPKKBbRZ/yuBcSHc9QgOF2iXYCm63h4pY=";
  };
}
