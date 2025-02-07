{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-cryosleeper-options";
  version = "3.0.0";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1Tmw7cgx32a1jd-wYc41TJbNBepo4kgmZ";
    sha256 = "sha256-/pdQ+xgF1AhNmR9HeMKU79heRcRTtf0K1sIapJL8HRc=";
    extension = "zip";
  };
}
