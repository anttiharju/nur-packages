{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.39";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "e98b2787ae509d3017464e7c2eec34b6e71e15be";
    hash = "sha256-jBb3PaUmlvk0s+hUswkwtdOyqtP7KzXWNWxJlnKe/ZA=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=e98b2787ae509d3017464e7c2eec34b6e71e15be"
    "-X main.version=1.0.39"
    "-X main.time=2025-10-27T22:21:22Z"
  ];

  vendorHash = null;
}
