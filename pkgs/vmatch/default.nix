{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "vmatch";
  version = "1.0.62";
  revision = "8fc0fdf56324a8eb2ca08bcd81956b0e84d91689";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = revision;
    hash = "sha256-aJvlGYbPZUL+UJ25R+80MJaIWKVSSaIqapBqjiAVbl4=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-buildid=nix-${version}"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-04-11T07:51:27Z"
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
