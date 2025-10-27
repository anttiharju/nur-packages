{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "relcheck";
  version = "1.8.3";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "relcheck";
    rev = "d35bf38c9438899f6edfd5460ab4ede7911ac89e";
    hash = "sha256-5IZQlmZ+8BRUuXasuYOG6C+HA26u8rNyJyFa4B/pOOA=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=d35bf38c9438899f6edfd5460ab4ede7911ac89e"
    "-X main.version=1.8.3"
    "-X main.time=2025-10-27T19:56:54Z"
  ];

  vendorHash = null;
}
