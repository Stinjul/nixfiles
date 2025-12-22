{
  flutter332,
  # sentry-native,
  fetchFromGitHub,
  lib,
  stdenv,
}:

flutter332.buildFlutterApplication rec {
  pname = "trios";
  version = "1.2.3";

  src = fetchFromGitHub {
    owner = "wispborne";
    repo = "TriOS";
    rev = version;
    hash = "sha256-7ljCn6NMi1jifbCYUhiieNt/cMzl31U528o8aJLZR7c=";
    fetchSubmodules = true;
  };

  pubspecLock = lib.importJSON ./pubspec.lock.json;
  gitHashes = {
    open_filex = "sha256-U6h3yAw0L7ZoQdviAz9YRuHBy9TwGVLQiRTH+Hl9R0g=";
    window_size = "sha256-Y113BPSxlNnera/3Dq2BYAX1YiGbCrVgJsfClnLNhjk=";
  };

  postInstall = ''
    chmod +x $out/app/trios/data/flutter_assets/assets/linux/7zip/x64/7zzs
  '';
}
