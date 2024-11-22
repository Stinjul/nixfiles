{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "luddic-enhancement";
  version = "1.2.6e";

  src = fetchzip {
    url = "https://bitbucket.org/King_Alfonzo/i-will-make-sindria-great-again/downloads/Luddic_Enhancement_${builtins.replaceStrings ["."] ["_"] version}.zip";
    sha256 = "sha256-sqzDr0QAdVnQclOQXFe+0/kzO6JtfPE80XFiPmDsNjo=";
  };
}
