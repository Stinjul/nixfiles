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

  installPhase = ''
    mkdir -p $out/lib/viaduct.ai/v1/ksops/
    mkdir -p $out/lib/viaduct.ai/v1/ksops-exec/
    mv $GOPATH/bin/kustomize-sops $out/lib/viaduct.ai/v1/ksops/ksops
    ln -s $out/lib/viaduct.ai/v1/ksops/ksops $out/lib/viaduct.ai/v1/ksops-exec/ksops-exec
  '';

  # Tests are broken in a nix environment
  doCheck = false;

  meta = with lib; {
    description = "A Flexible Kustomize Plugin for SOPS Encrypted Resource";
    longDescription = ''
      KSOPS can be used to decrypt any Kubernetes resource, but is most commonly
      used to decrypt encrypted Kubernetes Secrets and ConfigMaps.
    '';
    homepage = "https://github.com/viaduct-ai/kustomize-sops";
    license = licenses.asl20;
    maintainers = with maintainers; [ starcraft66 ];
  };
}
