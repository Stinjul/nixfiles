{
  buildGoModule,
  fetchFromGitHub,
  stdenv,
  lib,
  writeText,
}:

buildGoModule rec {
  pname = "tanzu";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "tanzu-cli";
    rev = "v${version}";
    sha256 = "sha256-7uzFS3+bVcDFYIYPSEi8lpJJuKtnWx//g6/B2PFqdy8=";
  };

  vendorHash = "sha256-IEPPozcUhsd3Y/p+pikgSfhqj4uJz+wAqym5DymfRg8=";

  # doCheck = false;

  preBuild = ''
    export GOWORK=off
  '';

  # ldflags = [
  #   "-X github.com/vmware-tanzu/tanzu-cli/pkg/buildinfo.Version=main.Version=${version}"
  # ];

  subPackages = [ "cmd/tanzu" ];
}
