{
  lib,
  buildGoModule,
  fetchFromGitHub,
  git,
  makeWrapper,
}:

buildGoModule rec {
  pname = "relcheck";
  version = "0.0.0";
  revision = "63eb613a867273eeddeca7aa2459fa1481611b6d";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = revision;
    hash = "sha256-N75WOTsAG3uPqiFA+JWX4f2ZKy6p3ijwoMcRQ6gmaz8=";
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
    "-buildid=nix-${version}"
    "-X main.revision=${revision}"
    "-X main.version=${version}"
    "-X main.time=2026-02-07T10:27:45Z"
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
