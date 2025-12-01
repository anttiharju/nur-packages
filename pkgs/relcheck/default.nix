{
  lib,
  buildGoModule,
  fetchFromGitHub,
  git,
  makeWrapper,
}:

buildGoModule rec {
  pname = "relcheck";
  version = "1.8.15";
  revision = "2beb1a2f930532ddeb4230100ae8a3b50c4e3cb5";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = revision;
    hash = "sha256-MO9MsS6+c20A2h+kWFQv23LkTXvHHPhVaDwyvL5WTHk=";
  };

  vendorHash = null;

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram "$out/bin/relcheck" \
      --prefix PATH : ${lib.makeBinPath [ git ]}
  '';

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2025-12-01T17:44:09Z"
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
