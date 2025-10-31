{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.46";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "66cd2a3c3bbaf51ed44d397dc9f4ff9a272764a7";
    hash = "sha256-msfEDXe33pG4kfTPn7X69HpEdgHTppsr76vF5xMn00w=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=66cd2a3c3bbaf51ed44d397dc9f4ff9a272764a7"
    "-X main.version=1.0.46"
    "-X main.time=2025-10-31T11:05:35Z"
  ];

  vendorHash = null;
}
