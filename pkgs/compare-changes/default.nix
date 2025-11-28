{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.3.1";
  revision = "2846dbea9420fd45ce1902494cc0b41e3f913127";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-E6yOiHBVt9MvGVQiv4QCLmFGUk/YTAaD8hYb91/dLQY=";
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
