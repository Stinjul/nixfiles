{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kustomize-kcl";
  version = "0.10.2";

  src = fetchFromGitHub {
    owner = "kcl-lang";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-CDTysdwkxX5p4GONbs9WMMTV9s3ASwega9BJpI0eCXU=";
  };

  vendorHash = "sha256-wiK/YKDP39RibhM3CIoE+ksEXbWJoqVOKFw2yrejLtg=";

  doCheck = false;

  meta = with lib; {
    description = "Kustomzie KCL Function";
    homepage = "https://github.com/kcl-lang/kustomize-kcl";
    license = licenses.asl20;
  };
}
