{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-virtues-of-society";
  version = "1.3.0";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1L9e1sFNh5FdfrppBEDoZEWiZOcKhAAmN";
    sha256 = "sha256-nrHnwms07NYGoc8mZKYv0yznqo4dAIq0uk6v4hkhmOc=";
    extension = "zip";
  };
}
