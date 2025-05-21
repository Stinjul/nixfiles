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

  meta = with lib; {
    description = "The Tanzu Core CLI project provides the core functionality of the Tanzu CLI. The CLI is based on a plugin architecture where CLI command functionality can be delivered through independently developed plugin binaries";
    homepage = "https://github.com/vmware-tanzu/tanzu-cli";
    license = licenses.asl20;
    maintainers = with maintainers; [ rkoster ];
  };
}
