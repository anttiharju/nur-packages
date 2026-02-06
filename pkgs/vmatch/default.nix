{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "vmatch";
  version = "0.0.0";
  revision = "c91f9ffa04b827d48f0b969ed4da9fcdbf10c9b9";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = revision;
    hash = "sha256-UK10Fq0yc6YUMd3EKhtYJrY39PAUx2o3l8cSc+Skj3I=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-02-06T05:43:04Z"
  ];

  meta = {
    homepage = "https://anttiharju.dev/vmatch";
    description = "Go and golangci-lint automation";
    changelog = "https://github.com/anttiharju/vmatch/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "vmatch";
  };
}
