{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.40";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "bdaa58af94cc335561f260edae8d1e072dc45ad4";
    hash = "sha256-H7DU0jUCMObvIGaCtixWk6MVycjUr014Nw5jd6O3Up8=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=bdaa58af94cc335561f260edae8d1e072dc45ad4"
    "-X main.version=1.0.40"
    "-X main.time=2025-10-28T13:20:21Z"
  ];

  vendorHash = null;
}
