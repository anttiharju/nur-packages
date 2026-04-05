{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "action-validator";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "mpalmer";
    repo = "action-validator";
    rev = "4249884ff1561279ceeab1f6a624eb0be52fd6ec";
    hash = "sha256-ZOvMY0UeYkwn9gz28hRSVMzM/LL3h5aIPE/Z1NVmGPE=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-F8bJclpDpOdVET/dSIUYyP4DFcnhJDR2CV8poZtykko=";

  postPatch = ''
    substituteInPlace Cargo.toml --replace-fail 'version = "0.0.0-git"' 'version = "${finalAttrs.version}"'
  '';

  doCheck = false;

  meta = {
    description = "Tool to validate GitHub Action and Workflow YAML files";
    homepage = "https://github.com/mpalmer/action-validator";
    license = lib.licenses.gpl3Plus;
    mainProgram = "action-validator";
    maintainers = with lib.maintainers; [ anttiharju ];
  };
})
