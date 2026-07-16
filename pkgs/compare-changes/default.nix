{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.9.1";
  revision = "72a8cb51bb2896672386fb011111abbbe4e802a3";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-it6dnyayboL/q68TOeqgOwcmps43ibjB0WIBtzcOP/I=";
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
