{ buildGoModule, fetchFromGitHub, git }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.8";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "1e5ce0de0faa8b1a99d58d3ffc6a2c2f6eac6009";
    hash = "sha256-UolI2pJAjwZFmlcnEh2Uml76EVezKx5UluYP3n9xSh8=";
  };

  buildInputs = [ git ];

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=1e5ce0de0faa8b1a99d58d3ffc6a2c2f6eac6009"
    "-X main.version=1.8.8"
    "-X main.time=2025-11-08T15:38:18Z"
  ];

  vendorHash = null;
}
