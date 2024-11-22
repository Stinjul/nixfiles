{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "console-commands";
  version = "2024.10.04";

  src = fetchzip {
    url = "https://github.com/LazyWizard/console-commands/releases/download/${version}/Console.Commands.${version}.zip";
    sha256 = "sha256-Y6IltrY1j4dKQYFc4v6TdbN/Qr/drk2za194GdKXz64=";
  };
}
