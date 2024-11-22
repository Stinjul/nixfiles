{
  buildStarsectorMod,
  fetchzip,
  jaq,
  fixjson,
  gnused,
}:
buildStarsectorMod rec {
  pname = "scalartech-solutions";
  version = "0.9.1";

  src = fetchzip {
    url = "https://github.com/niatahl/tahlan-scalartech/releases/download/${version}/scalartech-solutions-${version}.zip";
    sha256 = "sha256-KkpUIwEgkMeph1xPQ6SINjC/GezzJZ/REG9gKNtkNzw=";
  };
  # I HATE JSON COMMENTS I HATE JSON COMMENTS I HATE JSON COMMENTS
  buildPhase = ''
    ${gnused}/bin/sed -i 's|#.*||' ./mod_info.json
    ${fixjson}/bin/fixjson -w ./mod_info.json
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' ./mod_info.json
  '';
}
