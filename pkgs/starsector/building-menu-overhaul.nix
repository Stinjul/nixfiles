{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "building-menu-overhaul";
  version = "1.1.4";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1wS1aLrJeV8VtDDOH9wYK8jq9pOEH38F7";
    sha256 = "sha256-z6CtXCxNSsPYWXPH5OjputBo29wClsgAZ4nAzOyLOao=";
    extension = "zip";
  };
}
