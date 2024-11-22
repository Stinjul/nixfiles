{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "brighton-federation";
  version = "0.0.3d";

  src = fetchzip {
    url = "https://bitbucket.org/King_Alfonzo/i-will-make-sindria-great-again/downloads/HMI_brighton_${
      builtins.replaceStrings [ "." ] [ "_" ] version
    }.zip";
    sha256 = "sha256-8wa6oozNiKov/X3qSQvy2/kWWnM2olbKCWTpV8ElTBY=";
  };
}
