{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.3.3";
  revision = "e2ce96cf956a3865f2539af0d72b5631d9b933da";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-8zB1ArYwqP48gQady3URN5+Iv5muYCSgQRERH3H9QBk=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = {
    homepage = "http://anttiharju.dev/compare-changes/";
    description = "For use with find-changes-action";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
