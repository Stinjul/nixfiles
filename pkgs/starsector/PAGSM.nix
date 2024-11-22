{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "phillip-andrada-gas-station-manager";
  version = "1.14.1";

  src = fetchzip {
    url = "https://drive.usercontent.google.com/download?id=1i3fX4z1B8ecS9ZsRUxVs_xvuLGA2zyDn&export=download&confirm=t";
    sha256 = "sha256-YkLTE32ZPa2Slf/ehoAys2QtmlHBCoVjCJgvEXFJpK4=";
    extension = "zip";
  };
}
