{ vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "kcl.nvim";
  version = "v1.15.0";
  src = fetchFromGitHub {
    owner = "kcl-lang";
    repo = "kcl.nvim";
    rev = "d24f88cd973698defd38023607ac75d2a3848c11";
    sha256 = "sha256-+LX/cP9SMTynfNNTcpAEBSy8LKQVBMgbOAEdIj96T8s=";
  };
  meta.homepage = "https://github.com/kcl-lang/kcl.nvim";
}
