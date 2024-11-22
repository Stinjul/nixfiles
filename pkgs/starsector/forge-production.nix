{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "forge-production";
  version = "1.1.5";

  src = fetchzip {
    url = "https://github.com/Alaricdragon/ForgeProduction/archive/ab20707939afe11536bd78c51e8cacaccc50b562.zip";
    sha256 = "sha256-t/PUHJmZur+0mmbD9WSIoDxLzA2yFDbUvzVf3D/Kbmw=";
  };
}
