{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-virtues-of-society";
  version = "1.2.0";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1L9e1sFNh5FdfrppBEDoZEWiZOcKhAAmN";
    sha256 = "sha256-r3q4PteZAkTtZeh5bpqI5eAXLlfi2Ctpar4gITbLSNo=";
    extension = "zip";
  };
}
