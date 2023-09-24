{ bundlerApp }:

bundlerApp {
  pname = "cookstyle";
  gemdir = ./.;
  exes = [ "cookstyle" ];
}
