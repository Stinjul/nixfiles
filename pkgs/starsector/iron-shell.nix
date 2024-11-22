{
  buildStarsectorMod,
  fetchurl,
  p7zip
}:
buildStarsectorMod rec {
  pname = "iron-shell";
  version = "1.1813aj";

  src = fetchurl {
    url = "https://github.com/TechpriestEnginseer/solid-winner4/releases/download/${version}/Iron.Shell.zip";
    sha256 = "sha256-9/BEkOBR8nqYYVZZt+HLryrBAhkmlHPUY+T3ZTKt8lI=";
  };

  unpackCmd = ''${p7zip}/bin/7z x -aoa "$curSrc" -osource'';
  #sourceRoot = "source/Iron\ Shell\ ${version}"
  # version in zip is mangled >:(
  sourceRoot = "source/Iron\ Shell\ 1.183aj";
}
