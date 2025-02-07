{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "random-assortment-of-things";
  version = "2.5.10";

  src = fetchzip {
    url = "https://github.com/Lukas22041/Random-Assortment-of-Things/releases/download/${version}/Random-Assortment-of-Things.zip";
    sha256 = "sha256-NuXVpz2iCJazuYSMxoOIofUorqwP/41KugbKH75uNNI=";
  };
}
