{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.7.25";
  revision = "9fd4cd0bc8813c7f78bdbca660b3aaa2156ba6f7";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-IBlUXeOKx0WRvbyLHr7i9qU8N5gKgkj9XO8q/qjSczs=";
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
