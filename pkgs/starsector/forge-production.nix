{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "forge-production";
  version = "1.1.7";

  src = fetchzip {
    url = "https://github.com/Alaricdragon/ForgeProduction/archive/4400d129a73edd95b6805d935218353ad201d3c8.zip";
    sha256 = "sha256-nl8Er4+YU8xHD5UWoYfUTBdSbaLw+oe5xFU0rzuoyfM=";
  };
}
