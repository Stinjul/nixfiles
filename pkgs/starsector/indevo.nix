{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "industrial-evolution";
  version = "3.3.e";

  src = fetchzip {
    url = "https://bitbucket.org/SirHartley/deconomics/downloads/Industrial.Evolution${version}.zip";
    sha256 = "sha256-3v8v40oZ6G+gF8OurQuKcpSj2HE3aPkRM36XUiINggM=";
  };
}
