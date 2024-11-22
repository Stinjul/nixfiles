{
  buildStarsectorMod,
  fetchzip,
  p7zip
}:
buildStarsectorMod rec {
  pname = "underworld";
  version = "1.8.3";

  src = fetchzip {
    url = "https://bitbucket.org/modmafia/underworld/downloads/Underworld_${version}.7z";
    nativeBuildInputs = [ p7zip ];
    sha256 = "sha256-J1ajPP/AkINuEHpC/RJyeUZUuJB3r8hOCfHLHCZVPmE=";
  };
}
