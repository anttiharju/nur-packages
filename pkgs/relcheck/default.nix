{
  lib,
  buildGoModule,
  fetchFromGitHub,
  gitMinimal,
  makeWrapper,
}:

buildGoModule rec {
  pname = "relcheck";
  version = "1.8.20";
  revision = "b9ec9a048c47a7597e1a03dccd130c6ba7fb9df1";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = revision;
    hash = "sha256-Z5aY+9XSnnmjAUhv8mqltNmgrJIJK/NVAclRhNYPBSo=";
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
    "-X main.time=2026-04-11T07:41:41Z"
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
