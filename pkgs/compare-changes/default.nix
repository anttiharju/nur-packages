{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.12.13";
  revision = "2dc964bd4f91b94d66a83a527ee53985d3a8c5f7";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-yvI2v1XBlF5ohAL+t+QNvM/QNUgEbNK/7n3vfXFmzbk=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  cargoBuildFlags = [ "--all-features" ];

  postPatch = ''
    substituteInPlace Cargo.toml --replace-fail \
      $'[package]\n' \
      $'[package]\nversion = "${version}"\n'
    substituteInPlace Cargo.lock "$cargoDepsCopy/Cargo.lock" --replace-fail \
      $'name = "compare-changes"\nversion = "0.0.0"' \
      $'name = "compare-changes"\nversion = "${version}"'
  '';

  meta = {
    homepage = "https://anttiharju.dev/compare-changes";
    description = "Lib & CLI for GitHub workflow paths filter syntax";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
