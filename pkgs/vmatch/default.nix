{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.34";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "6b12787607bf6d5e66090af663045553daba61fc";
    hash = "sha256-353ImNpxYPh9p6lMHyugSvQ/kHb+LH0OnrpGvhURoOA=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=6b12787607bf6d5e66090af663045553daba61fc"
    "-X main.version=v1.0.34"
    "-X main.time=2025-10-27T18:30:26Z"
  ];

  vendorHash = null;
}
