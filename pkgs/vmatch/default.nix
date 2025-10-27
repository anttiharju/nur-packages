{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.35";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "0eb60124b01b1e1872373fc8eb373cb9fd8583a0";
    hash = "sha256-4rDN9yALZJkHSuR6Fdgmcsy8snmc78Ih3T0CsuiThoM=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=0eb60124b01b1e1872373fc8eb373cb9fd8583a0"
    "-X main.version=1.0.35"
    "-X main.time=2025-10-27T18:41:06Z"
  ];

  vendorHash = null;
}
