{
  buildStarsectorMod,
  fetchzip,
  jaq,
}:
buildStarsectorMod {
  pname = "space-truckin";
  version = "1.4a";

  src = fetchzip {
    url = "https://www.patreon.com/file?h=83991095&m=207179822";
    sha256 = "sha256-9deH7iSVYfV3wNx2uQpBgACWaw8zKnFQmC9EIPQYkec=";
    extension = "zip";
  };
  postInstall = ''
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' $out/mod_info.json
  '';
}
