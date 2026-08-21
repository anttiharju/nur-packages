{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.12.5";
  revision = "c5ebb46d8150a2c4ce50213ec0a7a803544dad4a";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-ZYYDQcDU5SeuWX820hEVf57d8tk0qQ9wgG7OL3oy4Lc=";
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
