{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "building-menu-overhaul";
  version = "1.1.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1wS1aLrJeV8VtDDOH9wYK8jq9pOEH38F7";
    sha256 = "sha256-mljFDg7et0prZ4miDHLy2DARHgvtZ57LNnC9N2nef6M=";
    extension = "zip";
  };
}
