{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "vmatch";
  version = "0.0.0";
  revision = "0b24fa2f206b83c04ba801375ee9a40e6e97ec34";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = revision;
    hash = "sha256-4bgeJUbhPb3TObDYfX9grynbBgzyDqdhJXGqb0KqE+c=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-02-07T09:53:12Z"
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
