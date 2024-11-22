{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "hmi-supervillains";
  version = "0.0.5c";

  src = fetchzip {
    url = "https://bitbucket.org/King_Alfonzo/i-will-make-sindria-great-again/downloads/HMI_Supervillains_${
      builtins.replaceStrings [ "." ] [ "_" ] version
    }.zip";
    sha256 = "sha256-9rK6GTMBTu8h65fvhML9g7gI/v0AVDqO36n9bsPmEEo=";
  };
}
