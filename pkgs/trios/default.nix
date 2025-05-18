{
  flutter,
  sentry-native,
  fetchFromGitHub,
  lib,
  stdenv,
}:

flutter.buildFlutterApplication rec {
  pname = "trios";
  version = "1.1.10";

  src = fetchFromGitHub {
    owner = "wispborne";
    repo = "TriOS";
    rev = version;
    hash = "sha256-+GSVokkKYItGwYctKB8B/bcxFeZFdXXLx4z96q7mKpQ=";
    fetchSubmodules = true;
  };

  pubspecLock = lib.importJSON ./pubspec.lock.json;
  gitHashes = {
    open_filex = "sha256-U6h3yAw0L7ZoQdviAz9YRuHBy9TwGVLQiRTH+Hl9R0g=";
    window_size = "sha256-Y113BPSxlNnera/3Dq2BYAX1YiGbCrVgJsfClnLNhjk=";
  };

  customSourceBuilders = {
    sentry_flutter =
      { version, src, ... }:
      stdenv.mkDerivation rec {
        pname = "sentry_flutter";
        inherit version src;
        inherit (src) passthru;
        
        # TODO: The following feels like a hack, but I just can't seem to find a way to pass this to the underlying cmake
        ## If anyone finds this, be warned that this is not passing the exact version needed, but it seems to work fine so far.
        ## I should probably do a proper fetchFromGithub, but w/e.
        postPatch = ''
          sed -i '/include(FetchContent)/a SET(FETCHCONTENT_SOURCE_DIR_SENTRY-NATIVE "${sentry-native.src}")' ./sentry-native/sentry-native.cmake
        '';

        installPhase = ''
          runHook preInstall

          cp -r . $out

          runHook postInstall
        '';
      };
  };
}
