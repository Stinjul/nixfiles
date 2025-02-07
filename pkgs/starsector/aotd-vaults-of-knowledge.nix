{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-vaults-of-knowledge";
  version = "3.1.3";

  src = fetchzip {
    # url = "https://drive.google.com/uc?export=download&id=1gvck8DcbYSy_GHHp7_VFEqoRtdt9DXz5";
    url = "https://drive.usercontent.google.com/download?id=1gvck8DcbYSy_GHHp7_VFEqoRtdt9DXz5&export=download&confirm=t";
    sha256 = "sha256-K29dD/pESGBRjIFKvUdjO/mfhrBVEGsW9CNwQRZUlYM=";
    extension = "zip";
    stripRoot = false;
  };

  sourceRoot = "source/Ashes\ of\ \ The Domain-\ Vaults\ of\ Knowledge";
}
