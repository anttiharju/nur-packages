{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.7.39";
  revision = "23604797da663ffed0afeeb1d9f47cd546fd8bea";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-Fqj0Pr1Py83k2429ey8nnrRlfrjXp5lWsb2E0d/+pRw=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  cargoBuildFlags = [ "--all-features" ];

  meta = {
    homepage = "http://anttiharju.dev/compare-changes/";
    description = "For use with find-changes-action";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
