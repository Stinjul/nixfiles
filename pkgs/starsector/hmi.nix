{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "hazard-mining-incorporated";
  version = "0.3.8f";

  src = fetchzip {
    url = "https://www.dropbox.com/scl/fi/6z9shu29bt1p3henaowb0/HMI_${
      builtins.replaceStrings [ "." ] [ "_" ] version
    }.zip?rlkey=cbsvy7e39u2ahku43btvcbgap&st=q999gs77&dl=1";
    sha256 = "sha256-GJ5lwjfWYKgjHrsFs1esl4S9D7qZtgqMjTjgtEhUiQY=";
    extension = "zip";
  };
}
