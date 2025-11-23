{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

let
  cargoToml = fromTOML (builtins.readFile ./Cargo.lock);
in
rustPlatform.buildRustPackage rec {
  pname = cargoToml.package.name;
  version = cargoToml.package.version;
  revision = "c02da6a48664194d98ff2f0b6711054a2a155673";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-yz1yGYbqvqExYA6EEV0JEkQ/mtF2kC2uTMNg36ipbb0=";
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
