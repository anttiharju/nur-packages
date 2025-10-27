{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.37";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "3c06e33fd181c8af41a731156ba445afcae60154";
    hash = "sha256-uenFqlAw2AE/T2OLw69u7Mx8CtYfrJzkijeaczTpqm8=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=3c06e33fd181c8af41a731156ba445afcae60154"
    "-X main.version=1.0.37"
    "-X main.time=2025-10-27T19:07:59Z"
  ];

  vendorHash = null;
}
