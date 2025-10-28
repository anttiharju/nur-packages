{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.43";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "ee4a794190503cc9b0a8209990ae6a7906e4c57c";
    hash = "sha256-4Wn43U8p25WMYmdeaEHDfXd7fGs+td+Kqe0affCW/5U=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=ee4a794190503cc9b0a8209990ae6a7906e4c57c"
    "-X main.version=1.0.43"
    "-X main.time=2025-10-28T15:43:59Z"
  ];

  vendorHash = null;
}
