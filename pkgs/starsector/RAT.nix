{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "random-assortment-of-things";
  version = "2.5.6";

  src = fetchzip {
    url = "https://github.com/Lukas22041/Random-Assortment-of-Things/releases/download/${version}/Random-Assortment-of-Things.zip";
    sha256 = "sha256-cvrr6OZRftkCJ8nLBqMRkDCg3aIbdsRwuGAsD3CWNbc=";
  };
}
