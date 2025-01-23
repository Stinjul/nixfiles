{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-virtues-of-society";
  version = "1.2.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1L9e1sFNh5FdfrppBEDoZEWiZOcKhAAmN";
    sha256 = "sha256-ZhbRw4Uk6AlS2kncR3kgz5ydJxCCsg6IGUbnMN1SihE=";
    extension = "zip";
  };
}
