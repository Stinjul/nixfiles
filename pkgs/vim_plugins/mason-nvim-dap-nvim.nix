{ vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "mason-nvim-dap.nvim";
  version = "v2.2.0";
  src = fetchFromGitHub {
    owner = "jay-babu";
    repo = "mason-nvim-dap.nvim";
    rev = "f0cd12f7a8a310c58cecebddb6b219ffad1cfd0f";
    sha256 = "0l41mx0xdva1yr9igvd8m17glswy5bxknrsnbm6gclz5xf21v3d1";
  };
  meta.homepage = "https://github.com/jay-babu/mason-nvim-dap.nvim";
}
