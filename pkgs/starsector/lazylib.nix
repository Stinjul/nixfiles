{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "lazylib";
  version = "2.8b";

  src = fetchzip {
    url = "https://github.com/LazyWizard/lazylib/releases/download/${version}/LazyLib.${version}.zip";
    sha256 = "sha256-0HypoB/ZW/1HdHJMTxEktnbSBWQBjvuxAgoq6c2uzbs=";
  };
}
