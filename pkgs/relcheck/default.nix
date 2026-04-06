{
  lib,
  buildGoModule,
  fetchFromGitHub,
  gitMinimal,
  makeWrapper,
}:

buildGoModule rec {
  pname = "relcheck";
  version = "0.0.0";
  revision = "e632ce3c54093eb599e36eeb94ba64c488208952";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = revision;
    hash = "sha256-H/vC906IIyttJmSZQr/cTT1gRJ88rnilBe9IOBIV2G4=";
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
    "-X main.time=2026-04-06T15:44:01Z"
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
