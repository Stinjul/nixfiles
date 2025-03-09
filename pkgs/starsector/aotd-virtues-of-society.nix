{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod {
  pname = "aotd-virtues-of-society";
  version = "1.3.2";

  src = fetchzip {
    url = "https://drive.google.com/uc?export=download&id=1L9e1sFNh5FdfrppBEDoZEWiZOcKhAAmN";
    sha256 = "sha256-nNMPbEygo3Ql1tWtq8UUfQb1O2MqwUZA9CXayhCxfkU=";
    extension = "zip";
  };
}
