{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.44";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "095c47ed7879cd0431ff50a09048958fb5e8d0c4";
    hash = "sha256-jy/1AECbLCAF+sVVNtjW4edcC8M6e6fRIlEx+zmS/yc=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=095c47ed7879cd0431ff50a09048958fb5e8d0c4"
    "-X main.version=1.0.44"
    "-X main.time=2025-10-28T16:27:53Z"
  ];

  vendorHash = null;
}
