{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "vmatch";
  version = "0.0.0";
  revision = "59fbdee644fb39924761fa19159d3c657995f890";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = revision;
    hash = "sha256-YfRglchWKk6A92lK3RAVUvlW3lPCn6PG7jx75hF5GA8=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-buildid=nix-${version}"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-02-07T10:16:47Z"
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
