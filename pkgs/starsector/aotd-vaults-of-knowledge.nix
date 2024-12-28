{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-vaults-of-knowledge";
  version = "3.0.3";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1gvck8DcbYSy_GHHp7_VFEqoRtdt9DXz5";
    sha256 = "sha256-iCYVkb2Q2qoAidamwGviz7zBR3+cafDsJOU+q432B8w=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashes\ of\ \ The Domain-\ Vaults\ of\ Knowledge";
}
