{
  buildStarsectorMod,
  fetchzip,
  p7zip,
}:
buildStarsectorMod rec {
  pname = "interstellar-imperium";
  version = "2.6.4";

  src = fetchzip {
    url = "https://bitbucket.org/DarkRevenant/interstellar-imperium/downloads/Interstellar_Imperium_${version}.7z";
    nativeBuildInputs = [ p7zip ];
    sha256 = "sha256-0BteGt0+W1vowNMSTuQT82nRxiMOy39XJy67YXFNoJg=";
  };
}
