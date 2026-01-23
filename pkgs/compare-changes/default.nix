{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.7.15";
  revision = "cb2ca7469399598dc5fae8a5fb164aac5118f5f7";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-u42Mv3URvAMRysLHOg+3Q5lmJD6uZtwGnHf6/xxds+Y=";
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
