{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-ashlib";
  version = "1.0.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1rtCUH6htJqSs-nn8LLxxzAaUb4dkgOTU";
    sha256 = "sha256-avPaOCMpCWGJuqRJYyHFBQ68LkLWzYtvFPp6x+IWB18=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashlib_";
}
