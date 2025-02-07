{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "everybody-loves-koc";
  version = "1.04.45a";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1m9LHINKcIsLoFiRoLuy9aU3hW28nhBUA";
    sha256 = "sha256-XWyF9NzD2mQ2FZoxLx6oH/DXviWEgC5Edhhq7r676N0=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/+Ko\ ${version}";
}
