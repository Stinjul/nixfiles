{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-question-of-loyalty";
  version = "1.1.2";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1wSQzwfkMKqBhgPWuo6_rAcdfIfsotkmM";
    sha256 = "sha256-eAz8e7K+aEiomeniXuOPqvcV/CsBeTumd1xDQlqJcDA=";
    extension = "zip";
  };
}
