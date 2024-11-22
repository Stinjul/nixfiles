{
  buildStarsectorMod,
  fetchzip,
  jaq,
}:
buildStarsectorMod rec {
  pname = "stellar-networks";
  version = "3.1.3";

  src = fetchzip {
    url = "https://github.com/jaghaimo/stelnet/releases/download/${version}/stelnet-${version}.zip";
    sha256 = "sha256-hnjypn3aaz6DdDFWtEk0U9i50gcI40wQ5eNdrRmayn0=";
  };
  buildPhase = ''
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' ./mod_info.json
  '';
}
