{
  buildStarsectorMod,
  requireFile,
  p7zip
}:
buildStarsectorMod rec {
  pname = "stinger-shipyards";
  version = "8.1.0";

  src = requireFile {
    # Need to replace first space in "Stinger Shipyards" with "-"
    name = "Stinger-Shipyards-69-${builtins.replaceStrings ["."] ["-"] version}-1728770340.zip";
    url = "https://www.nexusmods.com/starsector/mods/69?tab=files&file_id=972";
    # You can fetch and hash in one command
    # nix hash to-sri --type sha256 $(nix-prefetch-url --type sha256 file:///path/to/Stinger-Shipyards-69-8-1-0-1728770340.zip)
    sha256 = "sha256-uvjE+CAnc0AHHE8lzeDTPruHHNeE73DnnBoOeuYwixk=";
  };

  unpackCmd = ''${p7zip}/bin/7z x -aoa "$curSrc" -osource'';
  sourceRoot = "source/What\ remains\ of\ Stinger\ Shipyards";
  
  postInstall = ''
    mv $out/graphics/ships/lg/sex_gryphon_lg.png $out/graphics/ships/lg/sex_gryphon_LG.png
    # This makes sure GC doesn't touch it so you don't have to redownload it whenever you run GC
    ln -s $src $out/source.zip
  '';
}
