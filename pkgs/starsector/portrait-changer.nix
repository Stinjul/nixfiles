{
  buildStarsectorMod,
  fetchzip,
  unrar,
  jaq,
}:
buildStarsectorMod {
  pname = "portrait-changer";
  version = "1.0.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1NZDVAR3EmMVjQmy8jBIcud3zNw7SJYEO";
    nativeBuildInputs = [ unrar ];
    extension = "rar";
    sha256 = "sha256-cbQsCcaiTdrpLC4QX9KS4moGu3LWdgSqoBoI8MnZW10=";
  };
  postInstall = ''
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' $out/mod_info.json
  '';
}
