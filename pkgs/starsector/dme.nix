# https://gitgud.io/KindaStrange/dassault-mikoyan-engineering-dme/-/raw/master/Dassault-Mikoyan%20Engineering-1.9eDEV.zip?ref_type=heads&inline=false
{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "dassault-mikoyan-engineering";
  version = "1.9eHijacked";

  src = fetchzip {
    url = "https://gitgud.io/Meiyu/sephira-conclave/-/raw/b3aede0bc054769fa1422c64cf5f96554010e148/downloads/DME.zip";
    sha256 = "sha256-Mau292IrYfCMzQv2c7ReOCVm0QSZ/o4NJI4Zt+Fz76Y=";
  };
}
