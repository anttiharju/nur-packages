{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.7.9";
  revision = "ccfc24ce7621c50b2ff84f26ccd63200796fce75";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-CFMjDmTV20oSYiS0l2vXMA+UqeVGRoa13f+c8Wzj4Nw=";
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
