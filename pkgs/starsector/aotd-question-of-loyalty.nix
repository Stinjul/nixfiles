{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-question-of-loyalty";
  version = "2.0.2";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1wSQzwfkMKqBhgPWuo6_rAcdfIfsotkmM";
    sha256 = "sha256-+Ieusl/ixTCzgiRtjwm62/h1eQjQo5/6PfyMMyYGSH0=";
    extension = "zip";
  };
}
