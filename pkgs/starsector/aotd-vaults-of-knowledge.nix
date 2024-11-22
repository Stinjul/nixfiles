{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-vaults-of-knowledge";
  version = "2.4.11";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1rtCUH6htJqSs-nn8LLxxzAaUb4dkgOTU";
    sha256 = "sha256-avPaOCMpCWGJuqRJYyHFBQ68LkLWzYtvFPp6x+IWB18=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashes\ of\ \ The Domain-\ Vaults\ of\ Knowledge";
}
