{
  stdenv,
  p7zip,
}:

attrs@{
  pname,
  version,
  src,

  name ? "starsectormod-${pname}-${version}",
  unpackPhase ? "",
  configurePhase ? ":",
  buildPhase ? ":",
  preInstall ? "",
  postInstall ? "",

  sourceRoot ? "source",
  unpackCmd ? "",
  # nativeBuildInputs ? [ ],
}:
stdenv.mkDerivation (
  attrs
  // {
    inherit name;
    # inherit src;
    inherit sourceRoot;
    inherit unpackCmd;
    inherit unpackPhase configurePhase buildPhase;
    # nativeBuildInputs = [ p7zip ] ++ nativeBuildInputs;

    inherit preInstall postInstall;
    installPhase = ''
      runHook preInstall

      cp -r ./ $out

      runHook postInstall
    '';
  }
)
