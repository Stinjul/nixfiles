{
  lib,
  rustPlatform,
  fetchFromGitHub,
  protobuf,
  pkg-config,
  rustc,
}:
rustPlatform.buildRustPackage rec {
  pname = "kcl-language-server";
  version = "0.9.3";

  src = fetchFromGitHub {
    owner = "kcl-lang";
    repo = "kcl";
    rev = "v${version}";
    hash = "sha256-nk5oJRTBRj0LE2URJqno8AoZ+/342C2tEt8d6k2MAc8=";
  };

  sourceRoot = "${src.name}/kclvm";
  cargoBuildFlags = [
    "--manifest-path"
    "tools/src/LSP/Cargo.toml"
  ];
  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "inkwell-0.2.0" = "sha256-JxSlhShb3JPhsXK8nGFi2uGPp8XqZUSiqniLBrhr+sM=";
      "protoc-bin-vendored-3.1.0" = "sha256-RRqpPMJygpKGG5NYzD93iy4htpVqFhYMmfPgbRtpUqg=";
    };
  };

  buildInputs = [ rustc ];

  nativeBuildInputs = [
    pkg-config
    protobuf
  ];

  patches = [ ./enable_protoc_env.patch ];

  PROTOC = "${protobuf}/bin/protoc";
  PROTOC_INCLUDE = "${protobuf}/include";

  meta = with lib; {
    description = "A high-performance implementation of KCL written in Rust that uses LLVM as the compiler backend";
    homepage = "https://github.com/kcl-lang/kcl";
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}
