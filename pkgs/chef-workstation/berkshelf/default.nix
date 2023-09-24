{ bundlerApp }:

bundlerApp {
  pname = "berkshelf";
  gemdir = ./.;
  exes = [ "berks" ];
}
