{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-vaults-of-knowledge";
  version = "3.1.1";

  src = fetchzip {
    # url = "https://drive.google.com/uc?export=download&id=1gvck8DcbYSy_GHHp7_VFEqoRtdt9DXz5";
    url = "https://drive.usercontent.google.com/download?id=1gvck8DcbYSy_GHHp7_VFEqoRtdt9DXz5&export=download&confirm=t";
    sha256 = "sha256-q0/DUzTZGjYE5o0nWHTQBw3zwX2bBPn9DQyjkvWOHII=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashes\ of\ \ The Domain-\ Vaults\ of\ Knowledge";
}
