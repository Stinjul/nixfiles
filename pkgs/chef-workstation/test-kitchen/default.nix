{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "test-kitchen";

  inherit ruby;
  gemdir = ./.;

  exes = [ "kitchen" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
