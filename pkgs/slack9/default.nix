{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "slack9";
  version = "0.1.0";
  revision = "d345ed8b4f91c7800f22663596e4f95ccd5ab6cb";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "slack9";
    rev = revision;
    hash = "sha256-3JyNz+HOWdrRtaLjbbBKZyBn7Za+jC+n0dmhd1msXjE=";
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
