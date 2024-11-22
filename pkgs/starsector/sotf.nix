{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "secrets-of-the-frontier";
  version = "0.14.2c";

  src = fetchzip {
    url = "https://github.com/InventRaccoon/secrets-of-the-frontier/releases/download/v${version}/Secrets.of.the.Frontier.${version}.zip";
    sha256 = "sha256-ZDjmGgcFgSKR2UWNU/Nv8/NZmH+Zrx2QS9mUL69VBSM=";
  };
}
