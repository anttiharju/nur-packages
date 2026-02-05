{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "vmatch";
  version = "0.0.0";
  revision = "48a37c62a1ea66871bf874f18bd8beada17de125";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = revision;
    hash = "sha256-tkvHD0OlyWxN2NwVS+f++8uR5hJTP168Dj/WQ6yPguY=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-02-05T18:08:33Z"
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
