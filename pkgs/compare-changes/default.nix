{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.2.2";
  revision = "7d2527e80635235d08b6d37d7c03a5f2fc0625c4";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-9rI4Nurk71b0rcG6vdTVVYNAdaXDUnBTaf9pzZWhklk=";
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
