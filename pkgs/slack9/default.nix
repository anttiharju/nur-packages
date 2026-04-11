{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "slack9";
  version = "0.5.3";
  revision = "5d5c8f2ca44ae11a75331be7fb27db0c26894d7c";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "slack9";
    rev = revision;
    hash = "sha256-9bmsRx0kfkAMqN3MVLYL3I5/W5O3uSsqbzRJ3i0hfus=";
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
