{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.48";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "f1e897fb4436af03c91c805c91710ec388813561";
    hash = "sha256-FCQbGMrQ1AnMQLoYaC3Ovm6qIBtgYMNfXtS1jLGPgLw=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=f1e897fb4436af03c91c805c91710ec388813561"
    "-X main.version=1.0.48"
    "-X main.time=2025-11-08T11:12:44Z"
  ];

  vendorHash = null;
}
