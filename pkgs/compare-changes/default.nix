{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.7.13";
  revision = "791129d4011f71b4b59110c79d07c73ed92c4308";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-1ldnXLVlWSOI8lqcbscJH7VjOXosfQJc/sTGOymDFXc=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  buildFeatures = [ "cli" ];

  meta = {
    homepage = "http://anttiharju.dev/compare-changes/";
    description = "For use with find-changes-action";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
