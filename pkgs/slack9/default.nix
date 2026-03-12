{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "slack9";
  version = "0.4.2";
  revision = "8465730b1d9ee38d7578d6c9054b5e7343397858";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "slack9";
    rev = revision;
    hash = "sha256-hBe1FEqCJxKt7+sEKvTv1XdeF7bMSnvk0fuscJ6aDNI=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = {
    homepage = "https://anttiharju.dev/slack9";
    description = "Enter cloud nine";
    changelog = "https://github.com/anttiharju/slack9/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "slack9";
  };
}
