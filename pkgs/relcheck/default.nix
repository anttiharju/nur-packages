{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.4";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "c1e374eba7fd027d5b360c57ba47b2f13d6f8396";
    hash = "sha256-qanGTsN1JxceMajbFO7DxfD+b5DuVuHT2ddFkmC3Cns=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=c1e374eba7fd027d5b360c57ba47b2f13d6f8396"
    "-X main.version=1.8.4"
    "-X main.time=2025-10-27T20:25:39Z"
  ];

  vendorHash = null;
}
