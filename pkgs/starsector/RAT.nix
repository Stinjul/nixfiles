{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "random-assortment-of-things";
  version = "2.5.5";

  src = fetchzip {
    url = "https://github.com/Lukas22041/Random-Assortment-of-Things/releases/download/${version}/Random-Assortment-of-Things.zip";
    sha256 = "sha256-+F+3QU3eGOJ36izP4Wb7lXsoTUG9v7zS1jF+9vZrLOk=";
  };
}
