{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "chef-cli";

  inherit ruby;
  gemdir = ./.;

  exes = [ "chef-cli" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
