{ vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "mason-nvim-dap.nvim";
  version = "v2.2.0";
  src = fetchFromGitHub {
    owner = "jay-babu";
    repo = "mason-nvim-dap.nvim";
    rev = "f0cd12f7a8a310c58cecebddb6b219ffad1cfd0f";
    sha256 = "0d3h8kjid7mkqzdhakbf9wiyj1vxrcw4n8dp678bxm0452n82vxl";
  };
  meta.homepage = "https://github.com/nvim-lua/plenary.nvim/";
}
