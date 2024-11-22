{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "substance-abuse";
  version = "1.1.c";

  src = fetchzip {
    url = "https://bitbucket.org/SirHartley/substance.abuse/downloads/Substance.Abuse${version}.zip";
    sha256 = "sha256-hcRLNDVfCXJ+r2k+JT/tmeYr/Crqjw83LN/bKQVLPJg=";
  };
}
