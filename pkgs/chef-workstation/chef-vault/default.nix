{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "chef-vault";

  inherit ruby;
  gemdir = ./.;

  exes = [ "chef-vault" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
