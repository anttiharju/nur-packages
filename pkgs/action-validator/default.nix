{
  lib,
  rustPlatform,
  fetchFromGitHub,
  gitMinimal,
  makeWrapper,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "action-validator";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "mpalmer";
    repo = "action-validator";
    tag = "v${finalAttrs.version}";
    hash = "sha256-E0kqEzqw902Wg7QQNzOrtHQO9riSmAvDNcWIP3XmLSY=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-F8bJclpDpOdVET/dSIUYyP4DFcnhJDR2CV8poZtykko=";

  postPatch = ''
    substituteInPlace Cargo.toml --replace-fail 'version = "0.0.0-git"' 'version = "${finalAttrs.version}"'
  '';

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram "$out/bin/action-validator" \
      --prefix PATH : ${lib.makeBinPath [ gitMinimal ]}
  '';

  doCheck = false; # tests assume they would run in a git repository, and with Nix they do not

  meta = {
    description = "Tool to validate GitHub Action and Workflow YAML files";
    homepage = "https://github.com/mpalmer/action-validator";
    license = lib.licenses.gpl3Plus;
    mainProgram = "action-validator";
    maintainers = with lib.maintainers; [ anttiharju ];
  };
})
