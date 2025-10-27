{ buildGoModule, fetchFromGitHub }:

buildGoModule {
  pname = "vmatch";
  version = "1.0.36";

  src = fetchFromGitHub {
    owner = "anttiharju";
    repo = "vmatch";
    rev = "d54e5aa02d01225a6e87d2ad8e56a207c65befa5";
    hash = "sha256-HIjBi7EPnTNKHdiXfEvdEWeKh5ZPdFrjPtjZk2rPQNI=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X main.revision=d54e5aa02d01225a6e87d2ad8e56a207c65befa5"
    "-X main.version=1.0.36"
    "-X main.time=2025-10-27T18:52:53Z"
  ];

  vendorHash = null;
}
