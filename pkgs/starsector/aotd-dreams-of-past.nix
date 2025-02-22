{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-cryosleeper-options";
  version = "3.0.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1Tmw7cgx32a1jd-wYc41TJbNBepo4kgmZ";
    sha256 = "sha256-AQdlr+xCuACtdkrVJDu90c81Kv1srdiwwvCDhPiasb8=";
    extension = "zip";
  };
}
