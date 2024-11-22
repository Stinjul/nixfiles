{
  buildStarsectorMod,
  fetchzip,
  jaq,
}:
buildStarsectorMod rec {
  pname = "autosave";
  version = "1.2b";

  src = fetchzip {
    url = "https://github.com/LazyWizard/autosave/releases/download/${version}/Autosave.${version}.zip";
    sha256 = "sha256-B/wNzywZPLF8jz+3xlG9K6Sb1zODYuPddYovG9mpzlY=";
  };
  postInstall = ''
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' $out/mod_info.json
  '';
}
