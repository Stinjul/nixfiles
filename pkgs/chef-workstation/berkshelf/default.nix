{ ruby, bundlerApp, bundlerUpdateScript }:

bundlerApp {
  pname = "berkshelf";

  inherit ruby;
  gemdir = ./.;

  exes = [ "berks" ];

  passthru.updateScript = bundlerUpdateScript "chef-cli";
}
