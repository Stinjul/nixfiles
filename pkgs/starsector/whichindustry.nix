{
  buildStarsectorMod,
  fetchzip,
  unrar,
  jaq,
}:
buildStarsectorMod {
  pname = "whichindustry";
  version = "1.0.0";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=19Uz3Bqu2qio8eKVEna810hDZxn8R8OW7";
    nativeBuildInputs = [ unrar ];
    extension = "rar";
    sha256 = "sha256-LFIAATtX5xdzK5vZn3cXooptO/Xu6sfYHAfqEmcu8rQ=";
  };
  buildPhase = ''
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' ./mod_info.json
  '';
}
