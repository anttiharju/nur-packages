{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.12.3";
  revision = "383ac55ce97671f3ed08f310a08a43bb013b71d4";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-0fmase7Kr/6Fi28FzSXBPdVrJTJLzlmjAN1DEfK+9fs=";
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
    description = "For use with find-changes-action";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
