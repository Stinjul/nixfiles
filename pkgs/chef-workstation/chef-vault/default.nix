{ bundlerApp }:

bundlerApp {
  pname = "chef-vault";
  gemdir = ./.;
  exes = [ "chef-vault" ];
}
