{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "sephira-conclave";
  version = "1.7c";

  src = fetchzip {
    url = "https://gitgud.io/Meiyu/sephira-conclave/-/raw/4cd6135b32a334244886c1ad892c3f54e271f17b/downloads/Sephira_Conclave.zip";
    sha256 = "sha256-O54nmloI1fKPCHfqwO5lLdxZMvh9kRnzP6/Yo840Fo0=";
  };
}
