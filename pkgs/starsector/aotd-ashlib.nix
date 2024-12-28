{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-ashlib";
  version = "1.0.4";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1gvck8DcbYSy_GHHp7_VFEqoRtdt9DXz5";
    sha256 = "sha256-iCYVkb2Q2qoAidamwGviz7zBR3+cafDsJOU+q432B8w=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashlib_";
}
