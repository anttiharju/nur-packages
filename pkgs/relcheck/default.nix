{
  lib,
  buildGoModule,
  fetchFromGitHub,
  git,
  makeWrapper,
}:

buildGoModule {
  pname = "relcheck";
  version = "1.8.10";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "577869c491fb851776fdc8e07f1bffb6e246b8ce";
    hash = "sha256-oZcWaKjfWzPYgyxYpn0d0MIa6733z6E6Z30UPfmKOGU=";
  };

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram "$out/bin/relcheck" \
      --prefix PATH : ${lib.makeBinPath [ git ]}
  '';

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=577869c491fb851776fdc8e07f1bffb6e246b8ce"
    "-X main.version=1.8.10"
    "-X main.time=2025-11-09T11:21:12Z"
  ];

  vendorHash = null;
}
