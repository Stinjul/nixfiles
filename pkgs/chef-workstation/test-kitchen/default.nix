{ bundlerApp }:

bundlerApp {
  pname = "test-kitchen";
  gemdir = ./.;
  exes = [ "kitchen" ];
}
