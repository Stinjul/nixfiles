{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "cookstyle";

  inherit ruby;
  gemdir = ./.;

  exes = [ "cookstyle" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
