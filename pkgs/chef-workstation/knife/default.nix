{ bundlerApp }:

bundlerApp {
  pname = "knife";
  gemdir = ./.;
  exes = [ "knife" ];
}
