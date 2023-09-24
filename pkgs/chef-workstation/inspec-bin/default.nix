{ bundlerApp }:

bundlerApp {
  pname = "inspec-bin";
  gemdir = ./.;
  exes = [ "inspec" ];
}
