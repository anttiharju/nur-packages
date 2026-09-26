{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "compare-changes";
  version = "0.12.18";
  revision = "00012b3d61b80c94d686ee34e1500d8d0fa05f7a";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "compare-changes";
    rev = revision;
    hash = "sha256-k4qaY15UM3mQwLJGCgu/nd1DMIlFcKHcA1pl257yAsw=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  cargoBuildFlags = [ "--all-features" ];

  postPatch = ''
    substituteInPlace Cargo.toml --replace-fail \
      $'[package]\n' \
      $'[package]\nversion = "${version}"\n'
    substituteInPlace Cargo.lock "$cargoDepsCopy/Cargo.lock" --replace-fail \
      $'name = "compare-changes"\nversion = "0.0.0"' \
      $'name = "compare-changes"\nversion = "${version}"'
  '';

  meta = {
    homepage = "https://anttiharju.dev/compare-changes";
    description = "Lib & CLI for GitHub workflow paths filter syntax";
    changelog = "https://github.com/anttiharju/compare-changes/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "compare-changes";
  };
}
