{ 
  lib,
  fetchFromGitHub,
  rustPlatform,
  glib,
  gtk3,
  libarchive,
  libsoup,
  libxkbcommon,
  webkitgtk_4_1,
  pkg-config
}:

rustPlatform.buildRustPackage {
  pname = "starsector-mod-manager-rust";
  version = "c3b929d";

  src = fetchFromGitHub {
    owner = "atlanticaccent";
    repo = "starsector-mod-manager-rust";
    rev = "c3b929d8c9e2d243ce597dcbc1320f075e54279f";
    sha256 = "sha256-V7iTZGY1gcCltFyBg5Abnvg9H2Dg/mgL6VK7kWFQ0hI=";
  };

  buildInputs = [
    glib
    gtk3
    libarchive
    libsoup
    libxkbcommon
    webkitgtk_4_1
  ];

  nativeBuildInputs = [ pkg-config rustPlatform.bindgenHook ];

  RUSTC_BOOTSTRAP = 1;

    checkFlags =
    let
      # Most of Blightmud's unit tests pass without trouble in the isolated
      # Nixpkgs build env. The following tests need to be skipped.
      skipList = [
        "app::settings::jre::test::azul"
        "app::settings::jre::test::coretto"
        "app::settings::jre::test::does_not_revert_when_no_original"
        "app::settings::jre::test::hotspot"
        "app::settings::jre::test::installs_even_if_actual_is_missing_and_unmanaged"
        "app::settings::jre::test::returns_early_if_flavour_already_installed"
        "app::settings::jre::test::revert_when_original_present_and_unmanaged"
        "app::settings::jre::test::wisp"
      ];
      skipFlag = test: "--skip " + test;
    in
    builtins.concatStringsSep " " (builtins.map skipFlag skipList);

  cargoPatches = [ ./rustc-serialize.patch ];

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "druid-0.8.3" = "sha256-lB8hiYzb8k3kMQw3OCMIkw+wnbb+R8rjgwSr3nLqgQo=";
      "druid-material-icons-0.2.0" = "sha256-S6DiqdAn5Xhh8J42pXYi7LWx8VF9HZQH/jKJGwhVTVI=";
      "druid-widget-nursery-0.1.0" = "sha256-mlSPfM2ZQeLFD2XQmlGPpo8QQx6ORkDcpbrTP5PzAFQ=";
      "handwritten-json-0.1.0" = "sha256-BCROwGC2oBFDbghJcUAnrvWolUv+TTc/bJ0maL/CuxU=";
      "interprocess-1.1.1" = "sha256-T8+HJA/qBOsbHMNHb5RWAumgCul5Te7DNy1C9iYiCek=";
      "piet-0.6.2" = "sha256-rySXwN6+KL0rk0MyBqcb3SJQqNo+YZPYWxRWp1MBM1o=";
      "wry-0.34.2" = "sha256-u2X8opkISuRLYZ6und4lZb9E6RAVymu7HPzAZLbQ+bw=";
    };
  };

  meta = with lib; {
    description = "A mod manager for Starsector, a space fleet-battle and economics simulator.";
    homepage = "https://github.com/atlanticaccent/starsector-mod-manager-rust";
    license = licenses.mit;
    mainProgram = "starsector_mod_manager_rust";
  };
}
