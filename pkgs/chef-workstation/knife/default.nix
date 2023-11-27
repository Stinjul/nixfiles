{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "knife";

  inherit ruby;
  gemdir = ./.;

  exes = [ "knife" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
