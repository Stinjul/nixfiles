{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-virtues-of-society";
  version = "1.2.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1L9e1sFNh5FdfrppBEDoZEWiZOcKhAAmN";
    sha256 = "sha256-JaP3l/aSfhYC2ElsMupEJNvMY/JtRkQDaskvz+vP/k0=";
    extension = "zip";
  };
}
