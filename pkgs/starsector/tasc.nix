{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "terraforming-and-station-construction";
  version = "9.0.10";

  src = fetchzip {
    url = "https://github.com/boggledstarsector/TASC/raw/refs/heads/${version}/release/Terraforming%20and%20Station%20Construction.zip";
    sha256 = "sha256-D5nW151ZSuEBhXCRTVPAXjFWZRPtY4Drbc1fYu4p4Y0=";
  };
}
