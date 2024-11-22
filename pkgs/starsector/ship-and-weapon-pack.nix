{
  buildStarsectorMod,
  fetchzip,
  p7zip
}:
buildStarsectorMod rec {
  pname = "ship-and-weapon-pack";
  version = "1.15.1";

  src = fetchzip {
    url = "https://bitbucket.org/modmafia/ship-weapon-pack/downloads/Ship_and_Weapon_Pack_${version}.7z";
    nativeBuildInputs = [ p7zip ];
    sha256 = "sha256-puZeVF9e4LKybKCct75fh3szRalTGvltgj2ziEz1l/o=";
  };
}
