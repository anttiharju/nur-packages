{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "slack9";
  version = "0.4.1";
  revision = "54adea056227808c75289965aa6fd2231a704535";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "slack9";
    rev = revision;
    hash = "sha256-D06pCCyUmxB5zsg1jnxVlG5UvOZD9VSa8qd21+XXQtw=";
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
