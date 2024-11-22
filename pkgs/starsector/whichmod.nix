{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "whichmod";
  version = "1.2.2a";

  src = fetchzip {
    url = "https://github.com/theDragn/whichmod/releases/download/1.2.2/WhichMod_v${version}.zip";
    sha256 = "sha256-l9gxhXqnXOVK80otjxiPrLNl6Y84QmD4Y9sBin3F0wA=";
  };
}
