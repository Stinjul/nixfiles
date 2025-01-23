{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "lazylib";
  version = "2.8b";

  src = fetchzip {
    url = "https://github.com/LazyWizard/lazylib/releases/download/${version}/LazyLib.${version}.zip";
    sha256 = "sha256-u9usk9JChw2y152cbAYeyELHPkpHjfgFlzIliP/Ph/I=";
  };
}
