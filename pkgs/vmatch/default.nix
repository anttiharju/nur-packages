{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.50";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "f8b624ea829bf0c47a108ca6dab06bc9c6374ec7";
    hash = "sha256-upjmBIConAK4luN1OIQ+9aK8dffsA9Y72PAxZ1qJVt4=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=f8b624ea829bf0c47a108ca6dab06bc9c6374ec7"
    "-X main.version=1.0.50"
    "-X main.time=2025-11-08T14:05:14Z"
  ];

  vendorHash = null;
}
