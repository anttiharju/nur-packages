{ buildGoModule, fetchFromGitHub, git }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.6";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "b4affa22f317929ce6ef8f8e29dbf3e0373d00d2";
    hash = "sha256-wYH9vNZ9ZFGsVFnD0pRNQ2h/DULcT+uaUy9gZ5i8oEE=";
  };

  buildInputs = [ git ];

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=b4affa22f317929ce6ef8f8e29dbf3e0373d00d2"
    "-X main.version=1.8.6"
    "-X main.time=2025-10-29T08:01:33Z"
  ];

  vendorHash = null;
}
