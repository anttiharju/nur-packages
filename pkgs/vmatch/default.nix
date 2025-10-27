{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.32";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "85d2d9a46d976f811d5184f604267bde90f99068";
    hash = "sha256-yH5DqZZNTyjOYJGaHlciA/hd+ebV2k/5JYUCg2g9a+Q=";
  };

  ldflags = [
    "-s"
    "-w"
    "-buildid=nix-1.0.32"
    "-trimpath"
  ];

  vendorHash = null;
}
