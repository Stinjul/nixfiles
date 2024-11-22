# https://gitgud.io/KindaStrange/dassault-mikoyan-engineering-dme/-/raw/master/Dassault-Mikoyan%20Engineering-1.9eDEV.zip?ref_type=heads&inline=false
{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "dassault-mikoyan-engineering";
  version = "1.9eDEV";

  src = fetchzip {
    url = "https://gitgud.io/KindaStrange/dassault-mikoyan-engineering-dme/-/raw/master/Dassault-Mikoyan%20Engineering-${version}.zip?ref_type=heads&inline=false";
    sha256 = "sha256-Q5GZ8xTiBKejjnqJ/KR0Oj0uerXPwD2ZP+ZysHsZZ4o=";
    extension = "zip";
  };
}
