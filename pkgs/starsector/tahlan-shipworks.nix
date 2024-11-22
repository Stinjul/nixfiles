{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "tahlan-shipworks";
  version = "1.3";

  src = fetchzip {
    url = "https://github.com/niatahl/tahlan-shipworks/releases/download/${version}/tahlan-shipworks-${version}.zip";
    sha256 = "sha256-mDryToVVmZkzJzBqEWGQS6HRphjGtNLlAMX3zry/dXM=";
  };
}
