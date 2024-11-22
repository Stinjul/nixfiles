{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "retrolib";
  version = "1.0.1";

  src = fetchzip {
    url = "https://github.com/SafariJohn/Roider-Union/raw/main/RetroLib%20${version}.zip";
    sha256 = "sha256-96gZZoUvNlAJZ7Xepb7k+kuaOHHjh7GwJXraEj1qQGI=";
  };
}
