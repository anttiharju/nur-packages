{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.1.0";
  revision = "3b25ae9d3a529ecaac5c2d67e627279647704b29";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-R49g5w3Z5muAsbE45eFlZ4gf7T6aogU0n1d2ptLaxbA=";
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
