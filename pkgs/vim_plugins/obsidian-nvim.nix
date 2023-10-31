{ vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "obisidan.nvim";
  version = "v1.15.0";
  src = fetchFromGitHub {
    owner = "epwalsh";
    repo = "obisidan.nvim";
    rev = "630c92045f0595123031b598c624dbad3b5f6dbc";
    sha256 = "0irnwlwpsr9dnq87dyvvz00rwzmqp6i0sc2n3h04b6nkqpgskdgz";
  };
  meta.homepage = "https://github.com/epwalsh/obsidian.nvim";
}
