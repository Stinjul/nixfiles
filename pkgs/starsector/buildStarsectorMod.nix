{
  stdenv,
  gnused,
  fixjson,
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
}:
stdenv.mkDerivation (
  attrs
  // {
    inherit name;
    inherit sourceRoot;
    inherit unpackCmd;
    inherit unpackPhase configurePhase buildPhase;

    inherit preInstall postInstall;
    installPhase = ''
      runHook preInstall
      
      cp -r ./ $out
      
      # I HATE JSON COMMENTS I HATE JSON COMMENTS I HATE JSON COMMENTS
      ${gnused}/bin/sed -i 's|#.*||' $out/mod_info.json
      ${fixjson}/bin/fixjson -w $out/mod_info.json

      runHook postInstall
    '';
  }
)
