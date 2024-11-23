{
  buildStarsectorMod,
  fetchzip,
  jaq,
}:
buildStarsectorMod rec {
  pname = "automated-commands";
  version = "1.4";

  src = fetchzip {
    url = "https://github.com/borgrel/AutomatedCommands/releases/download/v${version}/AutomatedCommands.v${version}.zip";
    sha256 = "sha256-dHB1FmFyqsYbvd0Zfm4ITusu8CGgTnIqKYU5OtbUq80=";
  };
  postInstall = ''
    ${jaq}/bin/jaq -i '.gameVersion = "0.97a"' $out/mod_info.json
  '';
}
