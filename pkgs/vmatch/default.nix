{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.49";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "0eee4613131eef0e22440bf4e4a01c75f74e33b4";
    hash = "sha256-BqtU8ED5m0qg/qgFghnYVpSH/HjSyFqoZ+a4BbCozbY=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=0eee4613131eef0e22440bf4e4a01c75f74e33b4"
    "-X main.version=1.0.49"
    "-X main.time=2025-11-08T12:24:47Z"
  ];

  vendorHash = null;
}
