{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-cryosleeper-options";
  version = "3.0.0";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1TMkvYUEyJQBkimgd30BkXHOcmOzTfAun";
    sha256 = "sha256-bRlN0bstOnmtOOAaVBsZ9K+Ds4lJG/i+CQVU7bWy4bw=";
    extension = "zip";
  };
}
