{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "too-much-information";
  version = "0.98a";

  src = fetchzip {
    url = "https://github.com/TechpriestEnginseer/solid-winner8/releases/download/${version}/Too.Much.Information.zip";
    sha256 = "sha256-jpVnM+eKneHXIzFYzDH9aRPKYbvM4Hf6FAOI+ne5u+4=";
  };
}
