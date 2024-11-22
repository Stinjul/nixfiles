{
  buildStarsectorMod,
  fetchurl,
  p7zip
}:
buildStarsectorMod rec {
  pname = "volkov-industrial-conglomerate";
  version = "1.6.3a";

  src = fetchurl {
    url = "https://github.com/AstaratStarsector/VIC/releases/download/${version}/VIC.${version}.zip";
    sha256 = "sha256-ey7guMU9Zb9F3ru/XMYUBn4Y2v/n+DIqRaFhNB4Kexs=";
  };

  unpackCmd = ''${p7zip}/bin/7z x -aoa "$curSrc" -osource'';
  sourceRoot = "source/VIC";
}
