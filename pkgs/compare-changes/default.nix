{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.13.3";
  revision = "73c13b7385cb46ead7dc4bb58d58b4cd89e6bde1";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-7HICO4HpTpEzRuezJTRjpYJP3ZAH9GgDAWozgbx3AGg=";
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
