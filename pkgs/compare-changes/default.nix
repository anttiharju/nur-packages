{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.7.31";
  revision = "43926be1138b463e9293cfff1e1db5c1427fe6da";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-uCHwyJ7+XAhBpXPKn/yvFtbTxI3Qaf1xkJj5OkpsaH8=";
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
