{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "roider-union";
  version = "2.1.1";

  src = fetchzip {
    url = "https://github.com/SafariJohn/Roider-Union/raw/refs/heads/main/Roider%20Union%20${version}.zip";
    sha256 = "sha256-WR8htzVbrP9QKGXk3skb9SbM5Byitf3cx4viqNwDPb0=";
  };
}
