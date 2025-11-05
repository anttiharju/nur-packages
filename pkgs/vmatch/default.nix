{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.47";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "32fd24a3add2eb6969e9f801270535b1a87e3f0d";
    hash = "sha256-JEPliLL8vvrh8+Ajk0fnWvbIeK4dTtw0Yz3t2fu2jew=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=32fd24a3add2eb6969e9f801270535b1a87e3f0d"
    "-X main.version=1.0.47"
    "-X main.time=2025-11-05T20:32:02Z"
  ];

  vendorHash = null;
}
