{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.38";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "94f079e17fea63b587725ce8dd9fdcca608920be";
    hash = "sha256-rMIEsyHbJ9urKX+uK2S0+stUEsUWZ+N74LPJOgmAg4Y=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=94f079e17fea63b587725ce8dd9fdcca608920be"
    "-X main.version=1.0.38"
    "-X main.time=2025-10-27T20:29:24Z"
  ];

  vendorHash = null;
}
