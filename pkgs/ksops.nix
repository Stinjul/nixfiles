{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ksops";
  version = "4.2.4";

  src = fetchFromGitHub {
    owner = "viaduct-ai";
    repo = "kustomize-sops";
    rev = "v${version}";
    hash = "sha256-zCNYjxwKmfZlsEHH89IoUNYVqaQK3dayIZXNCSZg5uY=";
  };

  vendorHash = "sha256-IoQ3Hyyhk0jsEPyEajRa7HQrgV6ykLCj9vjTIQYOQtw=";

  doCheck = false;

  postBuild = ''
    mv $GOPATH/bin/kustomize-sops $GOPATH/bin/ksops
  '';

  meta = with lib; {
    description = "A Flexible Kustomize Plugin for SOPS Encrypted Resource";
    homepage = "https://github.com/viaduct-ai/kustomize-sops";
    license = licenses.asl20;
  };
}
