{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "inspec-bin";

  inherit ruby;
  gemdir = ./.;

  exes = [ "inspec" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
