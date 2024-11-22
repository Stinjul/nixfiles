{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "everybody-loves-koc";
  version = "1.04.44a";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1nhNF-OFdp_bP9GLPql-zZqXeRTR9JrMl";
    sha256 = "sha256-H/TPvuvJAXhndzB+UYf19GFW/UmTNj65dhtraODXMqc=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/+Ko\ ${version}";
}
