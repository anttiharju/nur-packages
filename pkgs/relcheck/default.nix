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
  revision = "cfb773c696e8d0c99fc42e5abb2985560fb4d0b9";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = revision;
    hash = "sha256-5rk3G6W3mRRA5l8uTnYv8+YoVVEzTIiuIN0oIwfuTHY=";
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
    "-X main.time=2026-02-06T05:37:55Z"
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
