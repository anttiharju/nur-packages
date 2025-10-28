{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.42";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "ef0d903aab71e1d3c711046f17cc49d9ff5d1dad";
    hash = "sha256-3j+Hv2QjWt8Rz9iBmeOnvLCfTANJnzu1NaICu0kVx5c=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=ef0d903aab71e1d3c711046f17cc49d9ff5d1dad"
    "-X main.version=1.0.42"
    "-X main.time=2025-10-28T15:01:33Z"
  ];

  vendorHash = null;
}
