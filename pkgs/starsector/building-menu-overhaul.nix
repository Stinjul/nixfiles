{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "building-menu-overhaul";
  version = "1.0.1";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1wS1aLrJeV8VtDDOH9wYK8jq9pOEH38F7";
    sha256 = "sha256-Z76UsDgtZjx0fH4W6/1pxiZvqiC7376wmhtIArK3B+E=";
    extension = "zip";
  };
}
