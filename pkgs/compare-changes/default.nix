{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.1.1";
  revision = "2eae54ea003c479ba360245c29078b769c0125de";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-RTaK3jjgidXSzUDaK7low9e9EnL11DDh+v7vfcbR5GM=";
  };

  cargoLock = {
    lockFile = "./Cargo.lock";
  };

  meta = {
    homepage = "http://anttiharju.dev/compare-changes";
    description = "WIP";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
