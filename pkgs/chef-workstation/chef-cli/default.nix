{ bundlerApp }:

bundlerApp {
  pname = "chef-cli";
  gemdir = ./.;
  exes = [ "chef-cli" ];
}
