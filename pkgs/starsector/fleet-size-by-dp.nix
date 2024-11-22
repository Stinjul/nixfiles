{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "fleet-size-by-dp";
  version = "1.0.2b";

  src = fetchzip {
    url = "https://bitbucket.org/Chozo/fleetsizebydp/downloads/FleetSizeByDP-${version}_97.zip";
    sha256 = "sha256-j6g9rzWST2QencMC60ah0gsf1wRQK2C3s1H/ndYzCXI=";
  };
}
