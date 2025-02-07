{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "refit-filters";
  version = "2.0.0";

  src = fetchzip {
    url = "https://github.com/Starficz/RefitFilters/releases/download/${version}/RefitFilters.zip";
    sha256 = "sha256-qoQtzybmc6Ogf3z/eXVH9XkFSase7TNlnZozSPb0NKQ=";
  };
}
