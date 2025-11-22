{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.1.4";
  revision = "b7400df0edfff91d61a7c896455c751bf9d4b0b8";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-ZkhFFvukp2z0zYhVhNuSAFdsqYWDlNtuQwz/wMRBQuY=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = {
    homepage = "http://anttiharju.dev/compare-changes/";
    description = "WIP";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
