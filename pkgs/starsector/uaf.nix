{
  buildStarsectorMod,
  fetchzip,
  unrar,
}:
buildStarsectorMod {
  pname = "united-aurora-federation";
  version = "0.75c";

  src = fetchzip {
    url = "https://drive.usercontent.google.com/download?id=1xRcAdj_trLbtevcahPGuNfopgYambsq0&export=download&confirm=t";
    nativeBuildInputs = [ unrar ];
    extension = "rar";
    sha256 = "sha256-bk5s35LdNQsVDdoKwX3xAJN9pQrXLGQLN81hjRzFW3g=";
  };
}
