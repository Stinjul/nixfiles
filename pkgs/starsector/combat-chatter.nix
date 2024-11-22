{
  buildStarsectorMod,
  fetchzip,
}:
buildStarsectorMod rec {
  pname = "combat-chatter";
  version = "1.14.2";

  src = fetchzip {
    url = "https://github.com/Histidine91/SS-CombatChatter/releases/download/v${version}/CombatChatter_${version}.zip";
    sha256 = "sha256-o14GmxK/jOkNYp7PSB6Avo4Fbcm9XmqvNjtPkEiuWYw=";
  };
}
