{
  lib,
  buildGoModule,
  fetchFromGitHub,
  gitMinimal,
  makeWrapper,
}:

buildGoModule rec {
  pname = "relcheck";
  version = "1.8.21";
  revision = "4ea5c2d574f219751ae2a08ee68295e3bd962452";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = revision;
    hash = "sha256-M1nCIQ/EXgST7o/qzj8xTLGu0K8FaWetgpJZr4OnpaA=";
  };

  vendorHash = null;

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram "$out/bin/relcheck" \
      --prefix PATH : ${lib.makeBinPath [ gitMinimal ]}
  '';

  ldflags = [
    "-s"
    "-w"
    "-buildid=nix-${version}"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-04-11T07:47:59Z"
  ];

  meta = {
    homepage = "https://anttiharju.dev/relcheck";
    description = "Performant relative link checker";
    changelog = "https://github.com/anttiharju/relcheck/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ anttiharju ];
    mainProgram = "relcheck";
  };
}
