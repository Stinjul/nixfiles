{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-ashlib";
  version = "1.0.2";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1rtCUH6htJqSs-nn8LLxxzAaUb4dkgOTU";
    sha256 = "sha256-5tJClkQa+kGWKVzZVjdqWpwkglZNzkgsuCUrHBc7n/k=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashlib_";
}
