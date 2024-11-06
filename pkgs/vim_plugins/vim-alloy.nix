{ vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin rec {
  pname = "vim-alloy";
  version = "2024-05-11";
  src = fetchFromGitHub {
    owner = "grafana";
    repo = pname;
    rev = "0273f88f7199189f9a0f32213a34ab778e226f86";
    sha256 = "sha256-lUOVfbdmEBuuIyxTFkWy7R3Sem6DnC6pjmu8XJWJYM8=";
  };
  meta.homepage = "https://github.com/grafana/vim-alloy";
}
