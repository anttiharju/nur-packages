{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "slack9";
  version = "0.5.7";
  revision = "10de37ff8ab38f30073db3bb97bc1cb7b3a2eac7";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "slack9";
    rev = revision;
    hash = "sha256-+HcXRQgUR79zrU6bCuvuyz+z82B3K+wswDqz0qYeR14=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  cargoBuildFlags = [ "--all-features" ];

  meta = {
    homepage = "https://anttiharju.dev/slack9";
    description = "🐵 Slack TUI to Track Your Mentions In Style!";
    changelog = "https://github.com/anttiharju/slack9/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "slack9";
  };
}
