{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "magiclib";
  version = "1.4.6";

  src = fetchzip {
    url = "https://github.com/MagicLibStarsector/MagicLib/releases/download/${version}/MagicLib.zip";
    sha256 = "sha256-mjbzl3Eke3G/GOks3yUk34knie02x2CalSH4xvqhTYE=";
  };
}
